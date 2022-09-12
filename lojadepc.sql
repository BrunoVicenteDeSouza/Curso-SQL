CREATE TABLE pccompleto(
	ID int,
	nome varchar(55),
	processador varchar(144),
	preco varchar(255)
);

INSERT INTO pccompleto(
	ID,
	nome,
	processador,
	preco
) VALUES(
	'1',
	'Monstrao',
	'Ryzen 9',
	'40,000'
);

INSERT INTO pccompleto(
	ID,
	nome,
	processador,
	preco
) VALUES(
	'2',
	'Mediaco',
	'Ryzen 7',
	'20,000'
);

INSERT INTO pccompleto(
	ID,
	nome,
	processador,
	preco
) VALUES(
	'3',
	'Mediuzim',
	'Ryzen 5',
	'10,000'
);

INSERT INTO pccompleto(
	ID,
	nome,
	processador,
	preco
) VALUES(
	'4',
	'Entreidis',
	'i5',
	'5,000'
);

INSERT INTO pccompleto(
	ID,
	nome,
	processador,
	preco
) VALUES(
	'5',
	'O TOP',
	'Dual-core',
	'2,000'
);-------------------------------------------------------

CREATE TABLE monitores(
	ID int,
	marca varchar(255),
	polegada varchar(255),
	preco varchar(255)
);

INSERT INTO monitores(
	ID,
	marca,
	polegada,
	preco
) VALUES(
	'1',
	'Acer',
	'27',
	'2,500'
);

INSERT INTO monitores(
	ID,
	marca,
	polegada,
	preco
) VALUES(
	'2',
	'Samsung',
	'27',
	'1,000'
);

INSERT INTO monitores(
	ID,
	marca,
	polegada,
	preco
) VALUES(
	'3',
	'Acer',
	'32',
	'5,000'
);

INSERT INTO monitores(
	ID,
	marca,
	polegada,
	preco
) VALUES(
	'4',
	'Samsung',
	'32',
	'10,000'
);

INSERT INTO monitores(
	ID,
	marca,
	polegada,
	preco
) VALUES(
	'5',
	'AOC',
	'22',
	'800'
);--------------------------------------------------------------

CREATE TABLE clientes(
	ID int,
	Nome varchar(255),
	Endereco varchar(255),
	Email varchar(255),
	Telefone varchar(255)
);

INSERT INTO clientes(
	ID,
	Nome,
	Endereco,
	Email,
	Telefone
) VALUES(
	'1',
	'Riquinho',
	'Alphaville',
	'riquinho_reidelas@email.com',
	'9999-9999'
);

INSERT INTO clientes(
	ID,
	Nome,
	Endereco,
	Email,
	Telefone
) VALUES(
	'2',
	'Pobreta',
	'Vila alfa',
	'pobreta88889@email.com',
	'8888-8889'
);

INSERT INTO clientes(
	ID,
	Nome,
	Endereco,
	Email,
	Telefone
) VALUES(
	'3',
	'Fulano',
	'Centro',
	'fulano@email.com',
	'1111-1111'
);

INSERT INTO clientes(
	ID,
	Nome,
	Endereco,
	Email,
	Telefone
) VALUES(
	'4',
	'Ciclano',
	'Centro',
	'Ciclano@email.com',
	'2222-2222'
);

INSERT INTO clientes(
	ID,
	Nome,
	Endereco,
	Email,
	Telefone
) VALUES(
	'5',
	'Beltrano',
	'Centro',
	'Beltrano@email.com',
	'3333-3333'
);-------------------------------------------------------

ALTER TABLE pccompleto ADD vga varchar(40);
UPDATE pccompleto SET vga = 'rx 6900xt' WHERE nome = 'Monstrao';
UPDATE pccompleto SET vga = 'rx 6700xt' WHERE nome = 'Mediaco';
UPDATE pccompleto SET vga = 'rx 6600' WHERE id = 3;
UPDATE pccompleto SET vga = 'gtx 1050ti' WHERE id = 4;

ALTER TABLE monitores ADD hz varchar (255);
UPDATE monitores SET hz = '144hz' WHERE marca = 'Acer';
UPDATE monitores SET hz = '60' WHERE marca = 'AOC';
UPDATE monitores SET hz = '240hz' WHERE id = 4;
UPDATE monitores SET hz = '75hz' WHERE id = 2;

SELECT * FROM pccompleto;
SELECT * FROM monitores;
SELECT * FROM clientes;

SELECT nome FROM clientes;
SELECT vga FROM pccompleto;
SELECT hz FROM monitores

DELETE FROM pccompleto WHERE processador = 'Ryzen 5'
DELETE FROM monitores WHERE marca = 'Samsung'
DELETE FROM clientes WHERE id = 4




DROP TABLE pccompleto;
DROP TABLE monitores;
DROP TABLE clientes;