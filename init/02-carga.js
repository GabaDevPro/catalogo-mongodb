// =====================================================================
// 02-carga.js  —  carga inicial: 15 clientes e 32 produtos
//   10 celulares + 10 roupas + 12 livros, com 100+ avaliações aninhadas
// Executado automaticamente pelo Docker na primeira subida
// (ou manualmente:  mongosh catalogo init/02-carga.js)
// =====================================================================
db = db.getSiblingDB("catalogo");

db.produtos.deleteMany({});
db.clientes.deleteMany({});

// ---------------------------------------------------------------------
// CLIENTES
// ---------------------------------------------------------------------
const clientes = [
  { _id: "C001", nome: "Ana Beatriz Souza",     email: "ana.souza@email.com",      cidade: "Palmas",        uf: "TO" },
  { _id: "C002", nome: "Bruno Henrique Lima",   email: "bruno.lima@email.com",     cidade: "Palmas",        uf: "TO" },
  { _id: "C003", nome: "Carla Mendes",          email: "carla.mendes@email.com",   cidade: "Araguaína",     uf: "TO" },
  { _id: "C004", nome: "Diego Alves Pereira",   email: "diego.pereira@email.com",  cidade: "Gurupi",        uf: "TO" },
  { _id: "C005", nome: "Eduarda Rocha",         email: "eduarda.rocha@email.com",  cidade: "Porto Nacional",uf: "TO" },
  { _id: "C006", nome: "Felipe Carvalho",       email: "felipe.c@email.com",       cidade: "Goiânia",       uf: "GO" },
  { _id: "C007", nome: "Gabriela Nunes",        email: "gabi.nunes@email.com",     cidade: "Brasília",      uf: "DF" },
  { _id: "C008", nome: "Henrique Martins",      email: "h.martins@email.com",      cidade: "São Paulo",     uf: "SP" },
  { _id: "C009", nome: "Isabela Ferreira",      email: "isa.ferreira@email.com",   cidade: "Palmas",        uf: "TO" },
  { _id: "C010", nome: "João Pedro Barbosa",    email: "jp.barbosa@email.com",     cidade: "Imperatriz",    uf: "MA" },
  { _id: "C011", nome: "Larissa Teixeira",      email: "larissa.t@email.com",      cidade: "Paraíso do Tocantins", uf: "TO" },
  { _id: "C012", nome: "Marcos Vinícius Dias",  email: "marcos.dias@email.com",    cidade: "Belém",         uf: "PA" },
  { _id: "C013", nome: "Natália Ribeiro",       email: "natalia.r@email.com",      cidade: "Palmas",        uf: "TO" },
  { _id: "C014", nome: "Otávio Gomes",          email: "otavio.gomes@email.com",   cidade: "Salvador",      uf: "BA" },
  { _id: "C015", nome: "Paula Cristina Araújo", email: "paula.araujo@email.com",   cidade: "Gurupi",        uf: "TO" }
];
db.clientes.insertMany(clientes);

// Mapa id -> nome, para montar as avaliações
const nomeCliente = Object.fromEntries(clientes.map(c => [c._id, c.nome]));

// Atalho para criar uma avaliação
// (guarda o id E o nome do cliente: assim a página do produto não precisa
//  buscar a coleção de clientes — "referência estendida")
function av(clienteId, nota, comentario, data) {
  return { clienteId, cliente: nomeCliente[clienteId], nota, comentario, data: new Date(data) };
}

