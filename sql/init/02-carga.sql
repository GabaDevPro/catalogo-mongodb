-- Gerado automaticamente por sql/gerar-carga-sql.js a partir do MongoDB
BEGIN;

-- CLIENTES
INSERT INTO cliente VALUES ('C001', 'Ana Beatriz Souza', 'ana.souza@email.com', 'Palmas', 'TO');
INSERT INTO cliente VALUES ('C002', 'Bruno Henrique Lima', 'bruno.lima@email.com', 'Palmas', 'TO');
INSERT INTO cliente VALUES ('C003', 'Carla Mendes', 'carla.mendes@email.com', 'Araguaína', 'TO');
INSERT INTO cliente VALUES ('C004', 'Diego Alves Pereira', 'diego.pereira@email.com', 'Gurupi', 'TO');
INSERT INTO cliente VALUES ('C005', 'Eduarda Rocha', 'eduarda.rocha@email.com', 'Porto Nacional', 'TO');
INSERT INTO cliente VALUES ('C006', 'Felipe Carvalho', 'felipe.c@email.com', 'Goiânia', 'GO');
INSERT INTO cliente VALUES ('C007', 'Gabriela Nunes', 'gabi.nunes@email.com', 'Brasília', 'DF');
INSERT INTO cliente VALUES ('C008', 'Henrique Martins', 'h.martins@email.com', 'São Paulo', 'SP');
INSERT INTO cliente VALUES ('C009', 'Isabela Ferreira', 'isa.ferreira@email.com', 'Palmas', 'TO');
INSERT INTO cliente VALUES ('C010', 'João Pedro Barbosa', 'jp.barbosa@email.com', 'Imperatriz', 'MA');
INSERT INTO cliente VALUES ('C011', 'Larissa Teixeira', 'larissa.t@email.com', 'Paraíso do Tocantins', 'TO');
INSERT INTO cliente VALUES ('C012', 'Marcos Vinícius Dias', 'marcos.dias@email.com', 'Belém', 'PA');
INSERT INTO cliente VALUES ('C013', 'Natália Ribeiro', 'natalia.r@email.com', 'Palmas', 'TO');
INSERT INTO cliente VALUES ('C014', 'Otávio Gomes', 'otavio.gomes@email.com', 'Salvador', 'BA');
INSERT INTO cliente VALUES ('C015', 'Paula Cristina Araújo', 'paula.araujo@email.com', 'Gurupi', 'TO');

-- CEL-001 — Smartphone Samsung Galaxy S25 256GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-001', 'Smartphone Samsung Galaxy S25 256GB', 'celular', 'Samsung', 4999, 18, 'Topo de linha compacto com processador Snapdragon e câmera tripla de 50MP.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), '5g');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'premium');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'Azul');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'Prata');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'Grafite');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 256, 12, 6.2, 4000, 50, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'C008', 5, 'Câmera excelente e muito rápido.', '2026-03-02');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'C007', 5, 'Tamanho perfeito pra uma mão só.', '2026-04-18');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'C002', 4, 'Ótimo, mas a bateria podia durar mais.', '2026-06-10');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-001'), 'C014', 5, 'Melhor celular que já tive.', '2026-08-21');

-- CEL-002 — Smartphone Samsung Galaxy A56 5G 128GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-002', 'Smartphone Samsung Galaxy A56 5G 128GB', 'celular', 'Samsung', 2299, 40, 'Intermediário com tela Super AMOLED de 120Hz e 6 anos de atualizações.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), '5g');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'intermediario');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'Rosa');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'Cinza');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 128, 8, 6.7, 5000, 50, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'C001', 5, 'Tela linda e bateria dura o dia todo.', '2026-02-11');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'C004', 4, 'Bom custo-benefício.', '2026-03-27');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-002'), 'C011', 4, 'Esquenta um pouco nos jogos.', '2026-07-05');

-- CEL-003 — Smartphone Samsung Galaxy A16 128GB 4G
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-003', 'Smartphone Samsung Galaxy A16 128GB 4G', 'celular', 'Samsung', 1099, 65, 'Celular de entrada com tela grande e bateria de 5000mAh.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'entrada');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'Verde');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 128, 4, 6.7, 5000, 50, false);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'C010', 3, 'Funciona, mas trava com muitos apps abertos.', '2026-01-20');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'C015', 4, 'Pra quem só usa WhatsApp é ótimo.', '2026-05-14');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-003'), 'C003', 2, 'Lento demais, me arrependi.', '2026-09-03');

