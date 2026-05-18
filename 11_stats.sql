SELECT 
    round(avg(qtdePontos), 2) AS mediaPontos,
    min(qtdePontos) AS minPontos,
    max(qtdePontos) AS maxPontos,

    sum(flTwitch) AS qtdeTwitch,
    sum(flEmail) AS qtdeEmail

FROM clientes