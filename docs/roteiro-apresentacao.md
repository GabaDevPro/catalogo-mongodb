# Roteiro da apresentação (15 min + 5 de perguntas)

Todos precisam falar e **todos precisam saber explicar qualquer parte** (o professor pode perguntar a qualquer um). Abaixo a sugestão com 4 integrantes; com 3, junte as partes 3 e 4.

## Antes de começar (5 min antes, no notebook da demo)

```bash
docker compose up -d
docker exec -it catalogo-mongo mongosh catalogo /docker-entrypoint-initdb.d/01-schema.js
docker exec -it catalogo-mongo mongosh catalogo /docker-entrypoint-initdb.d/02-carga.js
docker compose --profile sql up -d
```

Deixe abertos: o terminal, o README no GitHub e o MongoDB Compass conectado em `localhost:27017`.

**Plano B:** se a demo falhar, o vídeo gravado custa só 0,1. Gravem a execução completa dos 3 scripts antes do dia.

## Divisão

| Tempo | Quem | O quê | Mostrar |
|---|---|---|---|
| 0:00–1:30 | Integrante 1 | Por que MongoDB (e não CouchDB/Firestore) | README, linha do topo |
| 1:30–4:30 | Integrante 1 | Modelagem: 1 coleção, `especificacoes` por categoria, avaliações aninhadas, resumo pré-calculado | Compass: abrir 1 celular, 1 roupa e 1 livro lado a lado |
| 4:30–7:00 | Integrante 2 | Carga (32 produtos, 91 avaliações) e CRUD | `01-crud.js` rodando |
| 7:00–11:00 | Integrante 3 | As consultas Q1 a Q8, comentando 2 ou 3 com calma (Q1, Q3, Q5) | `02-consultas.js` rodando |
| 11:00–13:00 | Integrante 3 | Ponto forte: página em 1 leitura, avaliação atômica, nota 7 recusada, categoria nova | `03-ponto-forte.js` rodando |
| 13:00–15:00 | Integrante 4 | Comparativo: 2 coleções x 11 tabelas, Q1 e Q4 em SQL, conclusão | `consultas.sql` rodando + diagrama ER |

## Frases-chave para cada parte

- **Modelagem:** "A gente modelou pelo jeito que o site lê: a página do produto precisa de tudo junto, então tudo fica no mesmo documento."
- **Flexibilidade:** "Celular, roupa e livro estão na mesma coleção com campos diferentes. Para uma categoria nova não tem ALTER TABLE."
- **Ponto forte:** "A página do produto lê 1 documento, com 0 JOINs. No PostgreSQL a mesma página junta 6 tabelas."
- **Conclusão:** "Para catálogo, documentos. Para pedido e pagamento, relacional."

## Perguntas que o professor provavelmente vai fazer

**"Se o MongoDB não tem esquema, como vocês garantem que os dados estão certos?"**
Com validação `$jsonSchema` na coleção (arquivo `init/01-schema.js`). Ela exige os campos comuns e nota inteira de 1 a 5. O script `03-ponto-forte.js` mostra o banco recusando nota 7.

**"Por que as avaliações ficam dentro do produto e não numa coleção separada?"**
Porque elas são sempre lidas junto com o produto. Assim a página sai em uma leitura e a avaliação + média são gravadas numa operação atômica. A desvantagem é o limite de 16 MB por documento; num marketplace gigante usaríamos o padrão *subset*: só as últimas avaliações no produto e o histórico numa coleção separada.

**"E se o cliente mudar de nome? O nome está copiado nas avaliações."**
É a referência estendida: copiamos o nome porque a página mostra o nome sem precisar buscar `clientes`. Se mudar, um `updateMany` com filtro `avaliacoes.clienteId` e o operador `$[elem]` atualiza todas as cópias. Como nome muda raramente e a página é lida o tempo todo, compensa.

**"Por que guardar a média se dá para calcular?"**
Porque "mais bem avaliados" é consultado muito mais do que avaliações são escritas. Calculando na escrita, a consulta só ordena por um campo indexado (`melhor_avaliados`). No SQL a média é recalculada com GROUP BY em toda consulta.

**"O que é o `$elemMatch` da Q3?"**
Garante que **o mesmo item** do array atende às duas condições (tamanho "M" **e** qtd > 0). Sem ele, uma roupa com "M" zerado e "G" com estoque passaria no filtro, porque cada condição poderia casar com um item diferente.

**"O que é `$unwind`?"**
Abre o array: um produto com 4 avaliações vira 4 documentos, um para cada avaliação. Depois disso o `$group` consegue agrupar por categoria ou marca.

**"Como vocês sabem que o índice está sendo usado?"**
Pelo `explain()`. A Q1 e a Q2 imprimem o índice usado (`categoria_preco` e `livro_autores`), e a página do produto mostra que leu 1 documento e 1 chave de índice.

**"Que consulta o modelo de vocês faz mal?"**
"Todas as avaliações de um cliente." As avaliações estão espalhadas nos produtos, então precisa de `$unwind` em vários documentos. No SQL é um `WHERE cliente_id = ...` simples. Escolhemos otimizar a leitura mais comum do e-commerce.

**"O que é o operador `$` no `01-crud.js`, passo 6?"**
O operador posicional: atualiza só o item do array que casou com o filtro (`especificacoes.grade.tamanho: "M"`), sem reescrever a grade inteira.

**"Por que o PostgreSQL ficou com 11 tabelas?"**
Uma para os dados comuns do produto, uma para cada categoria (celular, roupa, livro) e uma para cada lista (tags, cores, grade, autores, livro_autor), mais cliente e avaliação. No relacional, cada lista vira tabela.
