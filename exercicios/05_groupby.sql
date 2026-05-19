-- Qual o valor médio de pontos positivos por dia?

-- COLUNAS:
    -- Dias
    -- Valor médio de pontos

SELECT 
    DISTINCT substr(DtCriacao, 1, 10) AS data,

    round(avg(qtdePontos), 2) AS qtdePontosMedio

FROM transacoes

WHERE qtdePontos > 0

GROUP BY data

ORDER BY qtdePontosMedio DESC