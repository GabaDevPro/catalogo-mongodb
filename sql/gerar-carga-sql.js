// =====================================================================
// gerar-carga-sql.js — lê o catálogo do MongoDB e gera sql/init/02-carga.sql
// Garante que os dois bancos têm EXATAMENTE os mesmos dados no comparativo.
// Rodar logo depois da carga do Mongo (antes do CRUD):
//   mongosh catalogo --quiet sql/gerar-carga-sql.js > sql/init/02-carga.sql   (mongosh instalado na máquina)
// (o arquivo 02-carga.sql já vem pronto no repositório; isto é só para regenerar)
// =====================================================================
db = db.getSiblingDB("catalogo");

const q = v => v === undefined || v === null ? "NULL"
  : typeof v === "number" || typeof v === "boolean" ? String(v)
  : "'" + String(v).replace(/'/g, "''") + "'";
const idProd = sku => `(SELECT id FROM produto WHERE sku = ${q(sku)})`;
const dia = d => q(d.toISOString().slice(0, 10));

const out = [];
out.push("-- Gerado automaticamente por sql/gerar-carga-sql.js a partir do MongoDB");
out.push("BEGIN;");

out.push("\n-- CLIENTES");
db.clientes.find().sort({ _id: 1 }).forEach(c =>
  out.push(`INSERT INTO cliente VALUES (${q(c._id)}, ${q(c.nome)}, ${q(c.email)}, ${q(c.cidade)}, ${q(c.uf)});`));

const autores = new Set();
db.produtos.find().sort({ sku: 1 }).forEach(p => {
  const e = p.especificacoes;
  out.push(`\n-- ${p.sku} — ${p.nome}`);
  out.push(`INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES (${q(p.sku)}, ${q(p.nome)}, ${q(p.categoria)}, ${q(p.marca)}, ${p.preco}, ${p.estoque}, ${q(p.descricao)}, ${dia(p.criadoEm)});`);
  (p.tags || []).forEach(t => out.push(`INSERT INTO produto_tag VALUES (${idProd(p.sku)}, ${q(t)});`));
  (e.cores || []).forEach(c => out.push(`INSERT INTO produto_cor VALUES (${idProd(p.sku)}, ${q(c)});`));

  if (p.categoria === "celular") {
    out.push(`INSERT INTO celular VALUES (${idProd(p.sku)}, ${e.armazenamentoGB}, ${e.ramGB}, ${e.telaPolegadas}, ${e.bateriaMah}, ${e.cameraMP}, ${e.suporta5G});`);
  } else if (p.categoria === "roupa") {
    out.push(`INSERT INTO roupa VALUES (${idProd(p.sku)}, ${q(e.genero)}, ${q(e.material)});`);
    e.grade.forEach(g => out.push(`INSERT INTO roupa_grade VALUES (${idProd(p.sku)}, ${q(g.tamanho)}, ${g.qtd});`));
  } else if (p.categoria === "livro") {
    out.push(`INSERT INTO livro VALUES (${idProd(p.sku)}, ${q(e.editora)}, ${e.paginas}, ${e.anoPublicacao}, ${q(e.idioma)}, ${q(e.genero)}, ${q(e.formato)}, ${q(e.edicao)});`);
    e.autores.forEach(a => {
      if (!autores.has(a)) { autores.add(a); out.push(`INSERT INTO autor (nome) VALUES (${q(a)});`); }
      out.push(`INSERT INTO livro_autor VALUES (${idProd(p.sku)}, (SELECT id FROM autor WHERE nome = ${q(a)}));`);
    });
  }
  p.avaliacoes.forEach(a => out.push(
    `INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES (${idProd(p.sku)}, ${q(a.clienteId)}, ${a.nota}, ${q(a.comentario)}, ${dia(a.data)});`));
});

out.push("\nCOMMIT;");
print(out.join("\n"));