-- CEL-004 — iPhone 16 Apple 128GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-004', 'iPhone 16 Apple 128GB', 'celular', 'Apple', 5999, 12, 'Chip A18, botão de Ação e Controle da Câmera.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'ios');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), '5g');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'premium');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'Branco');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'Ultramarino');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 128, 8, 6.1, 3561, 48, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'C008', 5, 'Fluidez absurda.', '2026-02-25');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'C006', 4, 'Caro, mas vale.', '2026-04-02');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'C013', 5, 'Câmera incrível pra vídeo.', '2026-06-30');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'C012', 3, 'Carregador não vem na caixa.', '2026-08-08');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-004'), 'C007', 5, 'Recomendo demais.', '2026-10-12');

-- CEL-005 — iPhone 15 Apple 128GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-005', 'iPhone 15 Apple 128GB', 'celular', 'Apple', 4599, 9, 'Dynamic Island, câmera de 48MP e conector USB-C.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'ios');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), '5g');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'Azul');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'Rosa');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 128, 6, 6.1, 3349, 48, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'C009', 5, 'Chegou antes do prazo, perfeito.', '2026-03-15');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-005'), 'C014', 4, 'Muito bom, só a bateria que é média.', '2026-07-22');

-- CEL-006 — Smartphone Motorola Moto G85 5G 256GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-006', 'Smartphone Motorola Moto G85 5G 256GB', 'celular', 'Motorola', 1699, 55, 'Tela pOLED curva de 120Hz e som Dolby Atmos.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), '5g');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'intermediario');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'Azul');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'Grafite');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'Verde');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 256, 8, 6.67, 5000, 50, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'C002', 5, 'Melhor custo-benefício da Motorola.', '2026-01-30');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'C005', 5, 'Tela curva linda.', '2026-04-09');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'C011', 4, 'Muito bom, câmera noturna fraca.', '2026-06-17');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-006'), 'C001', 5, 'Comprei pro meu pai e ele amou.', '2026-09-25');

-- CEL-007 — Smartphone Motorola Edge 50 Fusion 256GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-007', 'Smartphone Motorola Edge 50 Fusion 256GB', 'celular', 'Motorola', 2199, 30, 'Design em couro vegano, resistência IP68 e carregamento de 68W.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), '5g');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 'Azul');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 'Rosa');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 256, 8, 6.7, 5000, 50, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 'C006', 4, 'Carrega muito rápido.', '2026-02-14');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-007'), 'C010', 5, 'Bonito e resistente.', '2026-05-03');

-- CEL-008 — Smartphone Xiaomi Redmi Note 14 Pro 5G 256GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-008', 'Smartphone Xiaomi Redmi Note 14 Pro 5G 256GB', 'celular', 'Xiaomi', 2499, 25, 'Câmera de 200MP e tela AMOLED de 1,5K.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), '5g');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'camera');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'Roxo');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 256, 8, 6.67, 5110, 200, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'C004', 5, 'Fotos impressionantes.', '2026-03-08');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'C012', 4, 'Muita propaganda no sistema.', '2026-04-29');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'C003', 5, 'Valeu cada centavo.', '2026-07-11');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-008'), 'C015', 2, 'Veio com defeito no alto-falante.', '2026-10-01');

-- CEL-009 — Smartphone Xiaomi Poco X7 Pro 512GB
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-009', 'Smartphone Xiaomi Poco X7 Pro 512GB', 'celular', 'Xiaomi', 2899, 14, 'Feito para jogos: Dimensity 8400 Ultra e 12GB de RAM.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), '5g');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'gamer');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'Verde');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'Amarelo');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 512, 12, 6.67, 6000, 50, true);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'C002', 5, 'Roda tudo no máximo.', '2026-02-03');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'C009', 5, 'Bateria absurda.', '2026-05-19');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-009'), 'C013', 4, 'Esquenta um pouco, mas nada demais.', '2026-08-26');

