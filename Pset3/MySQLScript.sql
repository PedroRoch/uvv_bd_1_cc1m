CREATE USER 'pedro'@'localhost' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON * . * TO 'pedro'@'localhost';

FLUSH PRIVILEGES;

quit

mysql -u pedro -p 

create database congresso;

use congresso;


CREATE TABLE PATROCINADORES (
                cod_patrocinador CHAR(11) NOT NULL,
                nome_patro VARCHAR(60) NOT NULL,
                pessoa_contato CHAR NOT NULL,
                ramo_ativ VARCHAR(30) NOT NULL,
                PRIMARY KEY (cod_patrocinador)
);

ALTER TABLE PATROCINADORES COMMENT 'Tabela onde vai armazenar as informações sobre os Patrocinadores';

ALTER TABLE PATROCINADORES MODIFY COLUMN cod_patrocinador CHAR(11) COMMENT 'codigo patrocinador';

ALTER TABLE PATROCINADORES MODIFY COLUMN nome_patro VARCHAR(60) COMMENT 'nome dos patrocinadores';

ALTER TABLE PATROCINADORES MODIFY COLUMN pessoa_contato CHAR COMMENT 'contato do patrocinador';

ALTER TABLE PATROCINADORES MODIFY COLUMN ramo_ativ VARCHAR(30) COMMENT 'ramo atividade dos patrocinadores';


CREATE TABLE ender_patro (
                cod_patrocinador CHAR(11) NOT NULL,
                logradouro VARCHAR(200) NOT NULL,
                numero CHAR(10) NOT NULL,
                complemento_endereco VARCHAR(10) NOT NULL,
                bairro_patrocinadores VARCHAR(20) NOT NULL,
                uf_patrocinadores CHAR(2) NOT NULL,
                cep_patrocinadores CHAR(9) NOT NULL,
                numero_1 CHAR(10) NOT NULL,
                cidade_patrocinadores VARCHAR(30) NOT NULL,
                PRIMARY KEY (cod_patrocinador)
);

ALTER TABLE ender_patro MODIFY COLUMN cod_patrocinador CHAR(11) COMMENT 'codigo patrocinador';

ALTER TABLE ender_patro MODIFY COLUMN logradouro VARCHAR(200) COMMENT 'logradouro do endereço dos patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN numero CHAR(10) COMMENT 'numero do endereco dos patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN complemento_endereco VARCHAR(10) COMMENT 'complemento dos patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN bairro_patrocinadores VARCHAR(20) COMMENT 'bairro dos patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN uf_patrocinadores CHAR(2) COMMENT 'uf do patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN cep_patrocinadores CHAR(9) COMMENT 'cep do patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN numero_1 CHAR(10) COMMENT 'numero do endereco dos patrocinadores';

ALTER TABLE ender_patro MODIFY COLUMN cidade_patrocinadores VARCHAR(30) COMMENT 'cidade dos patrocinadores';


CREATE TABLE tel_patro (
                cod_patrocinador CHAR(11) NOT NULL,
                telefone_cel CHAR(11) NOT NULL,
                telefone_fixo CHAR(9) NOT NULL,
                PRIMARY KEY (cod_patrocinador)
);

ALTER TABLE tel_patro COMMENT 'Telefone patrocinador';

ALTER TABLE tel_patro MODIFY COLUMN cod_patrocinador CHAR(11) COMMENT 'codigo patrocinador';

ALTER TABLE tel_patro MODIFY COLUMN telefone_cel CHAR(11) COMMENT 'telefone celular dos patrocinadores';

ALTER TABLE tel_patro MODIFY COLUMN telefone_fixo CHAR(9) COMMENT 'telefone fixo dos patrocinadores';


CREATE TABLE CONGRESSOS (
                cod_cong CHAR(11) NOT NULL,
                nome VARCHAR(60) NOT NULL,
                desc_cong VARCHAR(100) NOT NULL,
                data_inicio DATE NOT NULL,
                data_fim DATE NOT NULL,
                hora_ini TIME NOT NULL,
                hora_fim TIME NOT NULL,
                pub_alvo VARCHAR(30) NOT NULL,
                PRIMARY KEY (cod_cong)
);

