
-- Intervalos

-- 0 - 500       > Ponei
-- 501 - 1000    > Ponei Premium
-- 1001 - 5000   > Mago Aprendiz
-- 5001 - 10000  > Mago Mestre
-- +10000        > Mago Supremo


SELECT idCliente,
        qtdePontos,

        CASE
            WHEN qtdePontos <= 500 THEN 'Ponei'
            WHEN qtdePontos <= 1000 THEN 'Ponei Premium'
            WHEN qtdePontos <= 5000 THEN 'Mago Aprendiz'
            WHEN qtdePontos <= 10000 THEN 'Mago Mestre'
            ELSE 'Mago Supremo'
        END AS categorias,

        CASE
            WHEN qtdePontos <= 1000 THEN 1
            ELSE 0
        END AS flPonei,

        CASE
            WHEN qtdePontos > 1000 THEN 1
            ELSE 0
        END AS flMago

FROM clientes

ORDER BY qtdePontos DESC
