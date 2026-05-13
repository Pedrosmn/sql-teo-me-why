SELECT IdCliente,
        qtdePontos,
        qtdePontos + 10 AS pontosPlus10,
        qtdePontos * 2 AS pontosDouble

FROM clientes
LIMIT 10;

SELECT IdCliente,
        DtCriacao,
        substr(DtCriacao, 1, 19) AS subStringData,
        datetime(substr(DtCriacao, 1, 19)) AS dateTimeCriacao,
        strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemanaCriacao

FROM clientes
LIMIT 10;