ALTER TABLE CONGRESSOS COMMENT 'Tabela onde vai armazenar as informações sobre o Congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN cod_cong CHAR(11) COMMENT 'codigo do congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN nome VARCHAR(60) COMMENT 'nome do congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN desc_cong VARCHAR(100) COMMENT 'descricao sobre o congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN data_inicio DATE COMMENT 'data de inicio do congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN data_fim DATE COMMENT 'data de fim do congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN hora_ini TIME COMMENT 'horario de inicio';

ALTER TABLE CONGRESSOS MODIFY COLUMN hora_fim TIME COMMENT 'horario do fim do congresso';

ALTER TABLE CONGRESSOS MODIFY COLUMN pub_alvo VARCHAR(30) COMMENT 'publico alvo do congresso';


CREATE TABLE PROGRAMAS (
                cod_progama CHAR(11) NOT NULL,
                nome VARCHAR(60) NOT NULL,
                PRIMARY KEY (cod_progama)
);

ALTER TABLE PROGRAMAS COMMENT 'Tabela onde vai armazenar as informações sobre os Programas do Congresso';

ALTER TABLE PROGRAMAS MODIFY COLUMN cod_progama CHAR(11) COMMENT 'Codigo do programa';

ALTER TABLE PROGRAMAS MODIFY COLUMN nome VARCHAR(60) COMMENT 'Nome do programa';


CREATE TABLE PALESTRAS (
                cod_palestra CHAR(11) NOT NULL,
                nome_da_palestra VARCHAR(50) NOT NULL,
                classificacao CHAR(1) NOT NULL,
                PRIMARY KEY (cod_palestra)
);

ALTER TABLE PALESTRAS COMMENT 'Tabela onde vai armazenar as informações sobre as Palestras';

ALTER TABLE PALESTRAS MODIFY COLUMN cod_palestra CHAR(11) COMMENT 'codigo da palestra';

ALTER TABLE PALESTRAS MODIFY COLUMN nome_da_palestra VARCHAR(50) COMMENT 'nome da palestra';

ALTER TABLE PALESTRAS MODIFY COLUMN classificacao CHAR(1) COMMENT 'M para magna e C para comum';

ALTER TABLE PALESTRAS ADD CONSTRAINT CHECK (classificacao in (('C', 'M'));



CREATE TABLE PALESTRANTES (
                cod_palestrante CHAR(11) NOT NULL,
                nome_palestrante VARCHAR(50) NOT NULL,
                email_palestrante VARCHAR(60) NOT NULL,
                desc_curriculum VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_palestrante)
);

ALTER TABLE PALESTRANTES COMMENT 'Tabela onde vai armazenar as informações sobre os Palestrantes';

ALTER TABLE PALESTRANTES MODIFY COLUMN cod_palestrante CHAR(11) COMMENT 'codigo dos palestrantes';

ALTER TABLE PALESTRANTES MODIFY COLUMN nome_palestrante VARCHAR(50) COMMENT 'nome do palestrante';

ALTER TABLE PALESTRANTES MODIFY COLUMN email_palestrante VARCHAR(60) COMMENT 'e-mail do palestrante';

ALTER TABLE PALESTRANTES MODIFY COLUMN desc_curriculum VARCHAR(100) COMMENT 'descricao do curriculum do palestrante';


CREATE TABLE endereco_palestrantes (
                cod_palestrante CHAR(11) NOT NULL,
                logradouro VARCHAR(200) NOT NULL,
                numero CHAR(10) NOT NULL,
                complemento_endereco VARCHAR(10),
                bairro_palestrantes VARCHAR(20) NOT NULL,
                uf_palestrante CHAR(2) NOT NULL,
                cep_palestrante CHAR(9) NOT NULL,
                numero_1 CHAR(10) NOT NULL,
                cidade_palestrantes VARCHAR(30) NOT NULL,
                PRIMARY KEY (cod_palestrante)
);

