-- Quais vendedores venderam o Produto 1?
SELECT nome FROM vendedor WHERE cod_vendedor IN (
SELECT DISTINCT(FK_cod_vendedor) FROM pedido WHERE num_pedido IN (
SELECT FK_num_pedido FROM itempedido WHERE FK_cod_produto = 1));

-- Quais produtos foram comprados pelo Cliente 1?
SELECT nome FROM produto WHERE cod_produto IN (
SELECT DISTINCT (FK_cod_produto) FROM itempedido WHERE FK_num_pedido IN (
SELECT num_pedido FROM pedido WHERE FK_cod_cliente = 1));

-- Quais clientes compraram o produto mais caro do catálogo?
SELECT nome FROM cliente WHERE cod_cliente IN (
SELECT FK_cod_cliente FROM pedido WHERE num_pedido IN (
SELECT FK_num_pedido FROM itempedido WHERE FK_cod_produto IN (
SELECT cod_produto FROM produto WHERE valor_unitario = (
SELECT MAX(valor_unitario) FROM produto)))) ORDER BY nome;
