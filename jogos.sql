CREATE TABLE jogos(
	id INT GENERATED ALWAYS AS IDENTITY,
	nome varchar(50),
	plataforma varchar(4),
	preco real,
	quantidade INT
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'GOD OF WAR',
	'PC',
	299.00,
	5
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'GOD OF WAR',
	'PS4',
	99.00,
	4
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Valheim',
	'PC',
	37.99,
	10
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'GOD OF WAR - RAGNAROK',
	'PS4',
	350.00,
	2
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Elden Ring',
	'PS4',
	299.00,
	6
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Elden Ring',
	'PC',
	249.99,
	3
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Tribes of Midgard',
	'PS4',
	99.50,
	7
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Tribes of Midgard',
	'PC',
	39.99,
	1
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Days Gone',
	'PS4',
	199.50,
	7
);

INSERT INTO jogos(
	nome,
	plataforma,
	preco,
	quantidade
) VALUES (
	'Days Gone',
	'PS4',
	199.90,
	5
);

SELECT nome, preco FROM jogos WHERE plataforma = 'PC' AND quantidade >= 5;
SELECT nome, preco, plataforma, quantidade FROM jogos ORDER BY quantidade DESC;
SELECT MAX(preco) FROM jogos WHERE plataforma = 'PS4';
SELECT 	SUM(preco) FROM jogos WHERE plataforma = 'PS4';
SELECT 	SUM(preco) FROM jogos WHERE plataforma = 'PC';
SELECT COUNT(quantidade) FROM jogos WHERE nome = 'Days Gone';
SELECT AVG(preco) FROM jogos WHERE plataforma = 'PC';
SELECT AVG(preco) FROM jogos WHERE plataforma = 'PS4';
SELECT * FROM jogos WHERE nome LIKE '%OF%';
SELECT * FROM jogos WHERE preco BETWEEN 30 AND 200;

SELECT * FROM jogos;
DROP TABLE jogos;