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
