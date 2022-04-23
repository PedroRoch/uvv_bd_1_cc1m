# Inserir este bloco primeiro antes de executar as "Create Table" e os "Insert"

CREATE USER 'pedro'@'localhost' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON * . * TO 'pedro'@'localhost';

FLUSH PRIVILEGES;

quit

mysql -u pedro -p 

# Inserir a senha do usuário "pedro"

# Bloco terminado, pode inserir a "Create database uvv" "use uvv" e as "Create table" e os "Insert"

create database uvv;

# Essa database armazena as tabelas do banco de dados uvv

use uvv;

CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(50),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INT NOT NULL,
                PRIMARY KEY (cpf)
);

ALTER TABLE funcionario COMMENT 'Esta relação vai armazenar as informações dos Funcionarios.';

ALTER TABLE funcionario MODIFY COLUMN cpf CHAR(11) COMMENT 'CPF do funcionario, onde é a chave primária da tabela.';

ALTER TABLE funcionario MODIFY COLUMN primeiro_nome VARCHAR(15) COMMENT 'Primeiro nome do Funcionario.';

ALTER TABLE funcionario MODIFY COLUMN nome_meio CHAR(1) COMMENT 'Somenta a inicial do nome do meio do Funcionario.';

ALTER TABLE funcionario MODIFY COLUMN ultimo_nome VARCHAR(15) COMMENT 'Ultima parte do nome do Funcionario.';

ALTER TABLE funcionario MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do Funcionario.';

ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(50) COMMENT 'Endereço do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN salario DECIMAL(10, 2) COMMENT 'Salario do Funcionario.';

ALTER TABLE funcionario MODIFY COLUMN cpf_supervisor CHAR(11) COMMENT 'CPF do supervisor, onde na tabela é a chave estrangeira.';

ALTER TABLE funcionario MODIFY COLUMN numero_departamento INTEGER COMMENT 'Numero do departamento onde o funcionario vai se localizar, é uma chave estrangeira.';


CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                PRIMARY KEY (numero_departamento)
);

ALTER TABLE departamento COMMENT 'Tabela que armazena as informaçoẽs dos departamentos.';

ALTER TABLE departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. Esta é a chave primária da tabela.';

ALTER TABLE departamento MODIFY COLUMN nome_departamento VARCHAR(15) COMMENT 'Nome do departamento.';

ALTER TABLE departamento MODIFY COLUMN cpf_gerente CHAR(11) COMMENT 'É o CPF do gerente do departamento. É a chave estrangeira da relação Funcionario.';

ALTER TABLE departamento MODIFY COLUMN data_inicio_gerente DATE COMMENT 'É a data do início do gerente no departamento.';

CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE localizacoes_departamento (
                numero_departamento INT NOT NULL,
                Local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, Local)
);

ALTER TABLE localizacoes_departamento COMMENT 'localizacoes_departamento IS ''Onde vai armazenar as localizações dos departamentos.';

ALTER TABLE localizacoes_departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. É a chave primária desta tabela e a chave estrangeira de Departamento.';

ALTER TABLE localizacoes_departamento MODIFY COLUMN local VARCHAR(15) COMMENT 'É a localização do departamento. É a chave primária desta tabela.';

CREATE TABLE projeto (
                numero_projeto INT NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (numero_projeto)
);

ALTER TABLE projeto COMMENT 'Essa relação vai estabelecer o nome, numero e local do projeto e em qual departamento esse projeto vai ficar.';

ALTER TABLE projeto MODIFY COLUMN numero_projeto INTEGER COMMENT 'Número do projeto. Esta é a chave primária desta tabela.';

ALTER TABLE projeto MODIFY COLUMN nome_projeto VARCHAR(15) COMMENT 'Nome do projeto.';

ALTER TABLE projeto MODIFY COLUMN local_projeto VARCHAR(15) COMMENT 'Lugar onde o projeto irá ficar.';

ALTER TABLE projeto MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. É uma chave estrangeira da relação departamento.';

CREATE UNIQUE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INT NOT NULL,
                horas DECIMAL(3,1) NOT NULL,
                PRIMARY KEY (cpf_funcionario, numero_projeto)
);

ALTER TABLE trabalha_em COMMENT 'Tabela que servirá para armazenar quais funcionários trabalham em quais projetos.';

ALTER TABLE trabalha_em MODIFY COLUMN cpf_funcionario CHAR(11) COMMENT 'CPF do funcionário.  É a chave primária desta tabela e a chave estrangeira de Funcionario';

