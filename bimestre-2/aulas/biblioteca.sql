CREATE TABLE estudantes(
	nome VARCHAR(50) NOT NULL,
	matricula VARCHAR(50) PRIMARY KEY,
	email VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE livros(
	titulo VARCHAR(50) NOT NULL,
	autor VARCHAR(50) NOT NULL,
	isbn VARCHAR(50) PRIMARY KEY
);

CREATE TABLE exemplares(
	patrimonio VARCHAR(50) PRIMARY KEY,
	FK_livro_isbn VARCHAR(50),
	FOREIGN KEY(FK_livro_isbn) REFERENCES livros(isbn)
);

CREATE TABLE estudantes_exemplares(
	FK_estudantes_matricula VARCHAR(50),
	FK_exemplares_patrimonio VARCHAR(50),
	dt_reserva DATE,
	prazo INT,
	PRIMARY KEY(FK_estudantes_matricula, FK_exemplares_patrimonio),
	FOREIGN KEY(FK_estudantes_matricula) REFERENCES estudantes(matricula),
	FOREIGN KEY(FK_exemplares_patrimonio) REFERENCES exemplares(patrimonio)
	
);

CREATE TABLE cartoes(
	num SERIAL PRIMARY KEY,
	dt_emissao DATE DEFAULT CURRENT_DATE,
	FK_estudantes_matricula VARCHAR(50),
	FOREIGN KEY(FK_estudantes_matricula) REFERENCES estudantes(matricula)
);
