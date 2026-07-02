-- Qual a quantidade de transações por dia e por pessoa, durante o curso, e a quantidade acumulada?

WITH tb_trans_dia AS (

    SELECT 
        idCliente,
        substr(DtCriacao,1,10) AS dtDia,
        count(IdTransacao) AS qtdeTransacao

    FROM transacoes

    WHERE substr(DtCriacao,1,10) >= '2025-08-25'
    AND substr(DtCriacao,1,10) < '2025-08-30'

    GROUP BY idCliente, dtDia
),

tb_acum AS (

    SELECT 
        *,
        sum(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS qtdeAcumTrans,
        lag(qtdeTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagTransacao

    FROM tb_trans_dia
)

SELECT
    *,
    1. * qtdeTransacao / lagTransacao

FROM tb_acum