ALTER TABLE trabalha_em MODIFY COLUMN numero_projeto INTEGER COMMENT 'Número do projeto.  É a chave primária desta tabela e a chave estrangeira de projeto.';

ALTER TABLE trabalha_em MODIFY COLUMN horas DECIMAL(3, 1) COMMENT 'Horas que foram trabalhadas pelos funcionarios deste projeto.';

CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
);

ALTER TABLE dependente COMMENT 'Tabela onde armazena os familiares(dependentes) dos funcionarios.';

ALTER TABLE dependente MODIFY COLUMN cpf_funcionario CHAR(11) COMMENT 'CPF do funcionário. é a chave primaria dessa tabela e chave estrangeira da tabela Funcionario.';

ALTER TABLE dependente MODIFY COLUMN nome_dependente VARCHAR(15) COMMENT 'Nome do familiar(dependente). É a chave primaria desta tabela';

ALTER TABLE dependente MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do familiar(dependente).';

ALTER TABLE dependente MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do familiar(depente).';

ALTER TABLE dependente MODIFY COLUMN parentesco VARCHAR(15) COMMENT 'É o de parentesco do familiar(dependente) com o funcionário.';

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

insert into funcionario(primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento ) 
values('Jorge', 'E', 'Brito', '88866555576', '1937-11-10','Rua do Horto, 35, São Paulo, SP', 'M', '55000', '88866555576', 1 ),
('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20','Av.Arthur de Lima, 54, Santo André, SP', 'F', '43000', '88866555576', 4 ),
('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19','Rua Souza Lima, 35, Curitiba, PR', 'F', '25000', '98765432168', 4 ),
('André', 'V', 'Pereira', '98798798733', '1969-03-29','Rua Timbira, 35, São Paulo, SP', 'M', '25000', '98765432168', 4 ),
('Fernando', 'T', 'Wong', '33344555587', '1955-12-08','Rua da Lapa, 34, São Paulo, SP', 'M', '40000', '88866555576', 5 ),
('João', 'B', 'Silva', '12345678966', '1965-01-09','Rua das Flores, 751, São Paulo, SP', 'M', '30000', '33344555587', 5 ),
('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15','Rua Rebouças, 65, Piracicaba, SP', 'M', '38000', '33344555587', 5 ),
('Joice', 'A', 'Leite', '45345345376', '1972-07-31','Av. Lucas Obes, 74, São Paulo, SP', 'F', '25000', '33344555587', 5 );


INSERT INTO departamento( nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES( 'Matriz', 1, '88866555576', '1981-06-19'),
( 'Pesquisa', 5, '33344555587', '1988-05-22'),
( 'Administração', 4, '98765432168', ' 1995-01-01');


insert into localizacoes_departamento( numero_departamento, local)
values( 1, ' São Paulo'),
( 4, ' Mauá'),
( 5, ' Santo André'),
( 1, ' Itu'),
( 5, ' São Paulo');


insert into projeto( nome_projeto, numero_projeto, local_projeto, numero_departamento)
values( 'ProdutoX', 1, 'Santo André', 5),
( 'ProdutoY', 2, 'Itu', 5),
( 'ProdutoZ', 3, 'São Paulo', 5),
( 'Informatização', 10, 'Mauá', 4),
( 'Reorganização', 20, 'São Paulo', 1),
( 'Novosbenefícios', 30, 'Mauá', 4);


INSERT INTO dependente( cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES( '33344555587', 'Alícia', 'F', '1986-04-05', 'Filha'),
( '33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
( '33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
( '98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
( '12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
( '12345678966', 'Alícia', 'F', '1988-12-30', 'Filha'),
( '12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');


insert into trabalha_em( cpf_funcionario, numero_projeto, horas)
values( '12345678966', 1, '32.5'),
( '12345678966', 2, '7.5'),
( '66688444476', 3, '40.0'),
( '45345345376', 1, '20.0'),
( '45345345376', 2, '20.0'),
( '33344555587', 2, '10.0'),
( '33344555587', 3, '10.0'),
( '33344555587', 10, '10.0'),
( '33344555587', 20, '10.0'),
( '99988777767', 30, '30.0'),
( '99988777767', 10, '10.0'),
( '98798798733', 10, '35.0'),
( '98798798733', 30, '5.0'),
( '98765432168', 30, '20.0'),
( '98765432168', 20, '15.0'),
( '88866555576', 20, '0');
