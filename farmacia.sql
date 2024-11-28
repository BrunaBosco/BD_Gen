CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    descricao_produto VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) 
VALUES 
    ("Medicamentos", "Produtos farmacêuticos"),
    ("Cosméticos", "Produtos de beleza e cuidados pessoais"),
    ("Suplementos", "Vitaminas e suplementos alimentares"),
    ("Higiene", "Produtos de higiene pessoal"),
    ("Infantil", "Produtos para cuidados infantis");
    
    SELECT * FROM tb_categorias;

INSERT INTO tb_produtos (nome_produto, descricao_produto, preco, quantidade, id_categoria) 
VALUES 
    ("Paracetamol", "Analgésico e antipirético", 20.00, 100, 1),
    ("Shampoo", "Shampoo hidratante para cabelos", 25.00, 50, 2),
    ("Multivitamínico", "Suplemento vitamínico completo", 40.00, 30, 3),
    ("Sabonete", "Sabonete antibacteriano", 10.00, 200, 4),
    ("Pomada para Assaduras", "Pomada para prevenção de assaduras", 15.00, 80, 5),
    ("Protetor Solar", "Protetor solar fator 50", 60.00, 45, 2),
    ("Vitamina C", "Suplemento de Vitamina C 500mg", 30.00, 60, 3),
    ("Creme Hidratante", "Creme hidratante para pele seca", 35.00, 40, 2);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT tb_produtos.*, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Cosméticos';


