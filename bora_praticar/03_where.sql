-- Selecione todos os clientes com mais de 500 pontos

SELECT idCliente, 
        qtdePontos
FROM clientes
WHERE qtdePontos > 500