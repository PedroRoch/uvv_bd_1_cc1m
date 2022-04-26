-- Nesse Script é IMPORTANTE rodar um bloco a cada vez, está indicado quando cada bloco começa e termina

CREATE ROLE pedro SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN PASSWORD '12345';

create database uvv with 
	owner = pedro
	template = template0
	encoding = UTF8
	lc_collate = 'pt_BR.UTF-8'
	lc_ctype = 'pt_BR.UTF-8'
	allow_connections = true;

\c uvv pedro;

-- este bloco termina aqui, agora insira a senha do usuário pedro

--Este bloco começa aqui
create schema elmasri;

SET SEARCH_PATH TO elmasri, "$pedro", public;

ALTER USER pedro
SET SEARCH_PATH TO elmasri, "$pedro", public;
-- Este bloco termina aqui, pode inserir o proximo bloco "Comment on schema" até finalizar a parte da "Alter table" antes dos insert

-- Este bloco começa aqui 
COMMENT ON SCHEMA elmasri IS 'Esse Schema armazena as tabelas do banco de dados uvv';

CREATE TABLE elmasri.Funcionario (
                CPF CHAR(11) NOT NULL,
                Primeiro_Nome VARCHAR(15) NOT NULL,
                Nome_meio CHAR(1),
                Ultimo_nome VARCHAR(15) NOT NULL,
                Data_Nascimento DATE,
                endereco VARCHAR(50),
                sexo CHAR(1),
                salario NUMERIC(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT pk_funcionario PRIMARY KEY (CPF)
);

COMMENT ON TABLE Funcionario IS 'Esta relação vai armazenar as informações dos Funcionarios.';
COMMENT ON COLUMN Funcionario.CPF IS 'CPF do funcionario, onde é a chave primária da tabela.';
COMMENT ON COLUMN Funcionario.cpf_supervisor IS 'CPF do supervisor, onde na tabela é a chave estrangeira.';


CREATE TABLE elmasri.Departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT pk_departamento PRIMARY KEY (numero_departamento)
);

COMMENT ON TABLE Departamento IS 'Tabela onde armazena o Departamento, o numero dele, o nome, quem participa do departamento e a data de inicio do departamento';
COMMENT ON COLUMN Departamento.cpf_gerente IS 'É o cpf da pessoa que é gerente do departamento';


CREATE UNIQUE INDEX departamento_idx
 ON elmasri.Departamento
 ( nome_departamento );

CREATE TABLE elmasri.Localizacoes_departamento (
                numero_departamento INTEGER NOT NULL,
                Local VARCHAR(15) NOT NULL,
                CONSTRAINT pk_localizacoes_departamento PRIMARY KEY (numero_departamento, Local)
);
COMMENT ON TABLE Localizacoes_departamento IS 'Essa relação vai estabelecer onde fica cada departamento';
COMMENT ON COLUMN Localizacoes_departamento.numero_departamento IS 'O numero_departamento é uma chave primaria dessa relação e uma chave estrangeira da relação Departamento';

CREATE TABLE elmasri.Projeto (
                numero_projeto INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                local_projeto VARCHAR(15),
                CONSTRAINT pk_projeto PRIMARY KEY (numero_projeto)
);

COMMENT ON TABLE Projeto IS 'Essa relação vai estabelecer o nome, numero e local do projeto e em qual departamento esse projeto vai ficar';
COMMENT ON COLUMN Projeto.numero_departamento IS 'O numero_departamento é uma chave estrangeira da relação Departamento';

CREATE UNIQUE INDEX projeto_idx
 ON elmasri.Projeto
 ( nome_projeto );

CREATE TABLE elmasri.Trabalha_Em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL,
                horas NUMERIC(3,1),
                CONSTRAINT pk_trabalha_em PRIMARY KEY (cpf_funcionario, numero_projeto)
);

COMMENT ON TABLE Trabalha_Em IS 'Essa relação vai estabelecer onde o funcionario vai trabalhar, o numero do projeto que ele vai atuar e as horas que vai trabalhar';
COMMENT ON COLUMN Trabalha_Em.cpf_funcionario IS 'Cpf_funcionario é uma chave estrangeira que se relaciona com a relação funcionario';
COMMENT ON COLUMN Trabalha_Em.numero_projeto IS 'numero_projeto é uma chave estrangeira que se relaciona com a relação projeto';


CREATE TABLE elmasri.Dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR,
                data_nascimento DATE,
                parentesco VARCHAR(8) NOT NULL,
                CONSTRAINT pk_dependente PRIMARY KEY (cpf_funcionario, nome_dependente)
);

