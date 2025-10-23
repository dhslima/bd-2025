CREATE TABLE alunos (
	id SERIAL PRIMARY KEY,
  	nome VARCHAR(100) NOT NULL,
  	cidade VARCHAR(60) NOT NULL,
  	nascimento DATE NOT NULL
);

CREATE TABLE cursos (
  	id SERIAL PRIMARY KEY,
  	titulo VARCHAR(100) NOT NULL UNIQUE,
  	area VARCHAR(40)  NOT NULL,
  	carga_horas INTEGER NOT NULL
);

CREATE TABLE turmas (
  	id SERIAL PRIMARY KEY,
  	FK_curso_id INTEGER,
  	ano INTEGER NOT NULL,
  	semestre INTEGER NOT NULL,
	FOREIGN KEY(FK_curso_id) REFERENCES cursos(id)
);

CREATE TABLE matriculas (
  	id SERIAL PRIMARY KEY,
  	FK_aluno_id INTEGER,
  	FK_turma_id INTEGER,
  	data DATE NOT NULL,
  	status VARCHAR(20) NOT NULL,
	FOREIGN KEY(FK_aluno_id) REFERENCES alunos(id),
	FOREIGN KEY(FK_turma_id) REFERENCES turmas(id)
);

CREATE TABLE avaliacoes (
  	id SERIAL PRIMARY KEY,
  	FK_matricula_id INTEGER,
  	tipo VARCHAR(20) NOT NULL,
  	nota NUMERIC(4,1) NOT NULL,
	FOREIGN KEY(FK_matricula_id) REFERENCES matriculas(id)
);

INSERT INTO alunos (nome, cidade, nascimento) VALUES
 ('Ana Lima', 'Recife', '2004-03-12'),
 ('Bruno Souza', 'Maceió', '2003-07-22'),
 ('Carla Menezes', 'Salvador', '2002-11-03'),
 ('Diego Alves', 'Recife', '2005-01-30'),
 ('Elisa Rocha', 'Natal', '2004-09-17'),
 ('Felipe Nunes', 'Aracaju', '2003-02-08'),
 ('Gabriela Santos', 'Maceió', '2002-05-14'),
 ('Henrique Couto', 'João Pessoa', '2001-12-28'),
 ('Isabela Pires', 'Recife', '2004-06-05'),
 ('João Victor', 'Maceió', '2003-10-19');

INSERT INTO cursos (titulo, area, carga_horas) VALUES
 ('SQL para Iniciantes', 'Dados', 20),
 ('Python Básico', 'Programação', 30),
 ('Excel para Negócios', 'Dados', 15),
 ('HTML & CSS Fundamentos','Web', 25),
 ('Power BI Essencial', 'Dados', 25);

-- turmas de 2025
INSERT INTO turmas (FK_curso_id, ano, semestre) VALUES
 (1, 2025, 1),
 (1, 2025, 2),
 (3, 2025, 1),
 (4, 2025, 1),
 (5, 2025, 2),
 (2, 2025, 1);

-- matrículas (datas de 2025)
INSERT INTO matriculas (FK_aluno_id, FK_turma_id, data, status) VALUES
 (1, 1, '2025-02-10', 'ativa'),
 (2, 1, '2025-02-12', 'ativa'),
 (3, 3, '2025-03-01', 'ativa'),
 (4, 1, '2025-02-15', 'ativa'),
 (5, 4, '2025-03-05', 'ativa'),
 (6, 6, '2025-02-20', 'ativa'),
 (7, 3, '2025-03-02', 'ativa'),
 (8, 1, '2025-02-18', 'trancada'),
 (9, 5, '2025-08-01', 'ativa'),
 (10,6, '2025-02-21', 'ativa'),
 (1, 3, '2025-03-01', 'ativa'),
 (2, 4, '2025-03-06', 'ativa'),
 (4, 6, '2025-02-22', 'ativa'),
 (7, 5, '2025-08-02', 'ativa'),
 (6, 1, '2025-02-23', 'ativa'),
 (8, 2, '2025-08-10', 'ativa'),
 (9, 3, '2025-03-03', 'ativa'),
 (10,5, '2025-08-03', 'ativa');

-- avaliações (3 por matrícula, salvo exceções)
INSERT INTO avaliacoes (FK_matricula_id, tipo, nota) VALUES
 (1,'Prova1',8.5),(1,'Prova2',7.0),(1,'Trabalho',9.0),
 (2,'Prova1',6.0),(2,'Prova2',6.5),(2,'Trabalho',7.0),
 (3,'Prova1',9.0),(3,'Prova2',8.5),(3,'Trabalho',8.0),
 (4,'Prova1',5.5),(4,'Prova2',6.0),(4,'Trabalho',5.0),
 (5,'Prova1',8.0),(5,'Prova2',7.5),(5,'Trabalho',8.5),
 (6,'Prova1',7.0),(6,'Prova2',7.5),(6,'Trabalho',8.0),
 (7,'Prova1',6.5),(7,'Prova2',7.0),(7,'Trabalho',6.0),
 (8,'Prova1',5.0),(8,'Prova2',5.5),
 (9,'Prova1',9.0),(9,'Prova2',9.5),(9,'Trabalho',9.0),
 (10,'Prova1',6.0),(10,'Prova2',6.0),(10,'Trabalho',6.0),
 (11,'Prova1',8.5),(11,'Prova2',9.0),(11,'Trabalho',8.0),
 (12,'Prova1',7.5),(12,'Prova2',7.0),(12,'Trabalho',7.0),
 (13,'Prova1',6.5),(13,'Prova2',6.0),(13,'Trabalho',6.0),
 (14,'Prova1',8.0),(14,'Prova2',8.5),(14,'Trabalho',8.5),
 (15,'Prova1',7.5),(15,'Prova2',7.0),(15,'Trabalho',7.0),
 (16,'Prova1',8.0),(16,'Prova2',7.5),(16,'Trabalho',8.0),
 (17,'Prova1',8.0),(17,'Prova2',8.5),(17,'Trabalho',9.0),
 (18,'Prova1',7.5),(18,'Prova2',8.0),(18,'Trabalho',7.5);
