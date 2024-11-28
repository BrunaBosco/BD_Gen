CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) 
VALUES ("Tradicional", "Pizzas clássicas e tradicionais"),
       ("Especial", "Pizzas com ingredientes especiais"),
       ("Vegetariana", "Pizzas sem carne"),
       ("Doce", "Pizzas com sabores doces"),
       ("Premium", "Pizzas gourmet com ingredientes de alta qualidade");

CREATE TABLE tb_pizzas (
    id_pizza BIGINT AUTO_INCREMENT PRIMARY KEY,
    pizza VARCHAR(50) NOT NULL,
    ingredientes VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    categoriaid BIGINT
);

INSERT INTO tb_pizzas (pizza, ingredientes, preco, tamanho, categoriaid)
VALUES ("Margherita", "Molho de tomate, queijo mussarela, manjericão", 35.00, "Média", 1),
       ("Pepperoni", "Molho de tomate, queijo mussarela, pepperoni", 40.00, "Grande", 1),
       ("Frango com Catupiry", "Molho de tomate, queijo mussarela, frango desfiado, catupiry", 45.00, "Média", 1),
       ("Portuguesa", "Molho de tomate, queijo mussarela, presunto, ovo, cebola, azeitona", 42.00, "Grande", 1),
       ("Napolitana", "Molho de tomate, queijo mussarela, rodelas de tomate, orégano", 38.00, "Média", 1),
       ("Brigadeiro", "Chocolate, granulado, leite condensado", 50.00, "Pequena", 4),
       ("Rúcula com Tomate Seco", "Molho de tomate, queijo mussarela, rúcula, tomate seco", 55.00, "Grande", 3),
       ("Camarão", "Molho de tomate, queijo mussarela, camarão, alho-poró", 60.00, "Grande", 2);

SELECT * FROM tb_categorias;

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE pizza LIKE '%M%';

SELECT tb_pizzas.*, tb_categorias.nome_categoria, tb_categorias.descricao_categoria
FROM tb_pizzas
INNER JOIN tb_categorias ON tb_pizzas.categoriaid = tb_categorias.id_categoria
WHERE tb_categorias.nome_categoria = 'Doce';