ALTER TABLE endereco_palestrantes MODIFY COLUMN cod_palestrante CHAR(11) COMMENT 'codigo dos palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN logradouro VARCHAR(200) COMMENT 'logradouro do endereço dos palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN numero CHAR(10) COMMENT 'numero do endereco dos palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN complemento_endereco VARCHAR(10) COMMENT 'complemento dos palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN bairro_palestrantes VARCHAR(20) COMMENT 'bairro dos palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN uf_palestrante CHAR(2) COMMENT 'uf do palestrante';

ALTER TABLE endereco_palestrantes MODIFY COLUMN cep_palestrante CHAR(9) COMMENT 'cep do palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN numero_1 CHAR(10) COMMENT 'numero do endereco dos palestrantes';

ALTER TABLE endereco_palestrantes MODIFY COLUMN cidade_palestrantes VARCHAR(30) COMMENT 'cidade dos palestrante';


CREATE TABLE tel_palestrante (
                cod_palestrante CHAR(11) NOT NULL,
                telefone_cel CHAR(11) NOT NULL,
                telefone_fixo CHAR(9) NOT NULL,
                PRIMARY KEY (cod_palestrante)
);

ALTER TABLE tel_palestrante MODIFY COLUMN cod_palestrante CHAR(11) COMMENT 'codigo dos palestrantes';

ALTER TABLE tel_palestrante MODIFY COLUMN telefone_cel CHAR(11) COMMENT 'telefone celular dos palestrantes';

ALTER TABLE tel_palestrante MODIFY COLUMN telefone_fixo CHAR(9) COMMENT 'telefone fixo dos palestrantes';


CREATE TABLE material_palestra (
                cod_palestra CHAR(11) NOT NULL,
                material_necessario CHAR(500) NOT NULL,
                PRIMARY KEY (cod_palestra)
);

ALTER TABLE material_palestra MODIFY COLUMN cod_palestra CHAR(11) COMMENT 'codigo da palestra';

ALTER TABLE material_palestra MODIFY COLUMN material_necessario CHAR(500) COMMENT 'materiais necessarios para a palestra';


CREATE TABLE data_evento (
                cod_progama CHAR(11) NOT NULL,
                data_prog DATE NOT NULL,
                data_horario TIME NOT NULL,
                desc_event VARCHAR(250) NOT NULL,
                PRIMARY KEY (cod_progama)
);

ALTER TABLE data_evento MODIFY COLUMN cod_progama CHAR(11) COMMENT 'Codigo do programa';

ALTER TABLE data_evento MODIFY COLUMN data_prog DATE COMMENT 'Data do evento';

ALTER TABLE data_evento MODIFY COLUMN data_horario TIME COMMENT 'Horario do evento';

ALTER TABLE data_evento MODIFY COLUMN desc_event VARCHAR(250) COMMENT 'Descricao do evento';


CREATE TABLE ORGANIZADORES (
                cod_org CHAR(11) NOT NULL,
                nome VARCHAR(60) NOT NULL,
                atribuicao VARCHAR(30) NOT NULL,
                PRIMARY KEY (cod_org)
);

ALTER TABLE ORGANIZADORES COMMENT 'Tabela onde vai armazenar as informações sobre os Organizadores do Crongresso';

ALTER TABLE ORGANIZADORES MODIFY COLUMN cod_org CHAR(11) COMMENT 'codigo dos organizadores';

ALTER TABLE ORGANIZADORES MODIFY COLUMN nome VARCHAR(60) COMMENT 'nome dos organizadores';

ALTER TABLE ORGANIZADORES MODIFY COLUMN atribuicao VARCHAR(30) COMMENT 'atribuicao dos organizadores';


CREATE TABLE tel_org (
                cod_org CHAR(11) NOT NULL,
                telefone_cel CHAR(11) NOT NULL,
                telefone_fixo CHAR(9) NOT NULL,
                PRIMARY KEY (cod_org)
);

