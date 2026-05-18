SELECT sum(qtdePontos) AS qtdePontos,

    sum(CASE
        WHEN qtdePontos > 0 THEN qtdePontos
        END) AS qtdePontosPositivo,

    sum(CASE
        WHEN qtdePontos < 0 THEN qtdePontos
        END) AS qtdePontosNegativo,

    count(CASE
        WHEN qtdePontos < 0 THEN qtdePontos
        END) AS qtdeTrasacoesNegativas

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'