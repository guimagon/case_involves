/*
4) Considerando a tabela de origem da questão 2 e uma segunda tabela VISITAS_PONTO_VENDA, 
    crie uma query que calcule a quantidade de visitas do ponto de venda de nome INVOLVES, 
    sabendo-se que a tabela de visitas possui um campo que identifica se o ponto de venda 
    foi visitado ou não chamado FL_VISITADO (Se 1 = Ponto de venda visitado / Se 0 = Ponto 
    de venda não visitado). O campo chave que liga as duas tabelas é ID_PDV (na tabela 
    PONTO_VENDA_UNIDADE) e FK_PDV(na tabela VISITAS_PONTO_VENDA). A query deve mostrar apenas 
    as informações de nome do ponto de venda e quantidade de visitas realizadas.
*/

select 
	pvu.NOME_PDV ,
	sum(vpv.FL_VISITADO) as qtd_visitas
from PONTO_VENDA_UNIDADE pvu 
	left join VISITAS_PONTO_VENDA vpv 
		on pvu.ID_PDV = vpv.FK_PDV 
		and pvu.ANO = year(vpv.DATA_VISITA)
		and pvu.MES = month(vpv.DATA_VISITA)
where 1=1
	and pvu.NOME_PDV = 'INVOLVES'
group by 
	pvu.NOME_PDV 
