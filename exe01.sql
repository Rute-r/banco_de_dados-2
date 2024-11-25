CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    alcance VARCHAR(255) NOT NULL
); 

SELECT * FROM tb_classes;

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    ataque BIGINT,
    defesa BIGINT,
    mana BIGINT,
    carisma BIGINT,
    inteligencia BIGINT
);

SELECT * FROM tb_personagens;

ALTER TABLE tb_personagens ADD classesid BIGINT;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (classesid) REFERENCES tb_classes (id);

INSERT INTO tb_classes (tipo, alcance) VALUES ("Guerreiro", "Curto");
INSERT INTO tb_classes (tipo, alcance) VALUES ("Arqueiro", "Longo");
INSERT INTO tb_classes (tipo, alcance) VALUES ("Mago", "Médio");
INSERT INTO tb_classes (tipo, alcance) VALUES ("Assasino", "Curto");
INSERT INTO tb_classes (tipo, alcance) VALUES ("Clerigo", "Médio");

INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Artemis", 1600, 800, 30, 50, 60, 2);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Kaelthas", 1400, 600, 120, 40, 90, 3);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Darius", 2100, 1400, 10, 30, 50, 1);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Lilith", 1700, 700, 20, 40, 60, 4);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Elyra", 1000, 800, 100, 70, 80, 5);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Tharok", 2230, 1600, 15, 25, 40, 1);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Seraphine", 1200, 600, 110, 60, 85, 3);
INSERT INTO tb_personagens (nome, ataque, defesa, mana, carisma, inteligencia, classesid)
VALUES ("Fiona", 1500, 700, 25, 55, 65, 2);

SELECT * FROM tb_personagens WHERE ataque > 2000;
SELECT * FROM tb_personagens WHERE defesa > 1000 OR defesa < 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%c%";
SELECT * FROM tb_personagens WHERE nome LIKE "%e%";

SELECT nome, ataque, defesa, tb_classes.tipo
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classesid = tb_classes.id;

SELECT nome, ataque, defesa, tb_classes.tipo
FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classesid = tb_classes.id WHERE tipo = "Arqueiro";


