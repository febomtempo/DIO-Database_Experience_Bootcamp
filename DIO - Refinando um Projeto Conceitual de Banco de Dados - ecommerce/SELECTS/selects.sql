SELECT * FROM cliente ORDER BY nome;

SELECT * FROM cliente WHERE c_tipo = 1 ORDER BY nome;

SELECT * FROM pedido WHERE status ='Concluido' HAVING frete <50 ORDER BY frete DESC;

SELECT Cliente.nome, Pedido.descricao, Entrega.status
FROM Cliente
JOIN Pedido ON Cliente.idCliente = Pedido.Cliente_idCliente
JOIN Entrega ON Pedido.idPedido = Entrega.Pedido_idPedido
WHERE Entrega.status = 'Concluido' AND Cliente.nome LIKE 'a%'
ORDER BY nome ASC;

SELECT Cliente.nome, Pedido.descricao, Pagamento.status
FROM Cliente
JOIN Pedido ON Cliente.idCliente = Pedido.Cliente_idCliente
JOIN Pagamento ON Pedido.idPedido = Pagamento.Pedido_idPedido
WHERE Pagamento.tipo = 1
ORDER BY Pagamento.status ASC;