// ---------------------------------------------------------------------
// CELULARES — especificacoes: armazenamento, RAM, tela, bateria, câmera, 5G
// ---------------------------------------------------------------------
const celulares = [
  { sku: "CEL-001", nome: "Smartphone Samsung Galaxy S25 256GB", marca: "Samsung", preco: 4999.00, estoque: 18,
    descricao: "Topo de linha compacto com processador Snapdragon e câmera tripla de 50MP.",
    tags: ["smartphone", "android", "5g", "premium"],
    especificacoes: { armazenamentoGB: 256, ramGB: 12, telaPolegadas: 6.2, bateriaMah: 4000, cameraMP: 50, suporta5G: true, cores: ["Azul", "Prata", "Grafite"] },
    avaliacoes: [
      av("C008", 5, "Câmera excelente e muito rápido.", "2026-03-02"),
      av("C007", 5, "Tamanho perfeito pra uma mão só.", "2026-04-18"),
      av("C002", 4, "Ótimo, mas a bateria podia durar mais.", "2026-06-10"),
      av("C014", 5, "Melhor celular que já tive.", "2026-08-21")
    ] },
  { sku: "CEL-002", nome: "Smartphone Samsung Galaxy A56 5G 128GB", marca: "Samsung", preco: 2299.00, estoque: 40,
    descricao: "Intermediário com tela Super AMOLED de 120Hz e 6 anos de atualizações.",
    tags: ["smartphone", "android", "5g", "intermediario"],
    especificacoes: { armazenamentoGB: 128, ramGB: 8, telaPolegadas: 6.7, bateriaMah: 5000, cameraMP: 50, suporta5G: true, cores: ["Preto", "Rosa", "Cinza"] },
    avaliacoes: [
      av("C001", 5, "Tela linda e bateria dura o dia todo.", "2026-02-11"),
      av("C004", 4, "Bom custo-benefício.", "2026-03-27"),
      av("C011", 4, "Esquenta um pouco nos jogos.", "2026-07-05")
    ] },
  { sku: "CEL-003", nome: "Smartphone Samsung Galaxy A16 128GB 4G", marca: "Samsung", preco: 1099.00, estoque: 65,
    descricao: "Celular de entrada com tela grande e bateria de 5000mAh.",
    tags: ["smartphone", "android", "entrada"],
    especificacoes: { armazenamentoGB: 128, ramGB: 4, telaPolegadas: 6.7, bateriaMah: 5000, cameraMP: 50, suporta5G: false, cores: ["Preto", "Verde"] },
    avaliacoes: [
      av("C010", 3, "Funciona, mas trava com muitos apps abertos.", "2026-01-20"),
      av("C015", 4, "Pra quem só usa WhatsApp é ótimo.", "2026-05-14"),
      av("C003", 2, "Lento demais, me arrependi.", "2026-09-03")
    ] },
  { sku: "CEL-004", nome: "iPhone 16 Apple 128GB", marca: "Apple", preco: 5999.00, estoque: 12,
    descricao: "Chip A18, botão de Ação e Controle da Câmera.",
    tags: ["smartphone", "ios", "5g", "premium"],
    especificacoes: { armazenamentoGB: 128, ramGB: 8, telaPolegadas: 6.1, bateriaMah: 3561, cameraMP: 48, suporta5G: true, cores: ["Preto", "Branco", "Ultramarino"] },
    avaliacoes: [
      av("C008", 5, "Fluidez absurda.", "2026-02-25"),
      av("C006", 4, "Caro, mas vale.", "2026-04-02"),
      av("C013", 5, "Câmera incrível pra vídeo.", "2026-06-30"),
      av("C012", 3, "Carregador não vem na caixa.", "2026-08-08"),
      av("C007", 5, "Recomendo demais.", "2026-10-12")
    ] },
  { sku: "CEL-005", nome: "iPhone 15 Apple 128GB", marca: "Apple", preco: 4599.00, estoque: 9,
    descricao: "Dynamic Island, câmera de 48MP e conector USB-C.",
    tags: ["smartphone", "ios", "5g"],
    especificacoes: { armazenamentoGB: 128, ramGB: 6, telaPolegadas: 6.1, bateriaMah: 3349, cameraMP: 48, suporta5G: true, cores: ["Preto", "Azul", "Rosa"] },
    avaliacoes: [
      av("C009", 5, "Chegou antes do prazo, perfeito.", "2026-03-15"),
      av("C014", 4, "Muito bom, só a bateria que é média.", "2026-07-22")
    ] },
  { sku: "CEL-006", nome: "Smartphone Motorola Moto G85 5G 256GB", marca: "Motorola", preco: 1699.00, estoque: 55,
    descricao: "Tela pOLED curva de 120Hz e som Dolby Atmos.",
    tags: ["smartphone", "android", "5g", "intermediario"],
    especificacoes: { armazenamentoGB: 256, ramGB: 8, telaPolegadas: 6.67, bateriaMah: 5000, cameraMP: 50, suporta5G: true, cores: ["Azul", "Grafite", "Verde"] },
    avaliacoes: [
      av("C002", 5, "Melhor custo-benefício da Motorola.", "2026-01-30"),
      av("C005", 5, "Tela curva linda.", "2026-04-09"),
      av("C011", 4, "Muito bom, câmera noturna fraca.", "2026-06-17"),
      av("C001", 5, "Comprei pro meu pai e ele amou.", "2026-09-25")
    ] },
  { sku: "CEL-007", nome: "Smartphone Motorola Edge 50 Fusion 256GB", marca: "Motorola", preco: 2199.00, estoque: 30,
    descricao: "Design em couro vegano, resistência IP68 e carregamento de 68W.",
    tags: ["smartphone", "android", "5g"],
    especificacoes: { armazenamentoGB: 256, ramGB: 8, telaPolegadas: 6.7, bateriaMah: 5000, cameraMP: 50, suporta5G: true, cores: ["Azul", "Rosa"] },
    avaliacoes: [
      av("C006", 4, "Carrega muito rápido.", "2026-02-14"),
      av("C010", 5, "Bonito e resistente.", "2026-05-03")
    ] },
  { sku: "CEL-008", nome: "Smartphone Xiaomi Redmi Note 14 Pro 5G 256GB", marca: "Xiaomi", preco: 2499.00, estoque: 25,
    descricao: "Câmera de 200MP e tela AMOLED de 1,5K.",
    tags: ["smartphone", "android", "5g", "camera"],
    especificacoes: { armazenamentoGB: 256, ramGB: 8, telaPolegadas: 6.67, bateriaMah: 5110, cameraMP: 200, suporta5G: true, cores: ["Preto", "Roxo"] },
    avaliacoes: [
      av("C004", 5, "Fotos impressionantes.", "2026-03-08"),
      av("C012", 4, "Muita propaganda no sistema.", "2026-04-29"),
      av("C003", 5, "Valeu cada centavo.", "2026-07-11"),
      av("C015", 2, "Veio com defeito no alto-falante.", "2026-10-01")
    ] },
  { sku: "CEL-009", nome: "Smartphone Xiaomi Poco X7 Pro 512GB", marca: "Xiaomi", preco: 2899.00, estoque: 14,
    descricao: "Feito para jogos: Dimensity 8400 Ultra e 12GB de RAM.",
    tags: ["smartphone", "android", "5g", "gamer"],
    especificacoes: { armazenamentoGB: 512, ramGB: 12, telaPolegadas: 6.67, bateriaMah: 6000, cameraMP: 50, suporta5G: true, cores: ["Preto", "Verde", "Amarelo"] },
    avaliacoes: [
      av("C002", 5, "Roda tudo no máximo.", "2026-02-03"),
      av("C009", 5, "Bateria absurda.", "2026-05-19"),
      av("C013", 4, "Esquenta um pouco, mas nada demais.", "2026-08-26")
    ] },
  { sku: "CEL-010", nome: "Smartphone Realme C75 256GB 4G", marca: "Realme", preco: 1199.00, estoque: 0,
    descricao: "Resistente a quedas e água, com 8GB de RAM.",
    tags: ["smartphone", "android", "entrada"],
    especificacoes: { armazenamentoGB: 256, ramGB: 8, telaPolegadas: 6.72, bateriaMah: 6000, cameraMP: 50, suporta5G: false, cores: ["Preto", "Dourado"] },
    avaliacoes: [
      av("C005", 4, "Muito armazenamento pelo preço.", "2026-04-21")
    ] }
];

