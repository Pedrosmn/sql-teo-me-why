-- Quantidade de transações acumuladas ao longo do tempo

WITH dt_count_transacao AS (

    SELECT
        substr(DtCriacao,1,10) AS dtdia,
        count(IdTransacao) AS qtdeTransacao
    FROM transacoes
    GROUP BY dtDia
    ORDER BY dtDia
)

SELECT 
    *,
    sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeTransacaoAcum

FROM dt_count_transacao