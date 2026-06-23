-- como foi a curva de churn do curso de SQL?


WITH tb_prim_dia AS (

    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'

),

tb_dias_curso AS (

SELECT DISTINCT 
    idCliente,
    substr(DtCriacao,1,10) AS dtDia

FROM transacoes
WHERE substr(DtCriacao,1,10) >= '2025-08-25'
AND substr(DtCriacao,1,10) < '2025-08-30'

ORDER BY idCliente, DtCriacao

)

-- SELECT * FROM tb_dias_curso

SELECT 
    t2.dtDia,
    count(DISTINCT t1.idCliente) AS qtdeCliente

FROM tb_prim_dia AS t1

LEFT JOIN tb_dias_curso AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t2.dtDia