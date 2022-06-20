# Design e Desenvolvimento de Bancos de Dados

---
## Pset 3
 
**Aluno:** Pedro Lucas da Rocha Barros

**Professor:** Abrantes Araújo Silva Filho

**Monitoria:** Suellen Miranda Amorim

**Turma:** CC1M

# 1. Introdução (Query Hierárquica (Recursiva)) 
---

Este PSet teve como o objetivo de recuperar os dados da tabela ["classificacao"](https://github.com/PedroRoch/uvv_bd_1_cc1m/blob/main/Pset%203/ScriptSQL.SQL) deste  de forma que os itens estejam apresentados de forma hierárquica (Pai >>> Filho >>> Neto).

Vale apontar que só foi possivel graças ao script do Postgres do [Pset1](https://github.com/PedroRoch/uvv_bd_1_cc1m/blob/main/PSet1/PostgresSQLCorrigidoPorAbrantes.SQL).


```SQL
with recursive Pai_Filho AS (
SELECT 	codigo, nome as hierarquia, codigo_pai
FROM classificacao
WHERE codigo_pai IS NULL 

UNION ALL

SELECT 	c.codigo, pf.hierarquia, c.codigo_pai
FROM classificacao c
INNER JOIN Pai_Filho pf ON c.codigo_pai = pf.codigo)
SELECT hierarquia AS "Hierarquia",	codigo_pai AS "Código do Pai"
FROM Pai_Filho
ORDER BY hierarquia;
```

Caso esteja tudo correto, deverá aparecer algo mais ou menos assim:

![2022-06-20 19-47-40](https://user-images.githubusercontent.com/103005263/174686161-b6cdf7d3-496e-4b53-94cc-acdb43e18cf7.gif)

Este Pset serviu para nos introduzir sobre as Querys Recursivas no Banco de dados.

Até a Proxima!!
