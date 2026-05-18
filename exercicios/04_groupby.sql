-- Quantos produtos são de RPG?

SELECT DescCategoriaProduto,
        count(*)

FROM produtos

GROUP BY DescCategoriaProduto