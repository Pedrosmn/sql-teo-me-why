-- Qual a quantidade de transações por dia, durante o curso, e a quantidade acumulada?

WITH tb_trans_dia AS ( 

    SELECT 
        substr(DtCriacao,1,10) AS dtDia,
        count(IdTransacao) AS qtdeTransacao

    FROM transacoes

    WHERE substr(DtCriacao,1,10) >= '2025-08-25'
    AND substr(DtCriacao,1,10) < '2025-08-30'

    GROUP BY substr(DtCriacao,1,10)
)

SELECT 
    *,
    sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeAcumTrans

FROM tb_trans_dia