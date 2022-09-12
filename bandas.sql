CREATE TABLE estilos(
   estilos_id INT GENERATED ALWAYS AS IDENTITY,
   nome varchar(255) NOT NULL,
	PRIMARY KEY(estilos_id)
);

create table instrumentos(
	instrumentos_id INT GENERATED ALWAYS AS IDENTITY,
	nome varchar(255) NOT NULL,
	primary key (instrumentos_id)
);

CREATE TABLE bandas(
	bandas_id INT GENERATED ALWAYS AS IDENTITY,
	estilos_id INT,
	instrumentos_id INT,
	nome varchar(255) NOT NULL,
	PRIMARY KEY (bandas_id),
	CONSTRAINT pk_estilos
		FOREIGN KEY(estilos_id)
		REFERENCES estilos(estilos_id),
	CONSTRAINT pk_instrumentos
		FOREIGN KEY(instrumentos_id)
		REFERENCES instrumentos(instrumentos_id)
);

INSERT INTO estilos(nome)
VALUES('Rock'),
      ('Pagode'),
	  ('Rap'),
	  ('MPB'),
	  ('Sertanejo');

INSERT INTO instrumentos(nome)
VALUES('Guitarra'),
      ('Baixo'),
	  ('Bateria'),
	  ('Cavaquinho'),
	  ('Violão'),
	  ('Percussão'),
	  ('DJ');
	  
INSERT INTO bandas(nome, estilos_id, instrumentos_id)
VALUES('Matatanza',1,1),('Matatanza',1,2),('Matatanza',1,3),
      ('Sorriso Garoto',2,2),('Sorriso Garoto',2,4),('Sorriso Garoto',2,6),('Sorriso Garoto',2,5),
	  ('Regionais',3,7),('Regionais',3,2),('Regionais',3,3),
	  ('Cantando Ventoso',4,5),('Cantando Ventoso',4,1),('Cantando Ventoso',4,2),('Cantando Ventoso',4,3),('Cantando Ventoso',4,6),
	  ('Luan Monza',5,1),('Luan Monza',5,2),('Luan Monza',5,3),('Luan Monza',5,5),('Luan Monza',5,6);
---------------------------------------------------------------------------------------------------------------------------------------------
------------------------ JOIN
SELECT * FROM estilos;
SELECT * FROM instrumentos;
SELECT * FROM bandas;

SELECT
	estilos.estilos_id,
	estilos.nome,
	bandas.nome,
	instrumentos.nome
FROM bandas
INNER JOIN instrumentos ON bandas.instrumentos_id = instrumentos.instrumentos_id
INNER JOIN estilos ON estilos.estilos_id = bandas.estilos_id
ORDER BY
	estilos.estilos_id;
	
--------------------------------------------------------------------------------------------------------------------------------------------
--------------- GROUP BY

SELECT 	
	COUNT(instrumentos.instrumentos_id) AS quantidade_instrumentos,
	bandas.nome
FROM
	bandas INNER JOIN instrumentos 
	ON bandas.instrumentos_id = instrumentos.instrumentos_id
GROUP BY
	bandas.nome
ORDER BY
	quantidade_instrumentos DESC;



DROP TABLE estilos;
DROP TABLE instrumentos;
DROP TABLE bandas;