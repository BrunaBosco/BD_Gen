CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

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
    ("Carnes Bovina", "Cortes de carne bovina"),
    ("Carnes Suína", "Cortes de carne suína"),
    ("Carnes de Aves", "Cortes de carne de aves"),
    ("Embutidos", "Produtos embutidos como salsichas e linguiças"),
    ("Outros", "Outros produtos diversos");
    
    SELECT * FROM tb_categorias;

INSERT INTO tb_produtos (nome_produto, descricao_produto, preco, quantidade, id_categoria) 
VALUES 
    ("Picanha", "Corte nobre de carne bovina", 100.00, 20, 1),
    ("Costela", "Carne bovina com osso", 80.00, 15, 1),
    ("Lombo Suíno", "Corte de carne suína", 60.00, 25, 2),
    ("Filé de Peito de Frango", "Carne de frango sem osso", 30.00, 30, 3),
    ("Linguiça Calabresa", "Linguiça de carne suína", 25.00, 50, 4),
    ("Bacon", "Carne suína defumada", 45.00, 20, 4),
    ("Fraldinha", "Corte de carne bovina", 70.00, 10, 1),
    ("Asa de Frango", "Corte de carne de frango", 35.00, 40, 3);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT tb_produtos.*, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria;

SELECT tb_produtos.*, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_produtos
INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Carnes de Aves';


