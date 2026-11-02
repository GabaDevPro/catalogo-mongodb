// =====================================================================
// 01-crud.js  —  INSERIR, CONSULTAR, ATUALIZAR e EXCLUIR
// Rodar:  docker exec -it catalogo-mongo mongosh catalogo /scripts/01-crud.js
// Pode rodar quantas vezes quiser: ele limpa o que criou no começo.
// =====================================================================
db = db.getSiblingDB("catalogo");

// Imprime objetos de forma compacta (arrays curtos numa linha só)
const util = require("util");
function exibir(x) { print(util.inspect(x, { compact: 3, breakLength: 100, depth: 8 })); }
function titulo(t) { print("\n" + "=".repeat(70) + "\n " + t + "\n" + "=".repeat(70)); }

// limpeza de execuções anteriores
db.produtos.deleteMany({ sku: { $in: ["CEL-011", "LIV-013"] } });

// ---------------------------------------------------------------------
titulo("1. INSERIR — insertOne de um celular novo");
// ---------------------------------------------------------------------
let r = db.produtos.insertOne({
  sku: "CEL-011",
  nome: "Smartphone Samsung Galaxy Z Flip6 256GB",
  categoria: "celular",
  marca: "Samsung",
  preco: 5499.00,
  estoque: 7,
  descricao: "Dobrável compacto com tela externa de 3,4 polegadas.",
  tags: ["smartphone", "android", "5g", "dobravel"],
  especificacoes: { armazenamentoGB: 256, ramGB: 12, telaPolegadas: 6.7, bateriaMah: 4000,
                    cameraMP: 50, suporta5G: true, dobravel: true, cores: ["Azul", "Menta"] },
  avaliacoes: [],
  resumoAvaliacoes: { media: 0, total: 0 },
  criadoEm: new Date()
});
exibir(r);

// ---------------------------------------------------------------------
titulo("2. INSERIR — insertMany (livro com um campo que nenhum outro tem)");
// ---------------------------------------------------------------------
r = db.produtos.insertMany([{
  sku: "LIV-013",
  nome: "MongoDB: Construa Novas Aplicações com Novas Tecnologias",
  categoria: "livro",
  marca: "Casa do Código",
  preco: 79.90,
  estoque: 20,
  descricao: "Introdução prática ao MongoDB em português.",
  tags: ["banco de dados", "nosql", "mongodb", "tecnologia"],
  especificacoes: { autores: ["Fernando Boaglio"], editora: "Casa do Código", paginas: 200,
                    anoPublicacao: 2015, idioma: "português", genero: "tecnologia",
                    formato: "e-book", tamanhoArquivoMB: 4.2 },   // <- campo só deste produto
  avaliacoes: [],
  resumoAvaliacoes: { media: 0, total: 0 },
  criadoEm: new Date()
}]);
exibir(r);

// ---------------------------------------------------------------------
titulo("3. CONSULTAR — findOne pelo SKU (só alguns campos)");
// ---------------------------------------------------------------------
exibir(db.produtos.findOne(
  { sku: "CEL-011" },
  { _id: 0, sku: 1, nome: 1, preco: 1, estoque: 1, "especificacoes.ramGB": 1, "especificacoes.dobravel": 1 }
));

// ---------------------------------------------------------------------
titulo("4. CONSULTAR — find: livros de tecnologia até R$ 100, mais baratos primeiro");
// ---------------------------------------------------------------------
console.table(db.produtos.find(
  { categoria: "livro", "especificacoes.genero": "tecnologia", preco: { $lte: 100 } },
  { _id: 0, sku: 1, nome: 1, preco: 1 }
).sort({ preco: 1 }).toArray());

// ---------------------------------------------------------------------
titulo("5. ATUALIZAR — updateOne: baixa o preço e repõe estoque do Z Flip6");
// ---------------------------------------------------------------------
r = db.produtos.updateOne(
  { sku: "CEL-011" },
  { $set: { preco: 4999.00 }, $inc: { estoque: 5 }, $push: { tags: "promocao" } }
);
exibir(r);
exibir(db.produtos.findOne({ sku: "CEL-011" }, { _id: 0, sku: 1, preco: 1, estoque: 1, tags: 1 }));

// ---------------------------------------------------------------------
titulo("6. ATUALIZAR — updateOne dentro do array: +3 camisetas no tamanho M");
// ---------------------------------------------------------------------
// O operador posicional $ altera SÓ o item da grade que casou no filtro
r = db.produtos.updateOne(
  { sku: "ROU-001", "especificacoes.grade.tamanho": "M" },
  { $inc: { "especificacoes.grade.$.qtd": 3, estoque: 3 } }
);
exibir(r);
exibir(db.produtos.findOne({ sku: "ROU-001" }, { _id: 0, sku: 1, estoque: 1, "especificacoes.grade": 1 }));

// ---------------------------------------------------------------------
titulo("7. ATUALIZAR — updateMany: frete grátis para produtos de R$ 299 ou mais");
// ---------------------------------------------------------------------
// $addToSet não duplica a tag se o script rodar de novo
r = db.produtos.updateMany({ preco: { $gte: 299 } }, { $addToSet: { tags: "frete-gratis" } });
exibir(r);

// ---------------------------------------------------------------------
titulo("8. EXCLUIR — deleteOne do Z Flip6 inserido no passo 1");
// ---------------------------------------------------------------------
exibir(db.produtos.deleteOne({ sku: "CEL-011" }));

// ---------------------------------------------------------------------
titulo("9. EXCLUIR — deleteMany de todos os e-books");
// ---------------------------------------------------------------------
exibir(db.produtos.deleteMany({ "especificacoes.formato": "e-book" }));

print(`\nTotal de produtos no catálogo agora: ${db.produtos.countDocuments()}`);
