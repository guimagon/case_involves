/*
3) Considerando a tabela de origem da questão anterior, crie uma query que some o valor de sell in 
    de acordo com cada ponto de venda e agrupe os resultados por mês (campo MES) e ano (campo ANO). 
    Ordene os registros por um período cronológico de forma crescente e por nome do ponto de venda.
*/

SELECT 
	pvu.NOME_PDV,
	pvu.ANO,
	pvu.MES,
	SUM(pvu.SELLIN) AS VLR_TOTAL_SELLIN
FROM PONTO_VENDA_UNIDADE pvu
WHERE 1=1
GROUP BY
	pvu.NOME_PDV,
	pvu.ANO,
	pvu.MES
ORDER BY 
	STR_TO_DATE(CONCAT(pvu.ANO, '-',pvu. MES, '-01'), '%Y-%m-%d') ASC,
	pvu.NOME_PDV asc
