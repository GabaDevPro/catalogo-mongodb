// =====================================================================
// 02-consultas.js  —  consultas do estudo de caso
// Rodar:  docker exec -it catalogo-mongo mongosh catalogo /scripts/02-consultas.js
// =====================================================================
db = db.getSiblingDB("catalogo");

function titulo(t) { print("\n" + "=".repeat(70) + "\n " + t + "\n" + "=".repeat(70)); }

// Mostra o resultado como tabela (achata subdocumentos: especificacoes.ramGB)
function achatar(obj, prefixo = "", saida = {}) {
  for (const [k, v] of Object.entries(obj)) {
    const chave = prefixo ? `${prefixo}.${k}` : k;
    if (v instanceof Date) saida[chave] = v.toISOString().slice(0, 10).split("-").reverse().join("/");
    else if (Array.isArray(v)) saida[chave] = v.map(x => (x && typeof x === "object") ? Object.values(x).join(":") : x).join(", ");
    else if (v && typeof v === "object" && !(v._bsontype)) achatar(v, chave, saida);
    else if (typeof v === "number" && !Number.isInteger(v)) saida[chave] = Math.round(v * 100) / 100;
    else saida[chave] = v;
  }
  return saida;
}
function mostrar(cursor) {
  const docs = cursor.toArray().map(d => achatar(d));
  if (!docs.length) return print("   (nenhum resultado)");
  console.table(docs);
  print(`   ${docs.length} documento(s)`);
}

// Mostra qual índice o banco usou (prova que a modelagem ajuda a consulta)
function indiceUsado(explain) {
  const nomes = [];
  (function andar(no) {
    if (!no) return;
    if (no.indexName) nomes.push(no.indexName);
    andar(no.inputStage);
    (no.inputStages || []).forEach(andar);
  })(explain.queryPlanner.winningPlan.queryPlan || explain.queryPlanner.winningPlan);
  print(`   → índice usado: ${nomes.length ? nomes.join(", ") : "nenhum (COLLSCAN)"}`);
}

// ---------------------------------------------------------------------
titulo("Q1. Celulares 5G com 8GB+ de RAM até R$ 3.000 (mais baratos primeiro)");
// Pergunta do cliente: "quero um 5G bom, gastando no máximo 3 mil"
// Filtra por atributos que SÓ celular tem (especificacoes.*) na mesma coleção
// ---------------------------------------------------------------------
const filtroQ1 = {
  categoria: "celular",
  preco: { $lte: 3000 },
  "especificacoes.suporta5G": true,
  "especificacoes.ramGB": { $gte: 8 }
};
mostrar(db.produtos.find(filtroQ1,
  { _id: 0, nome: 1, preco: 1, "especificacoes.ramGB": 1, "especificacoes.armazenamentoGB": 1 }
).sort({ preco: 1 }));
indiceUsado(db.produtos.find(filtroQ1).sort({ preco: 1 }).explain());

// ---------------------------------------------------------------------
titulo("Q2. Livros de Machado de Assis");
// "autores" é um array: o MongoDB procura dentro dele sem tabela extra
// ---------------------------------------------------------------------
const filtroQ2 = { "especificacoes.autores": "Machado de Assis" };
mostrar(db.produtos.find(filtroQ2,
  { _id: 0, nome: 1, preco: 1, "especificacoes.anoPublicacao": 1, "resumoAvaliacoes.media": 1 }
).sort({ "especificacoes.anoPublicacao": 1 }));
indiceUsado(db.produtos.find(filtroQ2).explain());

// ---------------------------------------------------------------------
titulo("Q3. Roupas que têm o tamanho M disponível");
// $elemMatch: o MESMO item da grade precisa ser tamanho M E ter qtd > 0
// A projeção posicional ($) devolve só o item da grade que casou (o M)
// ---------------------------------------------------------------------
mostrar(db.produtos.find(
  { categoria: "roupa", "especificacoes.grade": { $elemMatch: { tamanho: "M", qtd: { $gt: 0 } } } },
  { _id: 0, nome: 1, preco: 1, "especificacoes.grade.$": 1 }
).sort({ preco: 1 }));

