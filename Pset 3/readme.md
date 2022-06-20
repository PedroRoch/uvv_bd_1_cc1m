# Design e Desenvolvimento de Bancos de Dados

---
## Pset 3
 
**Aluno:** Pedro Lucas da Rocha Barros

**Professor:** Abrantes Araújo Silva Filho

**Monitoria:** Suellen Miranda Amorim

**Turma:** CC1M

# 1. Introdução
---


```SQL
with recursive Pai_Filho AS (
SELECT 	codigo, nome, codigo_pai,	0 AS nivel,	CAST(nome AS TEXT) AS hierarquia
FROM classificacao
WHERE codigo_pai IS NULL 

UNION ALL

SELECT 	c.codigo,	pf.nome,	c.codigo_pai,	pf.nivel + 1 AS nivel,	CAST(pf.hierarquia || ' >>> ' || c.nome AS TEXT) AS hierarquia
FROM classificacao c
INNER JOIN Pai_Filho pf ON c.codigo_pai = pf.codigo)
SELECT 	nivel AS "Nivel",	hierarquia AS "Hierarquia",	codigo_pai AS "Codigo do Pai"
FROM Pai_Filho
ORDER BY hierarquia;
```
aa