// ---------------------------------------------------------------------
// ROUPAS — especificacoes: gênero, material, cores e GRADE de tamanhos
// A grade é um array de { tamanho, qtd }: o estoque total é a soma dela.
// ---------------------------------------------------------------------
const roupas = [
  { sku: "ROU-001", nome: "Camiseta Básica Algodão Hering Masculina", marca: "Hering", preco: 49.90,
    descricao: "Camiseta gola careca 100% algodão, ideal para o dia a dia.",
    tags: ["camiseta", "basica", "algodao", "masculino"],
    especificacoes: { genero: "masculino", material: "100% algodão", cores: ["Preto", "Branco", "Cinza"],
      grade: [ { tamanho: "P", qtd: 20 }, { tamanho: "M", qtd: 35 }, { tamanho: "G", qtd: 28 }, { tamanho: "GG", qtd: 10 } ] },
    avaliacoes: [
      av("C002", 5, "Tecido grosso, não desbota.", "2026-01-12"),
      av("C004", 4, "Veste bem, mas encolheu um pouco.", "2026-03-19"),
      av("C010", 5, "Já comprei 5.", "2026-06-06"),
      av("C014", 4, "Bom pelo preço.", "2026-09-14")
    ] },
  { sku: "ROU-002", nome: "Calça Jeans Levi's 511 Slim Masculina", marca: "Levi's", preco: 299.90,
    descricao: "Jeans com elastano, modelagem slim e lavagem média.",
    tags: ["calca", "jeans", "masculino"],
    especificacoes: { genero: "masculino", material: "98% algodão, 2% elastano", cores: ["Azul médio"],
      grade: [ { tamanho: "38", qtd: 6 }, { tamanho: "40", qtd: 9 }, { tamanho: "42", qtd: 7 }, { tamanho: "44", qtd: 0 } ] },
    avaliacoes: [
      av("C006", 5, "Caimento perfeito.", "2026-02-20"),
      av("C008", 4, "Muito boa, mas o 44 sempre esgota.", "2026-05-30")
    ] },
  { sku: "ROU-003", nome: "Vestido Midi Floral Farm", marca: "Farm", preco: 459.00,
    descricao: "Vestido midi em viscose com estampa floral exclusiva.",
    tags: ["vestido", "floral", "feminino", "verao"],
    especificacoes: { genero: "feminino", material: "100% viscose", cores: ["Estampado"],
      grade: [ { tamanho: "PP", qtd: 2 }, { tamanho: "P", qtd: 5 }, { tamanho: "M", qtd: 0 }, { tamanho: "G", qtd: 3 } ] },
    avaliacoes: [
      av("C007", 5, "Estampa linda, recebi muitos elogios.", "2026-01-08"),
      av("C001", 5, "Tecido leve, perfeito pro calor de Palmas.", "2026-03-03"),
      av("C013", 3, "Bonito, mas amassa fácil.", "2026-06-24")
    ] },
  { sku: "ROU-004", nome: "Moletom Canguru Nike Club Fleece", marca: "Nike", preco: 349.90,
    descricao: "Moletom com capuz e bolso canguru, interior flanelado.",
    tags: ["moletom", "inverno", "unissex"],
    especificacoes: { genero: "unissex", material: "80% algodão, 20% poliéster", cores: ["Preto", "Cinza mescla"],
      grade: [ { tamanho: "P", qtd: 4 }, { tamanho: "M", qtd: 8 }, { tamanho: "G", qtd: 6 }, { tamanho: "GG", qtd: 2 } ] },
    avaliacoes: [
      av("C012", 5, "Quentinho e confortável.", "2026-05-10"),
      av("C003", 4, "Bom, mas um pouco caro.", "2026-07-02"),
      av("C009", 1, "Veio tamanho errado e a troca demorou.", "2026-09-29")
    ] },
  { sku: "ROU-005", nome: "Jaqueta Corta-Vento Adidas Essentials", marca: "Adidas", preco: 399.90,
    descricao: "Jaqueta leve e repelente à água, com capuz embutido.",
    tags: ["jaqueta", "esporte", "unissex"],
    especificacoes: { genero: "unissex", material: "100% poliéster reciclado", cores: ["Preto", "Azul marinho"],
      grade: [ { tamanho: "P", qtd: 3 }, { tamanho: "M", qtd: 5 }, { tamanho: "G", qtd: 4 } ] },
    avaliacoes: [
      av("C006", 4, "Leve e prática.", "2026-04-15"),
      av("C011", 5, "Uso pra correr de manhã.", "2026-08-03")
    ] },
  { sku: "ROU-006", nome: "Camisa Polo Lacoste Piquet Masculina", marca: "Lacoste", preco: 549.00,
    descricao: "Polo clássica em piquet de algodão com o crocodilo bordado.",
    tags: ["polo", "masculino", "classico"],
    especificacoes: { genero: "masculino", material: "100% algodão piquet", cores: ["Branco", "Verde", "Azul marinho"],
      grade: [ { tamanho: "P", qtd: 2 }, { tamanho: "M", qtd: 4 }, { tamanho: "G", qtd: 3 } ] },
    avaliacoes: [
      av("C008", 5, "Qualidade impecável.", "2026-02-07"),
      av("C014", 5, "Original, chegou bem embalada.", "2026-06-15"),
      av("C006", 4, "Cara, mas dura anos.", "2026-10-20")
    ] },
  { sku: "ROU-007", nome: "Bermuda Tactel Mormaii Masculina", marca: "Mormaii", preco: 89.90,
    descricao: "Bermuda de secagem rápida, com elástico e cordão.",
    tags: ["bermuda", "praia", "verao", "masculino"],
    especificacoes: { genero: "masculino", material: "100% poliéster", cores: ["Azul", "Preto", "Verde"],
      grade: [ { tamanho: "P", qtd: 10 }, { tamanho: "M", qtd: 15 }, { tamanho: "G", qtd: 12 }, { tamanho: "GG", qtd: 6 } ] },
    avaliacoes: [
      av("C004", 4, "Ótima pra ir na praia da Graciosa.", "2026-07-19"),
      av("C010", 5, "Seca muito rápido.", "2026-09-07")
    ] },
  { sku: "ROU-008", nome: "Blusa Cropped Canelada Renner", marca: "Renner", preco: 59.90,
    descricao: "Cropped canelado de alcinha, tecido com elastano.",
    tags: ["blusa", "cropped", "feminino", "verao"],
    especificacoes: { genero: "feminino", material: "95% viscose, 5% elastano", cores: ["Branco", "Rosa", "Preto"],
      grade: [ { tamanho: "PP", qtd: 7 }, { tamanho: "P", qtd: 12 }, { tamanho: "M", qtd: 9 }, { tamanho: "G", qtd: 0 } ] },
    avaliacoes: [
      av("C015", 4, "Bonita, mas transparente na cor branca.", "2026-03-23"),
      av("C005", 2, "Costura desfez na primeira lavagem.", "2026-08-30"),
      av("C001", 4, "Ótima pelo preço.", "2026-10-05")
    ] },
  { sku: "ROU-009", nome: "Calça Legging Fitness Track&Field", marca: "Track&Field", preco: 179.00,
    descricao: "Legging de cintura alta com proteção UV e tecido que não marca.",
    tags: ["legging", "fitness", "academia", "feminino"],
    especificacoes: { genero: "feminino", material: "88% poliamida, 12% elastano", cores: ["Preto", "Vinho"],
      grade: [ { tamanho: "P", qtd: 8 }, { tamanho: "M", qtd: 11 }, { tamanho: "G", qtd: 5 } ] },
    avaliacoes: [
      av("C009", 5, "Não fica transparente no agachamento!", "2026-02-28"),
      av("C011", 5, "Uso todo dia na academia.", "2026-05-08"),
      av("C013", 5, "A melhor legging que já comprei.", "2026-08-12")
    ] },
  { sku: "ROU-010", nome: "Camiseta Dry Fit Olympikus Masculina", marca: "Olympikus", preco: 69.90,
    descricao: "Camiseta esportiva de tecido leve que absorve o suor.",
    tags: ["camiseta", "esporte", "corrida", "masculino"],
    especificacoes: { genero: "masculino", material: "100% poliéster", cores: ["Preto", "Azul royal", "Laranja"],
      grade: [ { tamanho: "P", qtd: 0 }, { tamanho: "M", qtd: 0 }, { tamanho: "G", qtd: 4 } ] },
    avaliacoes: [
      av("C002", 3, "Boa, mas o tamanho é pequeno.", "2026-06-02")
    ] }
];
// estoque total da roupa = soma da grade
roupas.forEach(r => r.estoque = r.especificacoes.grade.reduce((s, g) => s + g.qtd, 0));

