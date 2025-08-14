CREATE TABLE cliente(
	cod_cliente SERIAL,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(60),
    cep VARCHAR(9),
    estado VARCHAR(2),
    PRIMARY KEY(cod_cliente)
);

CREATE TABLE vendedor(
	cod_vendedor SERIAL,
    nome VARCHAR(100) NOT NULL,
    salario_fixo DECIMAL(10,2),
    faixa_comissao VARCHAR(1),
    PRIMARY KEY(cod_vendedor)
);

CREATE TABLE produto(
	cod_produto SERIAL,
    descricao VARCHAR(200),
    nome VARCHAR(50),
    valor_unitario DECIMAL(10,2),
    PRIMARY KEY(cod_produto)
);

CREATE TABLE pedido(
	num_pedido SERIAL,
    prazo_entrega INT NOT NULL,
    FK_cod_cliente INT,
    FK_cod_vendedor INT,
    PRIMARY KEY(num_pedido),
    FOREIGN KEY(FK_cod_cliente) REFERENCES cliente(cod_cliente),
    FOREIGN KEY(FK_cod_vendedor) REFERENCES vendedor(cod_vendedor)
);

CREATE TABLE itempedido(
	FK_num_pedido INT,
    FK_cod_produto INT,
    quantidade INT,
    PRIMARY KEY(FK_num_pedido, FK_cod_produto),
    FOREIGN KEY(FK_num_pedido) REFERENCES pedido(num_pedido),
    FOREIGN KEY(FK_cod_produto) REFERENCES produto(cod_produto)
);
