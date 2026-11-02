-- =====================================================================
-- consultas.sql — consultas do MongoDB reescritas em SQL (PostgreSQL)
-- Rodar:  docker exec -it catalogo-postgres psql -U aluno -d catalogo -f /sql/consultas.sql
-- =====================================================================

\echo '======================================================================'
\echo ' Q1 (SQL). Celulares 5G com 8GB+ de RAM até R$ 3.000'
\echo '======================================================================'
-- MongoDB: 1 coleção, filtro direto em especificacoes.*
-- SQL:     JOIN produto + celular (os atributos estão em outra tabela)
SELECT p.nome,
       p.preco,
       c.armazenamento_gb,
       c.ram_gb
FROM produto p
JOIN celular c ON c.produto_id = p.id
WHERE p.categoria = 'celular'
  AND p.preco    <= 3000
  AND c.suporta_5g = TRUE
  AND c.ram_gb  >= 8
ORDER BY p.preco;

\echo '======================================================================'
\echo ' Q4 (SQL). Top 5 mais bem avaliados (pelo menos 3 avaliações)'
\echo '======================================================================'
-- MongoDB: lê o resumo já calculado dentro do documento
-- SQL:     calcula a média na hora com JOIN + GROUP BY + HAVING
SELECT p.nome,
       p.categoria,
       ROUND(AVG(a.nota), 2) AS media,
       COUNT(*)              AS total
FROM produto p
JOIN avaliacao a ON a.produto_id = p.id
GROUP BY p.id, p.nome, p.categoria
HAVING COUNT(*) >= 3
ORDER BY media DESC, total DESC, p.nome   -- desempate igual ao do MongoDB
LIMIT 5;

\echo '======================================================================'
\echo ' EXTRA (SQL). Página do produto CEL-004 (o "ponto forte" do MongoDB)'
\echo '======================================================================'
-- MongoDB: findOne({ sku: "CEL-004" }) → 1 documento, 0 JOINs
-- SQL:     6 tabelas para montar a mesma página, e o resultado vem
--          "repetido" (1 linha por avaliação) — a aplicação ainda precisa
--          reagrupar tags e cores
SELECT p.sku, p.nome, p.marca, p.preco, p.estoque,
       c.armazenamento_gb, c.ram_gb, c.tela_polegadas, c.suporta_5g,
       (SELECT string_agg(cor, ', ') FROM produto_cor pc WHERE pc.produto_id = p.id) AS cores,
       (SELECT string_agg(tag, ', ') FROM produto_tag pt WHERE pt.produto_id = p.id) AS tags,
       cl.nome AS cliente, a.nota, a.comentario, a.data
FROM produto p
JOIN celular   c  ON c.produto_id = p.id
LEFT JOIN avaliacao a  ON a.produto_id = p.id
LEFT JOIN cliente   cl ON cl.id = a.cliente_id
WHERE p.sku = 'CEL-004'
ORDER BY a.data DESC
LIMIT 3;
