CREATE TABLE computador(
   computador_id INT GENERATED ALWAYS AS IDENTITY,
	preco REAL,
   nome varchar(255) NOT NULL,
	PRIMARY KEY(computador_id)
);

CREATE TABLE componentes(
	componentes_id INT GENERATED ALWAYS AS IDENTITY,
	computador_id INT,
	nome varchar(255),
	GB_CLOCK REAL,
	PRIMARY KEY(componentes_id),
	CONSTRAINT fk_computador
		FOREIGN KEY(computador_id)
		REFERENCES computador(computador_id)
);

INSERT INTO computador(nome, preco)
VALUES('Monstrão', 40.000),
      ('Premium', 15.000),
	  ('Base', 7.000);

INSERT INTO componentes(computador_id, nome, GB_CLOCK)
VALUES (1, 'Ryzen 9',5.5),
	   (1, 'RTX 3090',24),
	   (1, 'CORSAIR DDR4',32),
	   (1, 'SSD M2',2000),
	   (2, 'Ryzen 7',4.5),
	   (2, 'Rx 6700xt',12),
	   (2, 'CORSAIR DDR4',24),
	   (2, 'SSD M2', 500),
	   (3, 'Ryzen 5', 3.5),
	   (3, 'RX 6600', 8),
	   (3, 'CORSAIR DDR4', 16),
	   (3, 'SSD M2', 256);

SELECT * FROM computador;
SELECT * FROM componentes;

SELECT 	
	COUNT(componentes.componentes_id) AS quantidade_componentes,
	computador.nome
FROM 
	componentes
INNER JOIN 
	computador ON componentes.computador_id = computador.computador_id
GROUP BY
	computador.nome
ORDER BY
	quantidade_componentes DESC;


DROP TABLE computador;
DROP TABLE componentes;