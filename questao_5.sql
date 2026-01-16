/*
5) Considerando a query abaixo, a pessoa engenheira de dados identificou que a performance 
    da query está muito abaixo do esperado. Imaginando que um dos problemas possa estar 
    relacionado aos índices das tabelas do banco de dados, a pessoa resolveu criar os 
    índices nas tabelas. Liste quais possíveis campos devem ser indexados nas tabelas 
    do banco de dados para que a query criada possa performar melhor. Leve em consideração 
    que nenhum campo no banco de dados está indexado. 

select
    FT.CICLO,
    FT.ID_DIM_PDV,
    FT.ID_BLOCO_ITEM,
    SUM(FT.QTD_PONTO_EXTRA),
    SUM(FTPI.TOTAL_NOTA_ITEM)
from FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE FT
    inner join TABREF_PAINEL_LOJAS_LP TPLL
        on FT.ID_DIM_PDV = TPLL.ID_DIM_PDV
        and FT.CICLO = TPLL.CICLO
    inner join FT_PERFECTSTORE_ITEM FTPI
        on FT.CICLO = FTPI.CICLO
        and FT.ID_DIM_PDV = FTPI.ID_DIM_PDV
        and FT.ID_BLOCO_ITEM = FTPI.ID_BLOCO_ITEM
        and FT.SEMANA_LP = FTPI.SEMANA_LP
where 1=1
    and FT.CICLO = 202009
    and FT.ID_DIM_PDV = 223459792
group by 
    FT.CICLO,
    FT.ID_DIM_PDV
;
*/

-- Precisamos criar índices nesses campos:
-- Tabela FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE FT
-- •	FT.ID_DIM_PDV
CREATE INDEX IDX_FT_ID_DIM_PDV ON FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE (ID_DIM_PDV);

-- •	FT.CICLO
CREATE INDEX IDX_FT_CICLO ON FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE (CICLO);

-- •	FT.ID_BLOCO_ITEM
CREATE INDEX IDX_FT_ID_BLOCO_ITEM ON FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE (ID_BLOCO_ITEM);

-- •	FT.SEMANA_LP
CREATE INDEX IDX_FT_SEMANA_LP ON FT_DOMINANCIA_PONTO_EXTRA_COMPLIANCE (SEMANA_LP);

-- Tabela TABREF_PAINEL_LOJAS_LP TPLL:
-- •	TPLL.ID_DIM_PDV
CREATE INDEX IDX_TPLL_ID_DIM_PDV ON TABREF_PAINEL_LOJAS_LP (ID_DIM_PDV);

-- •	TPLL.CICLO
CREATE INDEX IDX_TPLL_CICLO ON TABREF_PAINEL_LOJAS_LP (CICLO);

-- Tabela FT_PERFECTSTORE_ITEM FTPI
-- •	FTPI.CICLO
CREATE INDEX IDX_FTPI_CICLO ON FT_PERFECTSTORE_ITEM (CICLO);

-- •	FTPI.ID_DIM_PDV
CREATE INDEX IDX_FTPI_ID_DIM_PDV ON FT_PERFECTSTORE_ITEM (ID_DIM_PDV);

-- •	FTPI.ID_BLOCO_ITEM
CREATE INDEX IDX_FTPI_ID_BLOCO_ITEM ON FT_PERFECTSTORE_ITEM (ID_BLOCO_ITEM);

-- •	FTPI.SEMANA_LP
CREATE INDEX IDX_FTPI_SEMANA_LP ON FT_PERFECTSTORE_ITEM (SEMANA_LP);



