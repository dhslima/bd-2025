CREATE TABLE produtos(
	cod INT PRIMARY KEY,
	nome VARCHAR(50),
	preco DECIMAL(10,2)
);

CREATE TABLE enderecos(
	cod INT PRIMARY KEY,
	rua VARCHAR(100),
	num INT,
	comp VARCHAR(150),
	cidade VARCHAR(50),
	uf VARCHAR(2)
);

CREATE TABLE pessoas(
	id INT PRIMARY KEY,
	nome VARCHAR(50),
	FK_endereco_cod INT,
	FOREIGN KEY(FK_endereco_cod) REFERENCES enderecos(cod)
);

CREATE TABLE pedidos(
	id INT,
	data DATE,
	FK_pessoa_id INT,
	FOREIGN KEY(FK_pessoa_id) REFERENCES pessoas(id),
	PRIMARY KEY(id)
);

CREATE TABLE telefones(
	FK_pessoa_id INT,
	telefone VARCHAR(11),
	FOREIGN KEY(FK_pessoa_id) REFERENCES pessoas(id),
	PRIMARY KEY(FK_pessoa_id, telefone)
);

CREATE TABLE pedidos_produtos(
	FK_pedido_id INT,
	FK_produto_cod INT,
	qntd INT,
	FOREIGN KEY(FK_pedido_id) REFERENCES pedidos(id),
	FOREIGN KEY(FK_produto_cod) REFERENCES produtos(cod),
	PRIMARY KEY(FK_pedido_id, FK_produto_cod)
);