// ---------------------------------------------------------------------
// LIVROS — especificacoes: autores (array), editora, páginas, ano, gênero
// ---------------------------------------------------------------------
const livros = [
  { sku: "LIV-001", nome: "Dom Casmurro", marca: "Penguin-Companhia", preco: 34.90, estoque: 50,
    descricao: "Clássico de Machado de Assis narrado por Bentinho: Capitu traiu ou não traiu?",
    tags: ["classico", "literatura brasileira", "romance"],
    especificacoes: { autores: ["Machado de Assis"], editora: "Penguin-Companhia", paginas: 256, anoPublicacao: 1899, idioma: "português", genero: "romance", formato: "brochura" },
    avaliacoes: [
      av("C001", 5, "Leitura obrigatória.", "2026-02-02"),
      av("C009", 5, "Capitu é a melhor personagem da literatura brasileira.", "2026-04-11"),
      av("C011", 4, "Edição bonita, letra boa.", "2026-07-29")
    ] },
  { sku: "LIV-002", nome: "Memórias Póstumas de Brás Cubas", marca: "Penguin-Companhia", preco: 39.90, estoque: 32,
    descricao: "O defunto autor conta sua vida com ironia — marco do Realismo no Brasil.",
    tags: ["classico", "literatura brasileira", "realismo"],
    especificacoes: { autores: ["Machado de Assis"], editora: "Penguin-Companhia", paginas: 368, anoPublicacao: 1881, idioma: "português", genero: "romance", formato: "brochura" },
    avaliacoes: [
      av("C013", 5, "Genial do começo ao fim.", "2026-03-06"),
      av("C003", 4, "Precisei ler pro vestibular e acabei gostando.", "2026-05-25")
    ] },
  { sku: "LIV-003", nome: "O Cortiço", marca: "Ática", preco: 29.90, estoque: 40,
    descricao: "Romance naturalista de Aluísio Azevedo sobre a vida num cortiço do Rio.",
    tags: ["classico", "literatura brasileira", "naturalismo"],
    especificacoes: { autores: ["Aluísio Azevedo"], editora: "Ática", paginas: 240, anoPublicacao: 1890, idioma: "português", genero: "romance", formato: "brochura" },
    avaliacoes: [
      av("C005", 3, "Pesado, mas importante.", "2026-04-04"),
      av("C010", 4, "Bom pra entender o naturalismo.", "2026-06-20")
    ] },
  { sku: "LIV-004", nome: "Torto Arado", marca: "Todavia", preco: 59.90, estoque: 22,
    descricao: "A história das irmãs Bibiana e Belonísia no sertão da Bahia.",
    tags: ["literatura brasileira", "contemporaneo", "premiado"],
    especificacoes: { autores: ["Itamar Vieira Junior"], editora: "Todavia", paginas: 264, anoPublicacao: 2019, idioma: "português", genero: "romance", formato: "brochura" },
    avaliacoes: [
      av("C007", 5, "Um dos melhores livros brasileiros recentes.", "2026-01-17"),
      av("C014", 5, "Emocionante.", "2026-03-30"),
      av("C001", 5, "Não consegui parar de ler.", "2026-06-08"),
      av("C015", 4, "Começo lento, final maravilhoso.", "2026-09-11")
    ] },
  { sku: "LIV-005", nome: "Código Limpo: Habilidades Práticas do Agile Software", marca: "Alta Books", preco: 89.90, estoque: 28,
    descricao: "Como escrever código legível e fácil de manter.",
    tags: ["programacao", "tecnologia", "boas praticas"],
    especificacoes: { autores: ["Robert C. Martin"], editora: "Alta Books", paginas: 425, anoPublicacao: 2009, idioma: "português", genero: "tecnologia", formato: "brochura" },
    avaliacoes: [
      av("C002", 5, "Mudou meu jeito de programar.", "2026-02-09"),
      av("C004", 4, "Exemplos em Java, mas vale pra qualquer linguagem.", "2026-05-01"),
      av("C012", 4, "Alguns capítulos são datados.", "2026-08-17")
    ] },
  { sku: "LIV-006", nome: "Entendendo Algoritmos", marca: "Novatec", preco: 74.90, estoque: 35,
    descricao: "Guia ilustrado de algoritmos para programadores e curiosos.",
    tags: ["programacao", "tecnologia", "algoritmos"],
    especificacoes: { autores: ["Aditya Y. Bhargava"], editora: "Novatec", paginas: 264, anoPublicacao: 2017, idioma: "português", genero: "tecnologia", formato: "brochura" },
    avaliacoes: [
      av("C009", 5, "Os desenhos ajudam muito.", "2026-03-12"),
      av("C002", 5, "Perfeito pra quem tá começando.", "2026-06-27"),
      av("C011", 5, "Didática excelente.", "2026-10-15")
    ] },
  { sku: "LIV-007", nome: "Sistemas de Banco de Dados", marca: "Pearson", preco: 289.00, estoque: 8,
    descricao: "Referência clássica em modelagem, SQL, normalização e transações.",
    tags: ["banco de dados", "tecnologia", "faculdade"],
    especificacoes: { autores: ["Ramez Elmasri", "Shamkant B. Navathe"], editora: "Pearson", paginas: 788, anoPublicacao: 2018, idioma: "português", genero: "tecnologia", formato: "brochura", edicao: 7 },
    avaliacoes: [
      av("C013", 5, "A bíblia de banco de dados.", "2026-03-01"),
      av("C003", 3, "Muito denso, preço alto.", "2026-08-05")
    ] },
  { sku: "LIV-008", nome: "NoSQL Essencial", marca: "Novatec", preco: 69.90, estoque: 15,
    descricao: "Introdução aos bancos NoSQL: chave-valor, documentos, colunas e grafos.",
    tags: ["banco de dados", "nosql", "tecnologia"],
    especificacoes: { autores: ["Pramod J. Sadalage", "Martin Fowler"], editora: "Novatec", paginas: 220, anoPublicacao: 2013, idioma: "português", genero: "tecnologia", formato: "brochura" },
    avaliacoes: [
      av("C002", 5, "Usei pra estudar pro trabalho de NoSQL.", "2026-10-26"),
      av("C006", 4, "Curto e direto ao ponto.", "2026-04-23"),
      av("C008", 4, "Bom panorama geral.", "2026-07-08")
    ] },
  { sku: "LIV-009", nome: "O Programador Pragmático", marca: "Bookman", preco: 119.00, estoque: 11,
    descricao: "Dicas práticas para evoluir na carreira de desenvolvimento.",
    tags: ["programacao", "tecnologia", "carreira"],
    especificacoes: { autores: ["David Thomas", "Andrew Hunt"], editora: "Bookman", paginas: 352, anoPublicacao: 2020, idioma: "português", genero: "tecnologia", formato: "brochura", edicao: 2 },
    avaliacoes: [
      av("C004", 5, "Todo dev deveria ler.", "2026-05-17"),
      av("C012", 5, "Atemporal.", "2026-09-19")
    ] },
  { sku: "LIV-010", nome: "1984", marca: "Companhia das Letras", preco: 49.90, estoque: 44,
    descricao: "A distopia de George Orwell sobre vigilância e controle: o Grande Irmão está de olho.",
    tags: ["classico", "distopia", "ficcao"],
    especificacoes: { autores: ["George Orwell"], editora: "Companhia das Letras", paginas: 416, anoPublicacao: 1949, idioma: "português", genero: "ficção", formato: "brochura" },
    avaliacoes: [
      av("C006", 5, "Assustadoramente atual.", "2026-01-25"),
      av("C010", 5, "Clássico absoluto.", "2026-04-14"),
      av("C005", 4, "Final pesado.", "2026-07-16"),
      av("C014", 5, "Li em dois dias.", "2026-10-09")
    ] },
  { sku: "LIV-011", nome: "A Revolução dos Bichos", marca: "Companhia das Letras", preco: 29.90, estoque: 60,
    descricao: "Fábula de George Orwell sobre poder e corrupção numa fazenda.",
    tags: ["classico", "fabula", "ficcao"],
    especificacoes: { autores: ["George Orwell"], editora: "Companhia das Letras", paginas: 152, anoPublicacao: 1945, idioma: "português", genero: "ficção", formato: "brochura" },
    avaliacoes: [
      av("C015", 5, "Curto e genial.", "2026-02-16"),
      av("C001", 4, "Ótimo pra ler numa tarde.", "2026-06-01"),
      av("C003", 1, "Livro chegou com páginas rasgadas.", "2026-09-21")
    ] },
  { sku: "LIV-012", nome: "Sapiens: Uma Breve História da Humanidade", marca: "L&PM", preco: 64.90, estoque: 27,
    descricao: "Yuval Noah Harari conta a história da espécie humana em linguagem acessível.",
    tags: ["historia", "nao ficcao", "best-seller"],
    especificacoes: { autores: ["Yuval Noah Harari"], editora: "L&PM", paginas: 464, anoPublicacao: 2015, idioma: "português", genero: "história", formato: "brochura" },
    avaliacoes: [
      av("C008", 5, "Abriu minha cabeça.", "2026-01-05"),
      av("C007", 4, "Algumas partes são especulativas.", "2026-05-12"),
      av("C012", 4, "Muito bem escrito.", "2026-08-24")
    ] }
];

