CREATE TABLE cpu(
	cpu_id INT GENERATED ALWAYS AS IDENTITY,
	marca varchar(5),
	modelo varchar(255),
	clock REAL,
	preco REAL,
	PRIMARY KEY(cpu_id)
);

CREATE TABLE gpu(
	gpu_id INT GENERATED ALWAYS AS IDENTITY,
	marca varchar(6),
	modelo varchar(255),
	gb REAL,
	preco REAL,
	PRIMARY KEY(gpu_id)
);

CREATE TABLE memoria(
	memoria_id INT GENERATED ALWAYS AS IDENTITY,
	marca varchar(7),
	modelo varchar(255),
	gb REAL,
	preco REAL,
	PRIMARY KEY(memoria_id)
);

CREATE TABLE computadores(
	computadores_id INT GENERATED ALWAYS AS IDENTITY,
	nome varchar(255),
	cpu_id INT,
	gpu_id INT,
	memoria_id INT,
	PRIMARY KEY(computadores_id),
	CONSTRAINT fk_cpu
		FOREIGN KEY (cpu_id)
		REFERENCES cpu(cpu_id),
	CONSTRAINT fk_gpu
		FOREIGN KEY (gpu_id)
		REFERENCES gpu(gpu_id),
	CONSTRAINT fk_memoria
		FOREIGN KEY (memoria_id)
		REFERENCES memoria(memoria_id)
);

INSERT INTO cpu(marca, modelo, clock, preco)
VALUES ('AMD', 'Ryzen 9', 5.5, 5000.00), --1
	   ('INTEL', 'i9', 4.5, 6000.00), -- 2
	   ('AMD', 'Ryzen 7', 4.5, 3000.00), --3
	   ('INTEL', 'i7', 4.5, 4000.00), -- 4
	   ('AMD', 'Ryzen 5', 3.5, 2000.00), -- 5
	   ('INTEL', 'i5', 3.5, 2500.00); -- 6
	   
INSERT INTO gpu(marca, modelo, gb, preco)
VALUES ('ASUS', 'rx 6900xt', 16, 12000.00), -- 1
	   ('ASUS', 'RTX 3090', 24, 22000.00), -- 2
	   ('ASROCK', 'rx 6700xt', 12, 6000.00), -- 3
	   ('PALLIT', 'RTX 3060ti', 8, 7000.00), --4
	   ('ASROCK', 'rx 6600', 8, 3700.00), -- 5
	   ('PALLIT', 'GTX 1650', 4, 2500.00), -- 6
	   ('PALLIT', 'GTX 1050ti', 4, 1500.00); -- 7
	   
INSERT INTO memoria(marca, modelo, gb, preco)
VALUES ('CORSAIR', 'VENGENCE', 32, 1200.00), -- 1
	   ('CORSAIR', 'VENGENCE', 24, 900.00), -- 2
	   ('CORSAIR', 'VENGENCE', 16, 600.00), -- 3
	   ('XPG', 'GAMMIX', 32, 900.00), -- 4
	   ('XPG', 'GAMMIX', 24, 675.00), -- 5
	   ('XPG', 'GAMMIX', 16, 450.00), -- 6
	   ('XPG', 'GAMMIX', 8, 225.00); -- 7
	   
INSERT INTO computadores(nome, cpu_id, gpu_id, memoria_id)
VALUES ('BVS100', 2, 2, 1), -- 1
	   ('BVS10', 1, 2, 1), -- 2
	   ('BVS09', 1, 1, 1), -- 3
	   ('BVS08', 3, 2, 2), -- 4
	   ('BVS07', 3, 1, 2), -- 5
	   ('BVS06', 4, 4, 2), -- 6
	   ('BVS05', 6, 4, 3), -- 7
	   ('BVS04', 5, 5, 4), -- 8
	   ('BVS03', 5, 5, 5), -- 9
	   ('BVS02', 5, 6, 6), -- 10
	   ('BVS01', 5, 7, 7); -- 11

SELECT * FROM cpu;
SELECT * FROM gpu;
SELECT * FROM memoria;
SELECT * FROM computadores;

SELECT
computadores.computadores_id,
computadores.nome,
cpu.*,
gpu.*,
memoria.*
FROM
	computadores
INNER JOIN
	cpu on computadores.cpu_id = cpu.cpu_id
INNER JOIN
	gpu on computadores.gpu_id = gpu.gpu_id
INNER JOIN
	memoria on computadores.memoria_id = memoria.memoria_id;
	
SELECT
(cpu.preco + gpu.preco + memoria.preco) AS preco_total,
computadores.nome
FROM
	computadores
INNER JOIN
	cpu on computadores.cpu_id = cpu.cpu_id
INNER JOIN
	gpu on computadores.gpu_id = gpu.gpu_id
INNER JOIN
	memoria on computadores.memoria_id = memoria.memoria_id
	
SELECT
comp.nome AS computador,
cpu.modelo AS cpu,
cpu.clock,
gpu.modelo AS gpu,
gpu.gb,
memoria.modelo AS memoria,
memoria.gb,
(cpu.preco + gpu.preco + memoria.preco) AS preco_total
FROM
	computadores comp
INNER JOIN
	cpu on comp.cpu_id = cpu.cpu_id
INNER JOIN
	gpu on comp.gpu_id = gpu.gpu_id
INNER JOIN
	memoria on comp.memoria_id = memoria.memoria_id
WHERE comp.nome = 'BVS100';




DROP TABLE cpu;
DROP TABLE gpu;
DROP TABLE memoria;
DROP TABLE computadores;
--asus, pallit intel
--asus, asrock amd