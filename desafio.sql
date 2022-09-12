CREATE TABLE usuario(
	matricula INT GENERATED ALWAYS AS IDENTITY,
	nome varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	endereco varchar(255) NOT NULL,
	telefone VARCHAR(255) NOT NULL,
	PRIMARY KEY (matricula)
);

CREATE TABLE emprestimo(
	codigo INT GENERATED ALWAYS AS IDENTITY,
	matricula INT,
	data_emprestimo TIMESTAMP NOT NULL, 
	data_devolucao TIMESTAMP NOT NULL,
	PRIMARY KEY (codigo),
	CONSTRAINT fk_matricula
		FOREIGN KEY (matricula)
		REFERENCES 	usuario(matricula)
);

CREATE TABLE sessao(
	codigo INT GENERATED ALWAYS AS IDENTITY,
	descricao varchar(255),
	localizacao varchar(255),
	PRIMARY KEY (codigo)
);

CREATE TABLE livro(
	codigo INT GENERATED ALWAYS AS IDENTITY, 
	sessao INT,
	titulo varchar(255),
	autor varchar(255),
	PRIMARY KEY (codigo),
	CONSTRAINT fk_sessao
		FOREIGN KEY (sessao)
		REFERENCES sessao(codigo)
);

CREATE TABLE livro_emprestimo(
	id INT GENERATED ALWAYS AS IDENTITY,
	livro INT,
	emprestimo INT,
	PRIMARY KEY (id),
	CONSTRAINT fk_livro
		FOREIGN KEY (livro)
		REFERENCES livro(codigo),
	CONSTRAINT fk_emprestimo
		FOREIGN KEY (emprestimo)
		REFERENCES emprestimo(codigo)
);

INSERT INTO usuario(nome, email, endereco, telefone)
VALUES('Bruno Souza', 'brunosouza@email.com', 'rua dos Brunos, 185', '(45)9999-9999'), ----------- 01
      ('Vinicius Almeida', 'viniciusalmeida@email.com', 'rua dos Vinicius, 255', '(45)9999-9988)'), ----------- 02
      ('Pedro Vicente', 'pedrovicente@email.com', 'avenida dos Pedros, 185', '(45)9999-9977)'), ----------- 03
	  ('Andressa Dias', 'andressadias@email.com', 'travesa das Andressas, 170', '(45)9999-9966)'), ----------- 04
	  ('Jessica Sabre', 'jessicasabre@email.com', 'travessa dos Sabres, 440', '(45)9999-9955)'), ----------- 05
	  ('Amauri Vicente', 'amaurivicente@email.com', 'Av dos Idosos, 789', '(45)9999-9944)'), ----------- 06
	  ('Ana de Lourdes', 'anadelourdes@email.com', 'Av dos Idosos, 987', '(45)9999-9933)'); ----------- 07
	  
INSERT INTO emprestimo(matricula, data_emprestimo ,data_devolucao)
VALUES(1,'2021-12-20 07:27:30','2021-12-27 08:15:00'), ----------- 01 Bruno
	  (2,'2022-01-19 6:55:47','2022-01-27 07:27:15'), ----------- 02 vini
	  (3,'2021-11-07 10:25:14','2021-11-14 15:37:21'), ----------- 03 pedro
	  (4,'2021-11-01 15:35:36','2021-11-08 08:53:42'), ----------- 04 adressa
	  (5,'2021-12-05 17:47:51','2021-12-12 18:01:02'), ----------- 05 jesse
	  (6,'2022-01-03 13:50:26','2022-01-10 13:00:00'), ----------- 06 ama
	  (7,'2021-10-01 8:05:02','2021-10-08 08:10:15'), ----------- 07 ana
	  (1,'2021-10-10 9:06:20','2021-10-17 09:01:35'); ----------- 08 bruno
      
	  
INSERT INTO sessao(descricao, localizacao)
VALUES('Fantasia','Ala 2, Corredor 1'), ----------- 01
	  ('Ficçao','Ala 2, Corredor 2'), ----------- 02
	  ('Auto Ajuda','Ala 3, Corredor 3'), ----------- 03
	  ('Religioso','Ala 1, Corredor 1'), ----------- 04
	  ('Historia','Ala 2, Corredor 1'); ----------- 05
      
	  
INSERT INTO livro(sessao ,titulo ,autor)
VALUES(1, 'Espadachin de Carvão', 'Affonso Solano'), ----------- 01
      (2, 'Duna', 'Frank Herbert'), ----------- 02
	  (2, 'O Guia do Mochileiro das Galáxias', 'Douglas Adams'), ----------- 03
	  (1, 'O Senhor dos Aneis', 'J.R.R. Tolkien'), ----------- 04
	  (4, 'Biblia', 'Varios'), ----------- 05
	  (5, 'Sapiens - Uma Breve História da Humanidade', 'Yuval Noah Harari'), ----------- 06
	  (3, 'O poder do hábito', 'Charles Duhigg'), ----------- 07
	  (1, '1984', 'George Orwell'); ----------- 08
	  
INSERT INTO livro_emprestimo(livro, emprestimo)
VALUES(1, 1), ------- 01
	  (2, 2), ------- 02
	  (3, 3), ------- 03
	  (4, 4), ------- 04
	  (6, 5), ------- 05
	  (7, 6), ------- 06
	  (5, 7), ------- 07
	  (8, 8); ------- 08
      

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

SELECT
	usuario.nome,
	usuario.email,
	usuario.endereco,
	usuario.telefone,
	emprestimo.matricula,
	emprestimo.data_emprestimo,
	emprestimo.data_devolucao
FROM
	emprestimo
INNER JOIN
	usuario ON emprestimo.matricula = usuario.matricula
ORDER BY emprestimo.data_emprestimo;

SELECT
	livro.sessao,
	livro.titulo,
	livro.autor,
	sessao.descricao as sessão,
	sessao.localizacao
FROM
	livro
INNER JOIN
	sessao ON sessao.codigo = livro.sessao
ORDER BY sessao.codigo;

SELECT
	livro.sessao,
	livro.titulo,
	livro.autor,
	emprestimo.matricula,
	emprestimo.data_emprestimo,
	emprestimo.data_devolucao
FROM
	livro_emprestimo as l_e
INNER JOIN
	emprestimo ON l_e.emprestimo = emprestimo.codigo
INNER JOIN
	livro ON l_e.livro = livro.codigo;
	
SELECT
	usuario.nome,
	usuario.email,
	usuario.endereco,
	usuario.telefone,
	livro.sessao,
	livro.titulo,
	livro.autor,
	sessao.descricao,
	sessao.localizacao,
	emprestimo.matricula,
	emprestimo.data_emprestimo,
	emprestimo.data_devolucao
FROM
	livro_emprestimo as l_e
INNER JOIN
	emprestimo ON l_e.emprestimo = emprestimo.codigo
INNER JOIN
	livro ON l_e.livro = livro.codigo
INNER JOIN
	usuario ON emprestimo.matricula = usuario.matricula
INNER JOIN
	sessao ON sessao.codigo = livro.sessao;
	




-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM usuario;
SELECT * FROM emprestimo;
SELECT * FROM livro_emprestimo;
SELECT * FROM livro;
SELECT * FROM sessao;

DROP TABLE livro_emprestimo;
DROP TABLE emprestimo;
DROP TABLE usuario;
DROP TABLE livro;
DROP TABLE sessao;