COMMENT ON TABLE Dependente IS 'Relação onde vai armazenar os familiares dos funcionarios';
COMMENT ON COLUMN Dependente.cpf_funcionario IS 'Cpf_funcionario é uma chave estrangeira que se relaciona com a relação funcionario';

ALTER TABLE elmasri.Dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.Funcionario (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.Departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES elmasri.Funcionario (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.Trabalha_Em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES elmasri.Funcionario (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.Funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES elmasri.Funcionario (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.Projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.Departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.Localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES elmasri.Departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE elmasri.Trabalha_Em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES elmasri.Projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Este bloco termina aqui

-- Este bloco começa aqui, nesse passo é DE EXTREMA IMPORTÂNCIA COLOCAR CADA INSERT DE CADA VEZ para um bom funcionamento do código
insert into funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento,endereco, sexo, salario, cpf_supervisor, numero_departamento) 	
	values  ('Fernando', 'T', 'Wong', 33344555587, '1955-08-12', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40.000, 88866555576,5),
			('João', 'B', 'Silva', 12345678966, '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, 33344555587, 5),
			('Alice', 'J', 'Zelaya', 99988777767, '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25.000, 98765432168, 4),
			('Jennifer', 'S', 'Souza', 98765432168, '1941-06-20', 'Av.Arthur de Lima, 54, Santo André, SP', 'F', 43.000, 88866555576, 4),
			('Ronaldo', 'K', 'Lima', 66688444476, '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38.000, 33344555587, 5),
			('Joice', 'A', 'Leite', 45345345376, '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25.000, 33344555587, 5),
			('André', 'V', 'Pereira', 98798798733, '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25.000, 98765432168, 4),
			('Jorge', 'E', 'Brito', 88866555576, '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55.000, 88866555576, 1);
 -- Este bloco termina aqui    
     
-- Este bloco começa aqui		
insert into departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
	values ('Pesquisa', 5, 33344555587, '1988-05-22'),
 	       ('Administração', 4, 98765432168, '1995-01-01'),
 	       ('Matriz', 1, 88866555576, '1981-06-19');
-- Este bloco termina aqui	 

-- Este bloco começa aqui
insert into localizacoes_departamento (numero_departamento, local) 	 
	values (1, 'São Paulo'),
		   (4, 'Mauá'),
		   (5, 'Santo André'),
		   (5, 'Itu'),
		   (5, 'São Paulo');
-- Este bloco termina aqui	

-- Este bloco começa aqui
insert into projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
	values ('ProdutoX', 1, 'Santo André', 5),
		   ('ProdutoY', 2, 'Itu', 5),
		   ('ProdutoZ', 3, 'São Paulo', 5),
		   ('Informatização', 10,'Mauá', 4),
		   ('Reogarnização', 20, 'São Paulo', 1),
		   ('Novosbenefícios', 30, 'Mauá', 4);
-- Este bloco termina aqui	

-- Este bloco começa aqui
insert into dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
	values (33344555587, 'Alicia', 'F', '1986-04-05', 'Filha'),
		   (33344555587, 'Tiago', 'M', '1983-10-25', 'Filho'),
		   (33344555587, 'Janaína', 'F', '1958-05-03', 'Esposa'),
		   (98765432168, 'Antonio', 'M', '1942-02-28', 'Marido'),
		   (12345678966, 'Michael', 'M', '1988-01-04', 'Filho'),
		   (12345678966, 'Alicia', 'F', '1988-12-30', 'Filha'),
		   (12345678966, 'Elizabeth', 'F', '1967-05-05', 'Esposa');
-- Este bloco termina aqui	

-- Este bloco começa aqui
insert into trabalha_em (cpf_funcionario, numero_projeto, horas)
	values (12345678966, 1, 32.5),
		   (12345678966, 2, 7.5),
		   (66688444476, 3, 40.0),
		   (45345345376, 1, 20.0),
		   (45345345376, 2, 10.0),
		   (33344555587, 2, 10.0),
		   (33344555587, 3, 10.0),
		   (33344555587, 10, 10.0),
		   (33344555587, 20, 10.0),
		   (99988777767, 30, 30.0),
		   (99988777767, 10, 10.0),
		   (98798798733, 10, 35.0),
		   (98798798733, 30, 5.0),
		   (98765432168, 30, 20.0),
		   (98765432168, 20, 15.0),
		   (88866555576, 20, 0);
-- Este bloco termina aqui	