ALTER TABLE tel_org COMMENT 'telefone dos organizadores';

ALTER TABLE tel_org MODIFY COLUMN cod_org CHAR(11) COMMENT 'codigo dos organizadores';

ALTER TABLE tel_org MODIFY COLUMN telefone_cel CHAR(11) COMMENT 'telefone celular dos organizadores';

ALTER TABLE tel_org MODIFY COLUMN telefone_fixo CHAR(9) COMMENT 'telefone fixo dos organizadores';


CREATE TABLE Patrocinio (
                cod_patrocinio CHAR(11) NOT NULL,
                valor DECIMAL(6,2) NOT NULL,
                forma_pagamento VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_patrocinio)
);

ALTER TABLE Patrocinio COMMENT 'Tabela onde vai armazenar as informações sobre o valor e a forma de pagamento do Patrocínio';

ALTER TABLE Patrocinio MODIFY COLUMN cod_patrocinio CHAR(11) COMMENT 'codigo dos patrocinadores que vao patrocinar';

ALTER TABLE Patrocinio MODIFY COLUMN valor DECIMAL(6, 2) COMMENT 'valor que cada patrocinador ira pagar';

ALTER TABLE Patrocinio MODIFY COLUMN forma_pagamento VARCHAR(20) COMMENT 'forma de pagamento de cada patrocinio';


CREATE TABLE CATEGORIAS (
                codigo_cat CHAR(11) NOT NULL,
                nome VARCHAR(30) NOT NULL,
                valor DECIMAL(6,2) NOT NULL,
                PRIMARY KEY (codigo_cat)
);

ALTER TABLE CATEGORIAS COMMENT 'Tabela onde vai guardar as informações sobre as categorias dos Congressos';

ALTER TABLE CATEGORIAS MODIFY COLUMN codigo_cat CHAR(11) COMMENT 'codigo das categorias';

ALTER TABLE CATEGORIAS MODIFY COLUMN nome VARCHAR(30) COMMENT 'nome das categorias';

ALTER TABLE CATEGORIAS MODIFY COLUMN valor DECIMAL(6, 2) COMMENT 'valor de cada categoria';


CREATE TABLE VISITANTES (
                codigo_vis CHAR(11) NOT NULL,
                nome_vis VARCHAR(60) NOT NULL,
                email VARCHAR(60) NOT NULL,
                PRIMARY KEY (codigo_vis)
);

ALTER TABLE VISITANTES COMMENT 'Tabela onde vai armazenar as informações sobre os visitantes';

ALTER TABLE VISITANTES MODIFY COLUMN codigo_vis CHAR(11) COMMENT 'codigo de reconhecimento dos visitantes';

ALTER TABLE VISITANTES MODIFY COLUMN nome_vis VARCHAR(60) COMMENT 'nome do visitante';

ALTER TABLE VISITANTES MODIFY COLUMN email VARCHAR(60) COMMENT 'email dos visitantes';


CREATE TABLE endereco_visitantes (
                codigo_vis CHAR(11) NOT NULL,
                logradouro VARCHAR(200) NOT NULL,
                numero CHAR(10) NOT NULL,
                complemento_endereco VARCHAR(10),
                bairro_visitantes VARCHAR(20) NOT NULL,
                uf_visitantes CHAR(2) NOT NULL,
                cep_visitantes CHAR(9) NOT NULL,
                numero_1 CHAR(10) NOT NULL,
                cidade_visitantes VARCHAR(30) NOT NULL,
                PRIMARY KEY (codigo_vis)
);

ALTER TABLE endereco_visitantes MODIFY COLUMN codigo_vis CHAR(11) COMMENT 'codigo dos palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN logradouro VARCHAR(200) COMMENT 'logradouro do endereço dos palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN numero CHAR(10) COMMENT 'numero do endereco dos palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN complemento_endereco VARCHAR(10) COMMENT 'complemento dos palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN bairro_visitantes VARCHAR(20) COMMENT 'bairro dos palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN uf_visitantes CHAR(2) COMMENT 'uf do palestrante';