-- CEL-010 — Smartphone Realme C75 256GB 4G
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('CEL-010', 'Smartphone Realme C75 256GB 4G', 'celular', 'Realme', 1199, 0, 'Resistente a quedas e água, com 8GB de RAM.', '2025-12-01');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 'smartphone');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 'android');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 'entrada');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 'Dourado');
INSERT INTO celular VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 256, 8, 6.72, 6000, 50, false);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'CEL-010'), 'C005', 4, 'Muito armazenamento pelo preço.', '2026-04-21');

-- LIV-001 — Dom Casmurro
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-001', 'Dom Casmurro', 'livro', 'Penguin-Companhia', 34.9, 50, 'Clássico de Machado de Assis narrado por Bentinho: Capitu traiu ou não traiu?', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'classico');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'literatura brasileira');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'romance');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'Penguin-Companhia', 256, 1899, 'português', 'romance', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Machado de Assis');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), (SELECT id FROM autor WHERE nome = 'Machado de Assis'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'C001', 5, 'Leitura obrigatória.', '2026-02-02');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'C009', 5, 'Capitu é a melhor personagem da literatura brasileira.', '2026-04-11');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-001'), 'C011', 4, 'Edição bonita, letra boa.', '2026-07-29');

-- LIV-002 — Memórias Póstumas de Brás Cubas
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-002', 'Memórias Póstumas de Brás Cubas', 'livro', 'Penguin-Companhia', 39.9, 32, 'O defunto autor conta sua vida com ironia — marco do Realismo no Brasil.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), 'classico');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), 'literatura brasileira');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), 'realismo');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), 'Penguin-Companhia', 368, 1881, 'português', 'romance', 'brochura', NULL);
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), (SELECT id FROM autor WHERE nome = 'Machado de Assis'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), 'C013', 5, 'Genial do começo ao fim.', '2026-03-06');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-002'), 'C003', 4, 'Precisei ler pro vestibular e acabei gostando.', '2026-05-25');

-- LIV-003 — O Cortiço
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-003', 'O Cortiço', 'livro', 'Ática', 29.9, 40, 'Romance naturalista de Aluísio Azevedo sobre a vida num cortiço do Rio.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), 'classico');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), 'literatura brasileira');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), 'naturalismo');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), 'Ática', 240, 1890, 'português', 'romance', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Aluísio Azevedo');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), (SELECT id FROM autor WHERE nome = 'Aluísio Azevedo'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), 'C005', 3, 'Pesado, mas importante.', '2026-04-04');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-003'), 'C010', 4, 'Bom pra entender o naturalismo.', '2026-06-20');

-- LIV-004 — Torto Arado
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-004', 'Torto Arado', 'livro', 'Todavia', 59.9, 22, 'A história das irmãs Bibiana e Belonísia no sertão da Bahia.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'literatura brasileira');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'contemporaneo');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'premiado');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'Todavia', 264, 2019, 'português', 'romance', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Itamar Vieira Junior');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), (SELECT id FROM autor WHERE nome = 'Itamar Vieira Junior'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'C007', 5, 'Um dos melhores livros brasileiros recentes.', '2026-01-17');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'C014', 5, 'Emocionante.', '2026-03-30');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'C001', 5, 'Não consegui parar de ler.', '2026-06-08');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-004'), 'C015', 4, 'Começo lento, final maravilhoso.', '2026-09-11');

-- LIV-005 — Código Limpo: Habilidades Práticas do Agile Software
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-005', 'Código Limpo: Habilidades Práticas do Agile Software', 'livro', 'Alta Books', 89.9, 28, 'Como escrever código legível e fácil de manter.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'programacao');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'tecnologia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'boas praticas');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'Alta Books', 425, 2009, 'português', 'tecnologia', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Robert C. Martin');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), (SELECT id FROM autor WHERE nome = 'Robert C. Martin'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'C002', 5, 'Mudou meu jeito de programar.', '2026-02-09');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'C004', 4, 'Exemplos em Java, mas vale pra qualquer linguagem.', '2026-05-01');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-005'), 'C012', 4, 'Alguns capítulos são datados.', '2026-08-17');

