SELECT nome, cpf FROM cliente ORDER BY nome;

SELECT * FROM mecanico WHERE especialidade ='Funileiro' ORDER BY nome;

SELECT Cliente.nome, Cliente.cpf, COUNT(Veiculo.Cliente_idCliente) as 'Quantidade de Carros'
FROM Cliente JOIN Veiculo ON Cliente.idCliente = Veiculo.Cliente_idCliente
GROUP BY nome
ORDER BY COUNT(Veiculo.Cliente_idCliente) DESC;

SELECT * FROM Ordem_de_Servico 
WHERE status = 'Concluido' 
HAVING valor > 5000 AND autorizacao_cliente = 1
ORDER BY valor DESC;

SELECT Cliente.nome, COUNT(Ordem_de_Servico.numero)
FROM Cliente 
JOIN Veiculo ON Cliente.idCliente = Veiculo.Cliente_idCliente
JOIN Ordem_de_Servico ON Veiculo.idVeiculo = Ordem_de_Servico.Veiculo_idVeiculo
GROUP BY nome
ORDER BY COUNT(Ordem_de_Servico.numero) DESC;