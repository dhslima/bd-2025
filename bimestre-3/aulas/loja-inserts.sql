INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 1', 'Maceió', '57035000', 'AL');
INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 2', 'Maceió', '57035000', 'AL');
INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 3', 'Recife', '57035000', 'PE');
INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 4', 'João Pessoa', '57035000', 'PB');

INSERT INTO produto (nome, descricao, valor_unitario) VALUES 
('Produto 1', 'Descricao 1', 20.5);
INSERT INTO produto (nome, descricao, valor_unitario) VALUES 
('Produto 2', 'Descricao 2', 5);
INSERT INTO produto (nome, descricao, valor_unitario) VALUES 
('Produto 3', 'Descricao 3', 12.3);
INSERT INTO produto (nome, descricao, valor_unitario) VALUES 
('Produto 4', 'Descricao 4', 1.29);

INSERT INTO vendedor (nome, salario_fixo, faixa_comissao) VALUES
('Vendedor 1', 500, 'A');
INSERT INTO vendedor (nome, salario_fixo, faixa_comissao) VALUES
('Vendedor 2', 350, 'B');
INSERT INTO vendedor (nome, salario_fixo, faixa_comissao) VALUES
('Vendedor 3', 350, 'B');
INSERT INTO vendedor (nome, salario_fixo, faixa_comissao) VALUES
('Vendedor 4', 700, 'C');

INSERT INTO pedido (prazo_entrega, FK_cod_cliente, FK_cod_vendedor) VALUES
(20, 1, 1);
INSERT INTO pedido (prazo_entrega, FK_cod_cliente, FK_cod_vendedor) VALUES
(30, 2, 2);
INSERT INTO pedido (prazo_entrega, FK_cod_cliente, FK_cod_vendedor) VALUES
(10, 3, 3);
INSERT INTO pedido (prazo_entrega, FK_cod_cliente, FK_cod_vendedor) VALUES
(15, 4, 4);

INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(1,1,5);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(1,2,15);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(1,4,2);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(2,2,5);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(2,4,1);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(3,1,2);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(3,2,5);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(3,3,1);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(3,4,2);
INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(4,1,4);

INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 5', 'Maceió', '57035000', 'AL');
INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 6', 'Maceió', '57035000', 'AL');
INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 7', 'Recife', '57035000', 'PE');
INSERT INTO cliente (nome, cidade, cep, estado) VALUES
('Cliente 8', 'João Pessoa', '57035000', 'PB');

INSERT INTO pedido (prazo_entrega, FK_cod_cliente, FK_cod_vendedor) VALUES
(5, 1, 4),
(12, 5, 2),
(10, 6, 1),
(2, 4, 3),
(8, 7, 1),
(12, 8, 2),
(10, 8, 2),
(7, 2, 4);

INSERT INTO itempedido (FK_num_pedido, FK_cod_produto, quantidade) VALUES
(5,1,2),
(5,2,1),

(6,2,1),
(6,3,1),
(6,4,2),

(7,2,10),

(8,4,2),

(9,1,1),
(9,2,1),
(9,4,2),

(10,1,2),

(11,1,3),
(11,3,2),

(12,1,2),
(12,3,5),
(12,4,10);
