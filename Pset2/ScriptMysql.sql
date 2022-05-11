--- Questão 1:

SELECT numero_departamento, AVG(salario) as media_de_cada_departamento
FROM funcionario
GROUP BY numero_departamento;

--- Questão 2:

SELECT sexo, AVG(salario) as media_salarial
FROM funcionario
GROUP BY sexo;

--- Questão 3:

SELECT departamento.nome_departamento, concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as nome, funcionario.data_nascimento,  year(curdate()) - year(data_nascimento) as idade, funcionario.salario as salario 
FROM departamento
INNER JOIN funcionario on departamento.numero_departamento=funcionario.numero_departamento;

--- Questão 4:

SELECT concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as nome, funcionario.data_nascimento, year(curdate()) - year(data_nascimento) as idade, salario as salario_atual, salario*1.2 as salario_reajustado
FROM funcionario
WHERE salario < 35.000
Union
SELECT concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as nome, funcionario.data_nascimento, year(curdate()) - year(data_nascimento) as idade, salario as salario_atual, salario*1.15 as salario_reajustado 
FROM funcionario
WHERE salario >= 35.000;

--- Questão 5:

SELECT departamento.nome_departamento, 
CASE WHEN departamento.cpf_gerente=funcionario.cpf
THEN concat(primeiro_nome," ", nome_meio,".",ultimo_nome)
END as Gerente,
concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionarios
FROM departamento
INNER JOIN funcionario on departamento.numero_departamento=funcionario.numero_departamento
GROUP BY nome_departamento ASC, salario DESC;

--- Questão 6:

SELECT departamento.nome_departamento,
concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionario_com_dependente,
concat(dependente.nome_dependente," ", funcionario.nome_meio,".",funcionario.ultimo_nome) as dependente,
year(curdate()) - year(dependente.data_nascimento) as idade_dependente,
CASE dependente.sexo
WHEN 'M' THEN 'Masculino'
WHEN 'F' THEN 'Feminino'
END as sexo_dependente
FROM funcionario
INNER JOIN dependente on dependente.cpf_funcionario=funcionario.cpf
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento;

--- Questão 7:

SELECT departamento.nome_departamento, concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as nome, salario
from funcionario
INNER JOIN departamento on funcionario.numero_departamento=departamento.numero_departamento
LEFT JOIN dependente on funcionario.cpf=dependente.cpf_funcionario
WHERE dependente.nome_dependente is null;

--- Questão 8:

SELECT departamento.nome_departamento, 
concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionario,
trabalha_em.numero_projeto as nº_projeto, projeto.nome_projeto as nome_do_projeto, trabalha_em.horas as horas_trabalhadas
FROM funcionario
INNER JOIN departamento on departamento.numero_departamento=funcionario.numero_departamento
LEFT JOIN projeto on funcionario.numero_departamento=projeto.numero_departamento
LEFT JOIN trabalha_em on projeto.numero_projeto=trabalha_em.numero_projeto
WHERE funcionario.cpf=trabalha_em.cpf_funcionario
ORDER BY departamento.nome_departamento DESC;

--- Questão 9:

SELECT departamento.nome_departamento, projeto.nome_projeto, SUM(trabalha_em.horas) as horas_somadas
from trabalha_em
INNER JOIN projeto on trabalha_em.numero_projeto = projeto.numero_projeto
INNER JOIN departamento on departamento.numero_departamento = projeto.numero_departamento
GROUP BY departamento.nome_departamento, projeto.nome_projeto;

--- Questão 10:

SELECT numero_departamento, AVG(salario) as media_de_cada_departamento
FROM funcionario
GROUP BY numero_departamento;

--- Questão 11: 

SELECT concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionario, projeto.nome_projeto, (trabalha_em.horas * 50) as valor_total, trabalha_em.horas as horas_trabalhadas
from funcionario
INNER JOIN trabalha_em on trabalha_em.cpf_funcionario = funcionario.cpf
INNER JOIN projeto on projeto.numero_projeto = trabalha_em.numero_projeto
ORDER BY nome_projeto;

--- Questão 12: 

SELECT departamento.nome_departamento, projeto.nome_projeto, concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionario, trabalha_em.horas
FROM trabalha_em
INNER JOIN funcionario on trabalha_em.cpf_funcionario = funcionario.cpf
INNER JOIN projeto on trabalha_em.numero_projeto = projeto.numero_projeto
INNER JOIN departamento on departamento.numero_departamento = funcionario.numero_departamento
WHERE trabalha_em.horas = 0;

--- Questão 13:

SELECT
concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionarios,
year(curdate()) - year(funcionario.data_nascimento) as idade_funcionario,
concat(dependente.nome_dependente," ", funcionario.nome_meio,".",funcionario.ultimo_nome) as dependente,
year(curdate()) - year(dependente.data_nascimento) as idade_dependente,
CASE dependente.sexo
WHEN 'M' THEN 'Masculino'
WHEN 'F' THEN 'Feminino'
END as sexo_dependente
FROM funcionario
LEFT JOIN dependente on dependente.cpf_funcionario=funcionario.cpf
ORDER BY idade_funcionario DESC, idade_dependente DESC;

--- Questão 14:

SELECT departamento.nome_departamento, count(funcionario.cpf) as Total_Funcionarios
FROM departamento
INNER JOIN funcionario on funcionario.numero_departamento = departamento.numero_departamento
GROUP BY departamento.nome_departamento, departamento.numero_departamento, funcionario.numero_departamento
ORDER BY Total_Funcionarios DESC;

--- Questão 15:

SELECT concat(primeiro_nome," ", nome_meio,".",ultimo_nome) as funcionarios, funcionario.numero_departamento, projeto.nome_projeto
FROM funcionario
LEFT JOIN trabalha_em on trabalha_em.cpf_funcionario = funcionario.cpf
LEFT JOIN projeto on projeto.numero_projeto=trabalha_em.numero_projeto;