// ---------------------------------------------------------------------
// Junta tudo, marca a categoria e calcula o resumo das avaliações
// ---------------------------------------------------------------------
function montar(lista, categoria, criadoEm) {
  return lista.map(p => {
    const notas = p.avaliacoes.map(a => a.nota);
    const media = notas.length ? notas.reduce((s, n) => s + n, 0) / notas.length : 0;
    return {
      sku: p.sku, nome: p.nome, categoria,   // só para a ordem dos campos ficar legível
      ...p,
      resumoAvaliacoes: { media: Math.round(media * 100) / 100, total: notas.length },
      criadoEm: new Date(criadoEm)
    };
  });
}

const produtos = [
  ...montar(celulares, "celular", "2025-12-01"),
  ...montar(roupas,    "roupa",   "2025-11-15"),
  ...montar(livros,    "livro",   "2025-10-20")
];

const r = db.produtos.insertMany(produtos);
const totalAvaliacoes = produtos.reduce((s, p) => s + p.avaliacoes.length, 0);

print(`✔ ${db.clientes.countDocuments()} clientes inseridos`);
print(`✔ ${Object.keys(r.insertedIds).length} produtos inseridos (${celulares.length} celulares, ${roupas.length} roupas, ${livros.length} livros)`);
print(`✔ ${totalAvaliacoes} avaliações aninhadas nos produtos`);
