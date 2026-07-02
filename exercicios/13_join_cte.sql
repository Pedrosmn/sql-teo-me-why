-- Qual o dia com maior engajamento de cada aluno que iniciou o curso no dia 01?

WITH cliente_dia_um AS (

    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
),

transacao_dia AS (

    SELECT 
        t1.IdCliente,
        substr(t2.DtCriacao,1,10) AS dia,
        count(t2.IdTransacao) AS qtdeTransDia
    FROM cliente_dia_um AS t1
    LEFT JOIN transacoes AS t2
    ON t1.idCliente = t2.idCliente
    AND t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'
    GROUP BY t1.IdCliente, dia 
    ORDER BY t1.IdCliente, count(t2.IdTransacao) DESC 
),

tb_rn AS (

    SELECT *,
        row_number() OVER (PARTITION BY idCliente ORDER BY qtdeTransDia DESC, dia) AS rn
    FROM transacao_dia
)

SELECT * 
FROM tb_rn
WHERE rn = 1
