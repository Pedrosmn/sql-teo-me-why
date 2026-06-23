-- Dentre os clientes de Janeiro/2025, quantos assistiram o curso de SQL?

WITH tb_cliente_jan AS (

    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) >= '2025-01-01'
    AND substr(DtCriacao,1,10) < '2025-02-01'
    ORDER BY DtCriacao 

),

tb_cliente_sql AS (

    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) >= '2025-08-25'
    AND substr(DtCriacao,1,10) < '2025-08-30'

)

SELECT 
    count(t1.idCliente) AS clienteJaneiro,
    count(t2.idCliente) AS clienteCurso

FROM tb_cliente_jan AS t1

LEFT JOIN tb_cliente_sql AS t2
ON t1.idCliente = t2.idCliente