-- LIV-006 — Entendendo Algoritmos
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-006', 'Entendendo Algoritmos', 'livro', 'Novatec', 74.9, 35, 'Guia ilustrado de algoritmos para programadores e curiosos.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'programacao');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'tecnologia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'algoritmos');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'Novatec', 264, 2017, 'português', 'tecnologia', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Aditya Y. Bhargava');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), (SELECT id FROM autor WHERE nome = 'Aditya Y. Bhargava'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'C009', 5, 'Os desenhos ajudam muito.', '2026-03-12');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'C002', 5, 'Perfeito pra quem tá começando.', '2026-06-27');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-006'), 'C011', 5, 'Didática excelente.', '2026-10-15');

-- LIV-007 — Sistemas de Banco de Dados
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-007', 'Sistemas de Banco de Dados', 'livro', 'Pearson', 289, 8, 'Referência clássica em modelagem, SQL, normalização e transações.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), 'banco de dados');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), 'tecnologia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), 'faculdade');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), 'Pearson', 788, 2018, 'português', 'tecnologia', 'brochura', 7);
INSERT INTO autor (nome) VALUES ('Ramez Elmasri');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), (SELECT id FROM autor WHERE nome = 'Ramez Elmasri'));
INSERT INTO autor (nome) VALUES ('Shamkant B. Navathe');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), (SELECT id FROM autor WHERE nome = 'Shamkant B. Navathe'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), 'C013', 5, 'A bíblia de banco de dados.', '2026-03-01');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-007'), 'C003', 3, 'Muito denso, preço alto.', '2026-08-05');

-- LIV-008 — NoSQL Essencial
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-008', 'NoSQL Essencial', 'livro', 'Novatec', 69.9, 15, 'Introdução aos bancos NoSQL: chave-valor, documentos, colunas e grafos.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'banco de dados');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'nosql');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'tecnologia');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'Novatec', 220, 2013, 'português', 'tecnologia', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Pramod J. Sadalage');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), (SELECT id FROM autor WHERE nome = 'Pramod J. Sadalage'));
INSERT INTO autor (nome) VALUES ('Martin Fowler');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), (SELECT id FROM autor WHERE nome = 'Martin Fowler'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'C002', 5, 'Usei pra estudar pro trabalho de NoSQL.', '2026-10-26');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'C006', 4, 'Curto e direto ao ponto.', '2026-04-23');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-008'), 'C008', 4, 'Bom panorama geral.', '2026-07-08');

-- LIV-009 — O Programador Pragmático
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-009', 'O Programador Pragmático', 'livro', 'Bookman', 119, 11, 'Dicas práticas para evoluir na carreira de desenvolvimento.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), 'programacao');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), 'tecnologia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), 'carreira');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), 'Bookman', 352, 2020, 'português', 'tecnologia', 'brochura', 2);
INSERT INTO autor (nome) VALUES ('David Thomas');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), (SELECT id FROM autor WHERE nome = 'David Thomas'));
INSERT INTO autor (nome) VALUES ('Andrew Hunt');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), (SELECT id FROM autor WHERE nome = 'Andrew Hunt'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), 'C004', 5, 'Todo dev deveria ler.', '2026-05-17');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-009'), 'C012', 5, 'Atemporal.', '2026-09-19');

-- LIV-010 — 1984
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-010', '1984', 'livro', 'Companhia das Letras', 49.9, 44, 'A distopia de George Orwell sobre vigilância e controle: o Grande Irmão está de olho.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'classico');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'distopia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'ficcao');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'Companhia das Letras', 416, 1949, 'português', 'ficção', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('George Orwell');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), (SELECT id FROM autor WHERE nome = 'George Orwell'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'C006', 5, 'Assustadoramente atual.', '2026-01-25');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'C010', 5, 'Clássico absoluto.', '2026-04-14');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'C005', 4, 'Final pesado.', '2026-07-16');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-010'), 'C014', 5, 'Li em dois dias.', '2026-10-09');

