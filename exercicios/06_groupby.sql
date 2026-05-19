-- Qual dia da semana tiveram mais pedidos em 2025?

SELECT 
    strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diasSemana,

    count(IdTransacao) AS qtdePedidosDia

FROM transacoes

GROUP BY diasSemana

ORDER BY qtdePedidosDia DESC