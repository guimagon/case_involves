/*
2) Crie uma query, considerando o SGBD MySQL, para exibir todos os dados de uma tabela de Pontos de Venda 
    (tabela origem PONTO_VENDA_UNIDADE) e restringir apenas os pontos de venda que possuem sell in maior 
    que 20.000 (campo SELLIN) e ainda ordená-los por nome do ponto de venda (campo NOME_PDV).
*/

SELECT 
	pvu.*
FROM PONTO_VENDA_UNIDADE pvu
WHERE 1=1
	AND pvu.SELLIN > 20000
ORDER BY 
	pvu.NOME_PDV ASC
