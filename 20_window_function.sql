-- Em média, de quanto em quantos dias um cliente volta?

WITH tb_cliente_dia AS (

    SELECT 
        DISTINCT
        idCliente,
        substr(DtCriacao,1,10) AS dtDia
    FROM transacoes
    WHERE substr(DtCriacao,1,4) = '2025'
    ORDER BY idCliente, dtDia
),

tb_lag AS (

    SELECT 
        *,
        lag(dtDia) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagDia
    FROM tb_cliente_dia
),

tb_diff_dt AS (

    SELECT *,
        julianday(dtDia) - julianday(lagDia) AS dtDiff
    FROM tb_lag
),

avg_cliente AS (

    SELECT 
        idCliente,
        avg(dtDiff) AS avgDiff
    FROM tb_diff_dt
    GROUP BY idCliente 
)

SELECT 
    avg(avgDiff)

FROM avg_cliente