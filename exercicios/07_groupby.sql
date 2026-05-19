-- Qual o produto mais transacionado?

SELECT 
    IdProduto,
    count(idTransacaoProduto) AS qtdeTransacoes

FROM transacao_produto

GROUP BY IdProduto

ORDER BY qtdeTransacoes DESC