-- LIV-011 — A Revolução dos Bichos
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-011', 'A Revolução dos Bichos', 'livro', 'Companhia das Letras', 29.9, 60, 'Fábula de George Orwell sobre poder e corrupção numa fazenda.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'classico');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'fabula');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'ficcao');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'Companhia das Letras', 152, 1945, 'português', 'ficção', 'brochura', NULL);
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), (SELECT id FROM autor WHERE nome = 'George Orwell'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'C015', 5, 'Curto e genial.', '2026-02-16');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'C001', 4, 'Ótimo pra ler numa tarde.', '2026-06-01');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-011'), 'C003', 1, 'Livro chegou com páginas rasgadas.', '2026-09-21');

-- LIV-012 — Sapiens: Uma Breve História da Humanidade
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('LIV-012', 'Sapiens: Uma Breve História da Humanidade', 'livro', 'L&PM', 64.9, 27, 'Yuval Noah Harari conta a história da espécie humana em linguagem acessível.', '2025-10-20');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'historia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'nao ficcao');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'best-seller');
INSERT INTO livro VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'L&PM', 464, 2015, 'português', 'história', 'brochura', NULL);
INSERT INTO autor (nome) VALUES ('Yuval Noah Harari');
INSERT INTO livro_autor VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), (SELECT id FROM autor WHERE nome = 'Yuval Noah Harari'));
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'C008', 5, 'Abriu minha cabeça.', '2026-01-05');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'C007', 4, 'Algumas partes são especulativas.', '2026-05-12');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'LIV-012'), 'C012', 4, 'Muito bem escrito.', '2026-08-24');

-- ROU-001 — Camiseta Básica Algodão Hering Masculina
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-001', 'Camiseta Básica Algodão Hering Masculina', 'roupa', 'Hering', 49.9, 93, 'Camiseta gola careca 100% algodão, ideal para o dia a dia.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'camiseta');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'basica');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'algodao');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'masculino');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'Branco');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'Cinza');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'masculino', '100% algodão');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'P', 20);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'M', 35);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'G', 28);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'GG', 10);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'C002', 5, 'Tecido grosso, não desbota.', '2026-01-12');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'C004', 4, 'Veste bem, mas encolheu um pouco.', '2026-03-19');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'C010', 5, 'Já comprei 5.', '2026-06-06');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-001'), 'C014', 4, 'Bom pelo preço.', '2026-09-14');

-- ROU-002 — Calça Jeans Levi's 511 Slim Masculina
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-002', 'Calça Jeans Levi''s 511 Slim Masculina', 'roupa', 'Levi''s', 299.9, 22, 'Jeans com elastano, modelagem slim e lavagem média.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'calca');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'jeans');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'masculino');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'Azul médio');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'masculino', '98% algodão, 2% elastano');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), '38', 6);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), '40', 9);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), '42', 7);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), '44', 0);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'C006', 5, 'Caimento perfeito.', '2026-02-20');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-002'), 'C008', 4, 'Muito boa, mas o 44 sempre esgota.', '2026-05-30');

-- ROU-003 — Vestido Midi Floral Farm
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-003', 'Vestido Midi Floral Farm', 'roupa', 'Farm', 459, 10, 'Vestido midi em viscose com estampa floral exclusiva.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'vestido');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'floral');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'feminino');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'verao');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'Estampado');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'feminino', '100% viscose');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'PP', 2);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'P', 5);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'M', 0);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'G', 3);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'C007', 5, 'Estampa linda, recebi muitos elogios.', '2026-01-08');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'C001', 5, 'Tecido leve, perfeito pro calor de Palmas.', '2026-03-03');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-003'), 'C013', 3, 'Bonito, mas amassa fácil.', '2026-06-24');

-- ROU-004 — Moletom Canguru Nike Club Fleece
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-004', 'Moletom Canguru Nike Club Fleece', 'roupa', 'Nike', 349.9, 20, 'Moletom com capuz e bolso canguru, interior flanelado.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'moletom');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'inverno');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'unissex');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'Cinza mescla');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'unissex', '80% algodão, 20% poliéster');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'P', 4);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'M', 8);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'G', 6);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'GG', 2);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'C012', 5, 'Quentinho e confortável.', '2026-05-10');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'C003', 4, 'Bom, mas um pouco caro.', '2026-07-02');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-004'), 'C009', 1, 'Veio tamanho errado e a troca demorou.', '2026-09-29');