ALTER TABLE endereco_visitantes MODIFY COLUMN cep_visitantes CHAR(9) COMMENT 'cep do palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN numero_1 CHAR(10) COMMENT 'numero do endereco dos palestrantes';

ALTER TABLE endereco_visitantes MODIFY COLUMN cidade_visitantes VARCHAR(30) COMMENT 'cidade dos palestrante';


CREATE TABLE tel_visitantes (
                codigo_vis CHAR(11) NOT NULL,
                telefone_cel CHAR(11) NOT NULL,
                telefone_fixo CHAR(9) NOT NULL,
                PRIMARY KEY (codigo_vis)
);

ALTER TABLE tel_visitantes COMMENT 'telefone de contato dos visitantes';

ALTER TABLE tel_visitantes MODIFY COLUMN codigo_vis CHAR(11) COMMENT 'codigo de reconhecimento dos visitantes';

ALTER TABLE tel_visitantes MODIFY COLUMN telefone_cel CHAR(11) COMMENT 'telefone celular dos visitantes';

ALTER TABLE tel_visitantes MODIFY COLUMN telefone_fixo CHAR(9) COMMENT 'telefone fixo dos visitantes';


CREATE TABLE LOCAIS (
                codigo_loc CHAR(11) NOT NULL,
                nome VARCHAR(100) NOT NULL,
                pessoa_contato CHAR NOT NULL,
                PRIMARY KEY (codigo_loc)
);

ALTER TABLE LOCAIS COMMENT 'Tabela onde vai armazenar os locais do Congresso';

ALTER TABLE LOCAIS MODIFY COLUMN codigo_loc CHAR(11) COMMENT 'codigo dos locais';

ALTER TABLE LOCAIS MODIFY COLUMN nome VARCHAR(100) COMMENT 'nemo dos locais';

ALTER TABLE LOCAIS MODIFY COLUMN pessoa_contato CHAR COMMENT 'contato da pessoa locais';


CREATE TABLE endereo_loc (
                codigo_loc CHAR(11) NOT NULL,
                logradouro VARCHAR(200) NOT NULL,
                numero CHAR(10) NOT NULL,
                complemento_endereco VARCHAR(10),
                bairro_locais VARCHAR(20) NOT NULL,
                cidade_locais VARCHAR(30) NOT NULL,
                uf_locais CHAR(2) NOT NULL,
                cep_locais CHAR(9) NOT NULL,
                PRIMARY KEY (codigo_loc)
);

ALTER TABLE endereo_loc COMMENT 'endereço dos locais';

ALTER TABLE endereo_loc MODIFY COLUMN logradouro VARCHAR(200) COMMENT 'logradouro do endereço dos locais';

ALTER TABLE endereo_loc MODIFY COLUMN numero CHAR(10) COMMENT 'numero do endereco dos locais';

ALTER TABLE endereo_loc MODIFY COLUMN complemento_endereco VARCHAR(10) COMMENT 'complemento dos locais';

ALTER TABLE endereo_loc MODIFY COLUMN bairro_locais VARCHAR(20) COMMENT 'bairro dos locais';

ALTER TABLE endereo_loc MODIFY COLUMN cidade_locais VARCHAR(30) COMMENT 'cidade do locais';

ALTER TABLE endereo_loc MODIFY COLUMN uf_locais CHAR(2) COMMENT 'uf do locais';

ALTER TABLE endereo_loc MODIFY COLUMN cep_locais CHAR(9) COMMENT 'cep do locais';


CREATE TABLE tel_contatos (
                codigo_loc CHAR(11) NOT NULL,
                telefone_cel CHAR(11) NOT NULL,
                telefone_fixo CHAR(9) NOT NULL,
                PRIMARY KEY (codigo_loc)
);

ALTER TABLE tel_contatos COMMENT 'telefones de contatos de locais';

