-- Este é o Script feito no Postgres onde o Abrantes corrigiu em sala de aula

-- Questão 1 
SELECT d.nome_departamento as departamento, AVG(f.salario) as salario_medio
FROM departamento d 
INNER JOIN funcionario f ON (f.numero_departamento = d.numero_departamento)
GROUP BY departamento;

-- Questão 2 

SELECT f.sexo as sexo
     , AVG(f.salario) as salario_medio
FROM funcionario f
GROUP BY sexo
;

-- Questão 3 

Select d.nome_departamento as departamento
     , concat(f.primeiro_nome," ", f.nome_meio,". ", f.ultimo_nome) as funcionario
     , TO_CHAR(f.data_nascimento, "DD-MM-YYYY") as nascimento
     , EXTRACT(YEAR FROM AGE(f.data_nascimento) as idade
     , f.salario as salario
FROM departamento d 
INNER JOIN funcionario f ON (f.numero_departamento = d.numero_departamento)
ORDER BY departamento, funcionario
;

-- Questão 4 
SELECT concat(f.primeiro_nome," ", f.nome_meio,". ", f.ultimo_nome) as funcionario
     , EXTRACT(YEAR FROM AGE(f.data_nascimento)) as idade
     , f.salario as salario_atual
     , CASE f.salario
         WHEN f.salario < 35000 THEN f.salario * 1.2
         WHEN f.salario >= 35000 THEN f.salario * 1.15
         ELSE 0
       END as salario_reajustado
FROM funcionario f
;

-- Questão 4 

SELECT d.nome_departamento as departamento
     , g.primeiro_nome as gerente
     , f.primeiro_nome as funcionario
FROM departamento d 
INNER JOIN funcionario g ON (d.cpf_gerente = g.cpf)
INNER JOIN funcionario f ON (f.numero_departamento = d.numero_departamento)
ORDER BY departamento
       , f.salario DESC
;

-- Questão 6 
SELECT concat(f.primeiro_nome," ", f.nome_meio,". ", f.ultimo_nome) as funcionario
     , d.nome_departamento
     , d2.nome_dependente as dependente
     , EXTRACT(YEAR FROM AGE(d2.data_nascimento)) as idade
     , CASE d2.sexo
         WHEN "M" THEN "Masculino"
         WHEN "F" THEN "Feminino"
         ELSE "?" 
       END AS sexo
FROM funcinario f 
INNER JOIN departamento d ON (f.numero_departamento = d.numero_departamento)
INNER JOIN depedente d2 ON (d2.cpf_funcionario = f.cpf)
;

-- Questão 7 
SELECT concat(f.primeiro_nome," ", f.nome_meio,". ", f.ultimo_nome) as funcionario
     , d.nome_departamento
     , f.salario as salario
FROM funcinario f 
INNER JOIN departamento d ON (f.numero_departamento = d.numero_departamento)
LEFT JOIN depedente d2 ON (d2.cpf_funcionario = f.cpf)
WHERE d2.nome_dependente IS NULL
;

-- Questão 8 

SELECT d.numero_departamento as departamento
     , d.nome_projeto as projeto
     , concat(f.primeiro_nome," ", f.nome_meio,". ", f.ultimo_nome) as funcionario
     , te.horas as horas
FROM departamento
INNER JOIN projeto p ON (p.numero_departamento = d.numero_departamento)
INNER JOIN trabalha_em te ON (te.numero_projeto = p.numero_projeto)
INNER JOIN funcionario f ON (te.cpf_funcionario = f.cpf)
ORDER BY departamento, projeto
;




