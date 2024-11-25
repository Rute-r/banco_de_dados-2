CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255),
	descricao VARCHAR(255)
    ); 

SELECT * FROM tb_categorias;

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sabor VARCHAR(255),
    preco DECIMAL(6,2),
    tamanho VARCHAR(255),
    bordarecheada BOOLEAN
);

SELECT * FROM tb_pizzas;

ALTER TABLE tb_pizzas ADD categoriasid BIGINT;

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (categoriasid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Classica", "Nossas pizzas classicas com os sabores tradicionais");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Vegetariana", "Nossas pizzas classicas feitas sem ingredientes de origem animal");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Doce", "Pizza doces para a sua sobremesa");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Especiais", "Pizzas elaboradas com ingredientes premium");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Regionais", "Pizzas com sabores inspirados em ingredientes tipicos de uma região");


INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Mussarela", 45.99, "Grande", false, 1);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Marguerita com Burrata", 159.99, "Grande", true, 4);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Caprese", 59.99, "Grande", false, 2);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Chocolate", 45.99, "Broto", true, 3);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Nordestina", 45.99, "Grande", false, 5);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Banana com Canela", 45.99, "Broto", true, 3);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Pepperoni com Mel", 145.99, "Grande", true, 4);
INSERT INTO tb_pizzas (sabor, preco, tamanho, bordarecheada, categoriasid)
VALUES ("Calabresa", 45.99, "Grande", false, 1);


SELECT * FROM tb_pizzas WHERE preco > 45;
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE sabor LIKE "%m%";

SELECT sabor, preco, tb_categorias.tipo
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriasid = tb_categorias.id;

SELECT sabor, preco, tb_categorias.tipo
FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.categoriasid = tb_categorias.id WHERE tipo = "Classica";


