// =====================================================================
// 01-schema.js  —  cria as coleções, a validação e os índices
// Executado automaticamente pelo Docker na primeira subida
// (ou manualmente:  mongosh catalogo init/01-schema.js)
// =====================================================================
db = db.getSiblingDB("catalogo");

// Recomeça do zero (útil para rodar de novo sem recriar o container)
db.produtos.drop();
db.clientes.drop();

// ---------------------------------------------------------------------
// Coleção CLIENTES (pequena: quem escreve as avaliações)
// ---------------------------------------------------------------------
db.createCollection("clientes", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["_id", "nome", "email", "cidade", "uf"],
      properties: {
        _id:    { bsonType: "string", description: "código do cliente, ex.: C001" },
        nome:   { bsonType: "string" },
        email:  { bsonType: "string", pattern: "^.+@.+\\..+$" },
        cidade: { bsonType: "string" },
        uf:     { bsonType: "string", minLength: 2, maxLength: 2 }
      }
    }
  }
});

// ---------------------------------------------------------------------
// Coleção PRODUTOS
//  - campos COMUNS a todo produto ficam na raiz (sku, nome, preco...)
//  - campos que MUDAM por categoria ficam no subdocumento "especificacoes"
//    (celular tem RAM/tela, roupa tem tamanhos/cor, livro tem autores/ISBN)
//  - avaliações dos clientes ficam ANINHADAS no próprio produto
//  - "resumoAvaliacoes" guarda média e total já calculados
//
// A validação garante o mínimo (o que todo produto precisa ter) mas deixa
// "especificacoes" livre: é aí que está a flexibilidade do modelo.
// ---------------------------------------------------------------------
db.createCollection("produtos", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["sku", "nome", "categoria", "marca", "preco", "estoque",
                 "especificacoes", "avaliacoes", "resumoAvaliacoes"],
      properties: {
        sku:       { bsonType: "string", description: "código único do produto" },
        nome:      { bsonType: "string" },
        categoria: { bsonType: "string", description: "celular, roupa, livro..." },
        marca:     { bsonType: "string" },
        preco:     { bsonType: "number", minimum: 0 },
        estoque:   { bsonType: "number", minimum: 0 },
        tags:      { bsonType: "array", items: { bsonType: "string" } },
        especificacoes: { bsonType: "object", description: "atributos próprios da categoria" },
        avaliacoes: {
          bsonType: "array",
          items: {
            bsonType: "object",
            required: ["clienteId", "cliente", "nota", "data"],
            properties: {
              clienteId:  { bsonType: "string" },
              cliente:    { bsonType: "string" },
              nota:       { bsonType: "int", minimum: 1, maximum: 5 },
              comentario: { bsonType: "string" },
              data:       { bsonType: "date" }
            }
          }
        },
        resumoAvaliacoes: {
          bsonType: "object",
          required: ["media", "total"],
          properties: {
            media: { bsonType: "number", minimum: 0, maximum: 5 },
            total: { bsonType: "number", minimum: 0 }
          }
        }
      }
    }
  },
  validationAction: "error"
});

// ---------------------------------------------------------------------
// ÍNDICES — cada um existe por causa de uma consulta (ver docs/modelagem.md)
// ---------------------------------------------------------------------
db.produtos.createIndex({ sku: 1 }, { unique: true, name: "sku_unico" });
db.produtos.createIndex({ categoria: 1, preco: 1 }, { name: "categoria_preco" });          // Q1, Q3 e filtros por categoria
db.produtos.createIndex({ "especificacoes.autores": 1 }, { name: "livro_autores" });       // Q2 (índice multikey: campo é array)
db.produtos.createIndex({ "resumoAvaliacoes.media": -1 }, { name: "melhor_avaliados" });   // Q4
db.produtos.createIndex(
  { nome: "text", descricao: "text", tags: "text" },
  { name: "busca_texto", default_language: "portuguese",
    weights: { nome: 10, tags: 5, descricao: 1 } }                                         // Q7
);

print("✔ Coleções 'produtos' e 'clientes' criadas com validação e índices.");
