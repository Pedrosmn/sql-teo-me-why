-- Listar todas as transações adicionando uma coluna nova, sinalizando "alto", "médio" e "baixo" para o valor dos pontos [<10; <500; >=500]


SELECT IdTransacao,
        qtdePontos,
        CASE
            WHEN qtdePontos < 10 THEN 'Baixo'
            WHEN qtdePontos < 500 THEN 'Médio'
            WHEN qtdePontos >= 500 THEN 'Alto'
        END AS classificacao


FROM transacoes

ORDER BY qtdePontos DESC