-- ROU-005 — Jaqueta Corta-Vento Adidas Essentials
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-005', 'Jaqueta Corta-Vento Adidas Essentials', 'roupa', 'Adidas', 399.9, 12, 'Jaqueta leve e repelente à água, com capuz embutido.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'jaqueta');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'esporte');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'unissex');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'Azul marinho');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'unissex', '100% poliéster reciclado');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'P', 3);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'M', 5);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'G', 4);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'C006', 4, 'Leve e prática.', '2026-04-15');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-005'), 'C011', 5, 'Uso pra correr de manhã.', '2026-08-03');

-- ROU-006 — Camisa Polo Lacoste Piquet Masculina
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-006', 'Camisa Polo Lacoste Piquet Masculina', 'roupa', 'Lacoste', 549, 9, 'Polo clássica em piquet de algodão com o crocodilo bordado.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'polo');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'masculino');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'classico');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'Branco');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'Verde');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'Azul marinho');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'masculino', '100% algodão piquet');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'P', 2);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'M', 4);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'G', 3);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'C008', 5, 'Qualidade impecável.', '2026-02-07');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'C014', 5, 'Original, chegou bem embalada.', '2026-06-15');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-006'), 'C006', 4, 'Cara, mas dura anos.', '2026-10-20');

-- ROU-007 — Bermuda Tactel Mormaii Masculina
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-007', 'Bermuda Tactel Mormaii Masculina', 'roupa', 'Mormaii', 89.9, 43, 'Bermuda de secagem rápida, com elástico e cordão.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'bermuda');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'praia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'verao');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'masculino');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'Azul');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'Verde');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'masculino', '100% poliéster');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'P', 10);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'M', 15);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'G', 12);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'GG', 6);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'C004', 4, 'Ótima pra ir na praia da Graciosa.', '2026-07-19');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-007'), 'C010', 5, 'Seca muito rápido.', '2026-09-07');

-- ROU-008 — Blusa Cropped Canelada Renner
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-008', 'Blusa Cropped Canelada Renner', 'roupa', 'Renner', 59.9, 28, 'Cropped canelado de alcinha, tecido com elastano.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'blusa');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'cropped');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'feminino');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'verao');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'Branco');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'Rosa');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'Preto');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'feminino', '95% viscose, 5% elastano');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'PP', 7);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'P', 12);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'M', 9);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'G', 0);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'C015', 4, 'Bonita, mas transparente na cor branca.', '2026-03-23');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'C005', 2, 'Costura desfez na primeira lavagem.', '2026-08-30');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-008'), 'C001', 4, 'Ótima pelo preço.', '2026-10-05');

-- ROU-009 — Calça Legging Fitness Track&Field
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-009', 'Calça Legging Fitness Track&Field', 'roupa', 'Track&Field', 179, 24, 'Legging de cintura alta com proteção UV e tecido que não marca.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'legging');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'fitness');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'academia');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'feminino');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'Vinho');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'feminino', '88% poliamida, 12% elastano');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'P', 8);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'M', 11);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'G', 5);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'C009', 5, 'Não fica transparente no agachamento!', '2026-02-28');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'C011', 5, 'Uso todo dia na academia.', '2026-05-08');
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-009'), 'C013', 5, 'A melhor legging que já comprei.', '2026-08-12');

-- ROU-010 — Camiseta Dry Fit Olympikus Masculina
INSERT INTO produto (sku, nome, categoria, marca, preco, estoque, descricao, criado_em) VALUES ('ROU-010', 'Camiseta Dry Fit Olympikus Masculina', 'roupa', 'Olympikus', 69.9, 4, 'Camiseta esportiva de tecido leve que absorve o suor.', '2025-11-15');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'camiseta');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'esporte');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'corrida');
INSERT INTO produto_tag VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'masculino');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'Preto');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'Azul royal');
INSERT INTO produto_cor VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'Laranja');
INSERT INTO roupa VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'masculino', '100% poliéster');
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'P', 0);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'M', 0);
INSERT INTO roupa_grade VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'G', 4);
INSERT INTO avaliacao (produto_id, cliente_id, nota, comentario, data) VALUES ((SELECT id FROM produto WHERE sku = 'ROU-010'), 'C002', 3, 'Boa, mas o tamanho é pequeno.', '2026-06-02');

COMMIT;