// ---------------------------------------------------------------------
titulo("Q4. Top 5 produtos mais bem avaliados (com pelo menos 3 avaliações)");
// Usa o resumo pré-calculado: não precisa varrer as avaliações
// ---------------------------------------------------------------------
mostrar(db.produtos.find(
  { "resumoAvaliacoes.total": { $gte: 3 } },
  { _id: 0, nome: 1, categoria: 1, resumoAvaliacoes: 1 }
).sort({ "resumoAvaliacoes.media": -1, "resumoAvaliacoes.total": -1, nome: 1 }).limit(5));

// ---------------------------------------------------------------------
titulo("Q5. Nota média e quantidade de avaliações por categoria");
// Pipeline de agregação: abre o array ($unwind) e agrupa ($group)
// ---------------------------------------------------------------------
mostrar(db.produtos.aggregate([
  { $unwind: "$avaliacoes" },
  { $group: {
      _id: "$categoria",
      notaMedia:        { $avg: "$avaliacoes.nota" },
      totalAvaliacoes:  { $sum: 1 },
      produtosAvaliados:{ $addToSet: "$sku" }
  } },
  { $project: {
      _id: 0,
      categoria: "$_id",
      notaMedia: { $round: ["$notaMedia", 2] },
      totalAvaliacoes: "$totalAvaliacoes",
      produtosAvaliados: { $size: "$produtosAvaliados" }
  } },
  { $sort: { notaMedia: -1 } }
]));

// ---------------------------------------------------------------------
titulo("Q6. Reclamações recentes: avaliações com nota ≤ 2 desde agosto/2026");
// Serve para o SAC agir: qual produto, quem reclamou e o que disse
// ---------------------------------------------------------------------
mostrar(db.produtos.aggregate([
  { $match: { avaliacoes: { $elemMatch: { nota: { $lte: 2 }, data: { $gte: ISODate("2026-08-01") } } } } },
  { $unwind: "$avaliacoes" },
  { $match: { "avaliacoes.nota": { $lte: 2 }, "avaliacoes.data": { $gte: ISODate("2026-08-01") } } },
  { $project: {
      _id: 0,
      produto: "$nome",
      cliente: "$avaliacoes.cliente",
      nota: "$avaliacoes.nota",
      comentario: "$avaliacoes.comentario",
      data: { $dateToString: { format: "%d/%m/%Y", date: "$avaliacoes.data" } },
      dataOrdem: "$avaliacoes.data"
  } },
  { $sort: { dataOrdem: -1 } },
  { $unset: "dataOrdem" }
]));

// ---------------------------------------------------------------------
titulo("Q7. Busca na barra do site: \"camiseta algodão\" (ordenada por relevância)");
// Índice de texto em português: ignora acento/plural e dá peso maior ao nome
// ---------------------------------------------------------------------
mostrar(db.produtos.find(
  { $text: { $search: "camiseta algodão" } },
  { _id: 0, nome: 1, preco: 1, relevancia: { $meta: "textScore" } }
).sort({ relevancia: { $meta: "textScore" } }).limit(5));

// ---------------------------------------------------------------------
titulo("Q8. Marcas com melhor avaliação média (mínimo 5 avaliações)");
// ---------------------------------------------------------------------
mostrar(db.produtos.aggregate([
  { $unwind: "$avaliacoes" },
  { $group: { _id: "$marca", media: { $avg: "$avaliacoes.nota" }, avaliacoes: { $sum: 1 } } },
  { $match: { avaliacoes: { $gte: 5 } } },
  { $project: { _id: 0, marca: "$_id", media: { $round: ["$media", 2] }, avaliacoes: "$avaliacoes" } },
  { $sort: { media: -1 } }
]));
