-- SELECIONE TODOS OS VENDEDORES COM FAIXA DE COMISSÃO B
SELECT * FROM vendedor WHERE faixa_comissao = 'B';

-- Quais produtos eu poderia comprar com R$10
SELECT * FROM produto WHERE valor_unitario <= 10;

-- Quais os numeros do pedido realizado pelo Cliente 1
SELECT * FROM pedido WHERE FK_cod_cliente = (SELECT cod_cliente FROM cliente WHERE nome = 'Cliente 1');

-- Qual o prazo médio de entrega dos produtos
SELECT AVG(prazo_entrega) FROM pedido;

-- Quais vendedores atenderam o Cliente 1
SELECT nome FROM vendedor WHERE cod_vendedor IN 
(SELECT FK_cod_vendedor FROM pedido WHERE FK_cod_cliente = 
(SELECT cod_cliente FROM cliente WHERE nome = 'Cliente 1'));

-- Quais foram os produtos do pedido 1
SELECT nome FROM produto WHERE cod_produto IN (SELECT FK_cod_produto FROM itempedido WHERE FK_num_pedido = 1);

