CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255),
    descricao VARCHAR(255)
); 

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(6,2),
    descricao VARCHAR(255),
    validade DATE
);

SELECT * FROM tb_produtos;

ALTER TABLE tb_produtos ADD categoriasid BIGINT;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriasid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Medicamentos", "Analgesicos, antibioticos, etc...");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Higiene Pessoal", "Produtos de cuidado diario");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Cosmeticos", "Produtos de beleza");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Suplementos e Vitaminas", "Produtos de suplementação");
INSERT INTO tb_categorias (tipo, descricao)
VALUES ("Infantil", "Produtos para recem nascidos e bebes");

INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Paracetamol 500mg", 7.50, "Analgésico e antitérmico indicado para dores leves a moderadas e febre.", "2025-12-25", 1);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Amoxicilina 500mg", 22.90, "Antibiótico usado no tratamento de infecções bacterianas", "2026-06-30", 1);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Sabonete Líquido Neutro 200ml", 14.99, "Sabonete para uso diário, ideal para peles sensíveis.", "2025-08-15", 2);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Creme Dental Sensível 90g", 12.49, "Pasta de dente desenvolvida para dentes sensíveis e proteção contra cáries.", "2026-03-10", 2);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Protetor Solar FPS 50 120ml", 59.99, "Protetor solar para todos os tipos de pele, com alta proteção contra raios UVA e UVB.", "2025-11-30", 3);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Hidratante Facial com Ácido Hialurônico 50g", 79.90, "Creme facial que hidrata profundamente e reduz linhas finas.", "2025-11-30", 3);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Ômega-3 1000mg - 120 Cápsulas", 69.90, "Suplemento para saúde cardiovascular e função cerebral.", "2027-04-20", 4);
INSERT INTO tb_produtos (nome, preco, descricao, validade, categoriasid)
VALUES ("Fralda Descartável Tamanho G", 49.90, "Fralda descartável com alta absorção e proteção contra vazamentos, ideal para bebês de 9 a 13 kg.", "2026-06-26", 5);


SELECT * FROM tb_produtos WHERE preco > 50;
SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

SELECT nome, preco, tb_categorias.tipo
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoriasid = tb_categorias.id;

SELECT nome, preco, tb_categorias.tipo
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoriasid = tb_categorias.id WHERE tipo = "Medicamentos";