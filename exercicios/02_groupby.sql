-- Qual cliente juntou mais pontos positivos em 2025-05?

SELECT 
    IdCliente,
    sum(CASE
        WHEN qtdePontos > 0 THEN qtdePontos
        END) AS somaPontosPositivos

from transacoes

WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01'

GROUP BY idCliente

ORDER BY somaPontosPositivos DESC

LIMIT 1