ALTER TABLE tel_contatos MODIFY COLUMN telefone_cel CHAR(11) COMMENT 'telefone celular dos locais';

ALTER TABLE tel_contatos MODIFY COLUMN telefone_fixo CHAR(9) COMMENT 'telefone fixo dos locais';


ALTER TABLE tel_patro ADD CONSTRAINT patrocinadores_tel_patro_fk
FOREIGN KEY (cod_patrocinador)
REFERENCES PATROCINADORES (cod_patrocinador)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ender_patro ADD CONSTRAINT patrocinadores_ender_patro_fk
FOREIGN KEY (cod_patrocinador)
REFERENCES PATROCINADORES (cod_patrocinador)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Patrocnio ADD CONSTRAINT patrocinadores_patrocínio_fk
FOREIGN KEY (cod_patrocinio)
REFERENCES PATROCINADORES (cod_patrocinador)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE LOCAIS ADD CONSTRAINT congressos_locais_fk
FOREIGN KEY (codigo_loc)
REFERENCES CONGRESSOS (cod_cong)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CATEGORIAS ADD CONSTRAINT congressos_categorias_fk
FOREIGN KEY (codigo_cat)
REFERENCES CONGRESSOS (cod_cong)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Patrocnio ADD CONSTRAINT congressos_patrocínio_fk
FOREIGN KEY (cod_patrocinio)
REFERENCES CONGRESSOS (cod_cong)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE VISITANTES ADD CONSTRAINT congressos_visitantes_fk
FOREIGN KEY (codigo_vis)
REFERENCES CONGRESSOS (cod_cong)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ORGANIZADORES ADD CONSTRAINT congressos_organizadores_fk
FOREIGN KEY (cod_org)
REFERENCES CONGRESSOS (cod_cong)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE PROGRAMAS ADD CONSTRAINT congressos_programas_fk
FOREIGN KEY (cod_progama)
REFERENCES CONGRESSOS (cod_cong)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE data_evento ADD CONSTRAINT programas_data_evento_fk
FOREIGN KEY (cod_progama)
REFERENCES PROGRAMAS (cod_progama)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE PALESTRAS ADD CONSTRAINT programas_palestras_fk
FOREIGN KEY (cod_palestra)
REFERENCES PROGRAMAS (cod_progama)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE material_palestra ADD CONSTRAINT palestras_material_palestra_fk
FOREIGN KEY (cod_palestra)
REFERENCES PALESTRAS (cod_palestra)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE PALESTRANTES ADD CONSTRAINT palestras_palestrantes_fk
FOREIGN KEY (cod_palestrante)
REFERENCES PALESTRAS (cod_palestra)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tel_palestrante ADD CONSTRAINT palestrantes_tel_palestrante_fk
FOREIGN KEY (cod_palestrante)
REFERENCES PALESTRANTES (cod_palestrante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE endereco_palestrantes ADD CONSTRAINT palestrantes_endereco_palestrantes_fk
FOREIGN KEY (cod_palestrante)
REFERENCES PALESTRANTES (cod_palestrante)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tel_org ADD CONSTRAINT organizadores_tel_org_fk
FOREIGN KEY (cod_org)
REFERENCES ORGANIZADORES (cod_org)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tel_visitantes ADD CONSTRAINT visitantes_tel_visitantes_fk
FOREIGN KEY (codigo_vis)
REFERENCES VISITANTES (codigo_vis)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE endereco_visitantes ADD CONSTRAINT visitantes_codigo_vis_fk
FOREIGN KEY (codigo_vis)
REFERENCES VISITANTES (codigo_vis)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tel_contatos ADD CONSTRAINT locais_tel_contatos_fk
FOREIGN KEY (codigo_loc)
REFERENCES LOCAIS (codigo_loc)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE endereo_loc ADD CONSTRAINT locais_endereço_loc_fk
FOREIGN KEY (codigo_loc)
REFERENCES LOCAIS (codigo_loc)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
