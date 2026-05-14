 -- Quantos clientes fizeram transações no mês de 05/2025?

 SELECT count(*) AS TotalTransacoes,
        count(DISTINCT idCliente) AS ClintesTrasacoes

 FROM transacoes

 WHERE DtCriacao >= '2025-05-01'
 AND DtCriacao <='2025-05-31'

 ORDER BY DtCriacao DESC