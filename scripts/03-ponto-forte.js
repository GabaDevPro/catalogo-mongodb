// =====================================================================
// 03-ponto-forte.js  —  o que o modelo de DOCUMENTOS faz bem
//   A) página do produto inteira em UMA leitura (documento aninhado)
//   B) nova avaliação + nova média numa única operação atômica
//   C) flexível, mas com regras: a validação barra dados errados
//   D) categoria nova sem ALTER TABLE e sem tabela nova
// Rodar:  docker exec -it catalogo-mongo mongosh catalogo /scripts/03-ponto-forte.js
// =====================================================================
db = db.getSiblingDB("catalogo");

// Imprime objetos de forma compacta (arrays curtos numa linha só)
const util = require("util");
function exibir(x) { print(util.inspect(x, { compact: 3, breakLength: 100, depth: 8 })); }
function titulo(t) { print("\n" + "=".repeat(70) + "\n " + t + "\n" + "=".repeat(70)); }

// Pipeline de atualização que recalcula o resumo a partir do próprio array
const recalcularResumo = {
  $set: {
    resumoAvaliacoes: {
      media: { $round: [{ $ifNull: [{ $avg: "$avaliacoes.nota" }, 0] }, 2] },
      total: { $size: "$avaliacoes" }
    }
  }
};

// Limpeza de execuções anteriores (deixa o banco como a carga deixou)
db.produtos.updateOne({ sku: "CEL-004" }, [
  { $set: { avaliacoes: { $filter: { input: "$avaliacoes", cond: { $ne: ["$$this.clienteId", "C010"] } } } } },
  recalcularResumo
]);
db.produtos.deleteMany({ categoria: "fone de ouvido" });

// ---------------------------------------------------------------------
titulo("A) Página do produto: dados + especificações + 3 últimas avaliações em 1 leitura");
// No relacional seriam JOINs entre produto, celular, avaliacao e cliente.
// Aqui tudo já está junto no documento: o banco lê 1 documento e pronto.
// ---------------------------------------------------------------------
const pagina = db.produtos.findOne(
  { sku: "CEL-004" },
  { _id: 0, criadoEm: 0, avaliacoes: { $slice: -3 } }     // $slice: só as 3 mais recentes
);
exibir(pagina);

const stats = db.produtos.find({ sku: "CEL-004" }).explain("executionStats").executionStats;
print(`\n   → documentos lidos: ${stats.totalDocsExamined} | chaves de índice lidas: ${stats.totalKeysExamined} | tempo: ${stats.executionTimeMillis} ms | JOINs: 0`);

// ---------------------------------------------------------------------
titulo("B) Cliente avalia o iPhone 16: entra a avaliação E a média é recalculada");
// Uma única updateOne = operação atômica no documento.
// Ninguém consegue ler o produto com a avaliação nova e a média antiga.
// O filtro também impede o mesmo cliente de avaliar duas vezes.
// ---------------------------------------------------------------------
print("ANTES:");
exibir(db.produtos.findOne({ sku: "CEL-004" }, { _id: 0, nome: 1, resumoAvaliacoes: 1 }));

const novaAvaliacao = {
  clienteId: "C010",
  cliente: db.clientes.findOne({ _id: "C010" }).nome,
  nota: 2,
  comentario: "Esquentou muito carregando, esperava mais pelo preço.",
  data: new Date()
};

const r = db.produtos.updateOne(
  { sku: "CEL-004", "avaliacoes.clienteId": { $ne: novaAvaliacao.clienteId } },
  [
    { $set: { avaliacoes: { $concatArrays: ["$avaliacoes", [novaAvaliacao]] } } },
    recalcularResumo
  ]
);
print(`\nupdateOne → modificados: ${r.modifiedCount}`);
print("DEPOIS:");
exibir(db.produtos.findOne({ sku: "CEL-004" }, { _id: 0, nome: 1, resumoAvaliacoes: 1, avaliacoes: { $slice: -1 } }));

const repetida = db.produtos.updateOne(
  { sku: "CEL-004", "avaliacoes.clienteId": { $ne: novaAvaliacao.clienteId } },
  [ { $set: { avaliacoes: { $concatArrays: ["$avaliacoes", [novaAvaliacao]] } } }, recalcularResumo ]
);
print(`\nMesmo cliente tentando avaliar de novo → modificados: ${repetida.modifiedCount} (bloqueado pelo filtro)`);

// ---------------------------------------------------------------------
titulo("C) Esquema flexível, mas com regra: avaliação com nota 7 é recusada");
// ---------------------------------------------------------------------
try {
  db.produtos.updateOne(
    { sku: "LIV-001" },
    { $push: { avaliacoes: { clienteId: "C001", cliente: "Ana Beatriz Souza", nota: 7, data: new Date() } } }
  );
  print("   (não deveria chegar aqui)");
} catch (e) {
  const motivo = e.message.includes("failed validation") ? "Document failed validation" : e.message;
  print(`   ✘ Recusado pelo banco: ${motivo}`);
  print("   → a validação $jsonSchema exige nota inteira entre 1 e 5");
}

// ---------------------------------------------------------------------
titulo("D) Categoria nova (fone de ouvido) sem ALTER TABLE e sem tabela nova");
// O documento simplesmente tem outros campos em 'especificacoes'
// ---------------------------------------------------------------------
db.produtos.insertOne({
  sku: "FON-001",
  nome: "Fone de Ouvido JBL Tune 520BT",
  categoria: "fone de ouvido",
  marca: "JBL",
  preco: 249.90,
  estoque: 30,
  descricao: "Fone on-ear sem fio com até 57 horas de bateria.",
  tags: ["fone", "bluetooth", "audio"],
  especificacoes: { tipo: "on-ear", conexao: "Bluetooth 5.3", bateriaHoras: 57,
                    cancelamentoRuido: false, microfone: true, cores: ["Preto", "Azul", "Branco"] },
  avaliacoes: [],
  resumoAvaliacoes: { media: 0, total: 0 },
  criadoEm: new Date()
});

print("Mesma coleção, formatos diferentes de 'especificacoes':");
db.produtos.find(
  { sku: { $in: ["CEL-006", "ROU-009", "LIV-008", "FON-001"] } },
  { _id: 0, sku: 1, categoria: 1, especificacoes: 1 }
).forEach(d => print(`\n${d.sku} (${d.categoria}) → campos: ${Object.keys(d.especificacoes).join(", ")}`));

db.produtos.deleteOne({ sku: "FON-001" });   // tira o exemplo para não mexer nas outras consultas
print("\n(exemplo FON-001 removido para manter a carga original)");
