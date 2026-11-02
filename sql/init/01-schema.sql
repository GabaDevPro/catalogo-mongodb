-- =====================================================================
-- 01-schema.sql — o MESMO catálogo modelado no relacional (PostgreSQL)
-- Para comparar com o MongoDB. Sobe com: docker compose --profile sql up -d
--
-- Repare: no MongoDB são 2 coleções. Aqui viram 11 tabelas, porque
--  • cada categoria tem atributos diferentes  → 1 tabela por categoria
--  • listas (cores, tags, grade, autores)     → 1 tabela para cada lista
--  • avaliações                               → tabela própria com FK
-- =====================================================================

CREATE TABLE cliente (
    id      VARCHAR(4)   PRIMARY KEY,               -- C001
    nome    VARCHAR(100) NOT NULL,
    email   VARCHAR(120) NOT NULL UNIQUE,
    cidade  VARCHAR(60)  NOT NULL,
    uf      CHAR(2)      NOT NULL
);

-- Atributos COMUNS a todo produto
CREATE TABLE produto (
    id         SERIAL        PRIMARY KEY,
    sku        VARCHAR(10)   NOT NULL UNIQUE,
    nome       VARCHAR(150)  NOT NULL,
    categoria  VARCHAR(20)   NOT NULL CHECK (categoria IN ('celular', 'roupa', 'livro')),
    marca      VARCHAR(60)   NOT NULL,
    preco      NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    estoque    INT           NOT NULL CHECK (estoque >= 0),
    descricao  TEXT,
    criado_em  TIMESTAMP     NOT NULL DEFAULT now()
);

CREATE TABLE produto_tag (
    produto_id INT         NOT NULL REFERENCES produto(id) ON DELETE CASCADE,
    tag        VARCHAR(40) NOT NULL,
    PRIMARY KEY (produto_id, tag)
);

CREATE TABLE produto_cor (
    produto_id INT         NOT NULL REFERENCES produto(id) ON DELETE CASCADE,
    cor        VARCHAR(40) NOT NULL,
    PRIMARY KEY (produto_id, cor)
);

-- Atributos ESPECÍFICOS de cada categoria (relação 1:1 com produto)
CREATE TABLE celular (
    produto_id       INT PRIMARY KEY REFERENCES produto(id) ON DELETE CASCADE,
    armazenamento_gb INT          NOT NULL,
    ram_gb           INT          NOT NULL,
    tela_polegadas   NUMERIC(4,2) NOT NULL,
    bateria_mah      INT          NOT NULL,
    camera_mp        INT          NOT NULL,
    suporta_5g       BOOLEAN      NOT NULL
);

CREATE TABLE roupa (
    produto_id INT PRIMARY KEY REFERENCES produto(id) ON DELETE CASCADE,
    genero     VARCHAR(20)  NOT NULL,
    material   VARCHAR(100) NOT NULL
);

CREATE TABLE roupa_grade (
    produto_id INT         NOT NULL REFERENCES roupa(produto_id) ON DELETE CASCADE,
    tamanho    VARCHAR(4)  NOT NULL,
    qtd        INT         NOT NULL CHECK (qtd >= 0),
    PRIMARY KEY (produto_id, tamanho)
);

CREATE TABLE livro (
    produto_id     INT PRIMARY KEY REFERENCES produto(id) ON DELETE CASCADE,
    editora        VARCHAR(60) NOT NULL,
    paginas        INT         NOT NULL,
    ano_publicacao INT         NOT NULL,
    idioma         VARCHAR(20) NOT NULL,
    genero         VARCHAR(30) NOT NULL,
    formato        VARCHAR(20) NOT NULL,
    edicao         INT
);

CREATE TABLE autor (
    id   SERIAL       PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE livro_autor (                          -- N:N livro x autor
    produto_id INT NOT NULL REFERENCES livro(produto_id) ON DELETE CASCADE,
    autor_id   INT NOT NULL REFERENCES autor(id),
    PRIMARY KEY (produto_id, autor_id)
);

CREATE TABLE avaliacao (
    id         SERIAL     PRIMARY KEY,
    produto_id INT        NOT NULL REFERENCES produto(id) ON DELETE CASCADE,
    cliente_id VARCHAR(4) NOT NULL REFERENCES cliente(id),
    nota       SMALLINT   NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data       DATE       NOT NULL,
    UNIQUE (produto_id, cliente_id)                 -- 1 avaliação por cliente por produto
);

CREATE INDEX idx_produto_categoria_preco ON produto (categoria, preco);
CREATE INDEX idx_avaliacao_produto       ON avaliacao (produto_id);
CREATE INDEX idx_avaliacao_cliente       ON avaliacao (cliente_id);
