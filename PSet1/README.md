
# Design e Desenvolvimento de Bancos de Dados

---
## Pset 1
 
**Aluno:** Pedro Lucas da Rocha Barros

**Professor:** Abrantes Araújo Silva Filho

**Monitoria:** Suellen Miranda Amorim

**Turma:** CC1M

# 1. Introdução
---
Este trabalho tem como foco trabalhar nosso aprendizado sobre a implementação de um banco de dados, esta implementaçã é um modelo empresarial aprensentado no livro Sistemas de Banco de Dados, 7ª edição, seus autores são Elmasri e Navathe.

Algumas etapas feitas em ordem foi necessaria para a implementação do banco de dados e para o aprenzidado:

>* Projeto Lógico
>* Implementação no PostegreSQL
>* Implementação no MariaBD/MySQL
    Aprendizado sobre a linguagem Markdown

Ferramentas usadas para a implementação do Banco de dados:

>* SQL Power Architect
>* Dbeaver
>
Principal ferramenta usada:
>* Oracle VM Virtual Box, ([a implementação da Maquina Virtual foi feita por Abrantes, otima ferramenta para quem se 
interessar a estudar SGBD's](https://www.computacaoraiz.com.br/2022/03/17/maquina-virtual-para-o-estudo-de-sistemas-de-gerenciamento-de-bancos-de-dados-db-server))

---

# 2.Projeto Lógico
![architect_logo_200](https://user-images.githubusercontent.com/103005263/164912854-5e659333-8c6f-4123-bdb7-a2d51d738514.png)

Para aplicarmos o projeto Lógico, foi auxiliado pela ferramenta SQL Power Architect, criando um diagrama de facil entendimento visual.

![imagem do diagrama](https://user-images.githubusercontent.com/103005263/164913374-03a43dcd-71fe-458f-bc89-60f370e86bfc.png)

Após a criação das tabelas, o programa suporta a criação por um software capaz de transformar todo esse projeto em Scripts, para esse trabalho foi necessário transformar os scripts para se adequar ao PostegreSQL e MariaBD/MySQL.

## Script compatível com PostegreSQL 

![script_postegresql](https://user-images.githubusercontent.com/103005263/164913946-6fdf5507-e6bd-46d6-8db9-1de92f16522e.gif)

## Script compatível com MariaBD/MySQL

![script_mariabd](https://user-images.githubusercontent.com/103005263/164914272-efe052d8-3893-44ca-9ec3-f3036adca789.gif)

---

# 3. Intruções

## ⚠️**SEGUIR A RISCA AS INSTRUÇÕES PARA UM BOM FUNCIONAMENTO DO CÓDIGO**

## 3.1 Implementação no PostgreSQL

![postgresql_45x46](https://user-images.githubusercontent.com/103005263/164914562-35af90a6-aac4-4cc4-bba9-bcba1fd4eede.png)

Abra o terminal e cole cada bloco de comando separadamente(indicado no [script](https://github.com/PedroRoch/uvv_bd_1_cc1m/blob/main/PSet1/PostgreSQLScript.sql) ou no passo a passo na sessão 3.1.1)

![terminal postgres](https://user-images.githubusercontent.com/103005263/164915807-2b51b0d6-5c92-4c9f-b6e0-80d2d8f32f61.png)

## 3.1.1 passo a passo do PostgreSQL

⚠️ **É DE EXTREMAMENTE NECESSESIDADE SEGUIR O PASSO A PASSO.**

Caso siga passo a passo mostrado, o código deverá funcinar normalmente.

primeiro crie a Role e dê permissões a ela, após isso crie a database e conecte o usuário.
>* senha do usuário é 12345

![2022-04-24 19-49-55](https://user-images.githubusercontent.com/103005263/165000115-8b0e9cf9-2a07-44ea-a254-4ca324344b0a.gif)

Após a primeira etapa coloque para criar o schema e selecionar o usuário e o esquema que você irá utilizar 

![2022-04-24 19-55-17](https://user-images.githubusercontent.com/103005263/165000182-2fe30341-0a83-44d7-beae-f8cf9ec54eb5.gif)

Agora crie as databases 

![2022-04-24 19-58-04](https://user-images.githubusercontent.com/103005263/165000243-f89cc64d-4996-478f-8c03-dd02a722c516.gif)

Nesta etapa de agora é **muito importante prestar atenção**

Você inserir os dados da tabela um por vez como demonstrado na imagem abaixo

![2022-04-24 20-06-15](https://user-images.githubusercontent.com/103005263/165000478-bf8aa2bb-7d57-42f7-ae40-3caf808630e5.gif)

colocando todos os inserts de maneira adequada está finalizado a implementação do PostgreSQL.

---

## 3.2 Implementação no MariaBD/MySQL
![mysql-logo-DOLPHIN](https://user-images.githubusercontent.com/103005263/164915964-3faf96aa-ced2-4d8f-b7e7-d9ec11383f3d.png)

Abra o terminal e cole o script como indicado(indicado no [script](https://github.com/PedroRoch/uvv_bd_1_cc1m/blob/main/PSet1/MySQLScript.sql))
![terminal mysql](https://user-images.githubusercontent.com/103005263/164915850-d1365b86-e081-4595-a715-3afeddde3c3c.png)

## 3.2.1 Passo a passo do MaridBD/MySQL

⚠️ **É DE EXTREMAMENTE NECESSESIDADE SEGUIR O PASSO A PASSO.**

Crie o usuário e dê permissões a ele, após isso se desconecte e se conecte com o usuário.
>* senha do usuário é 12345

![2022-04-24 20-11-51](https://user-images.githubusercontent.com/103005263/165000631-4a3b8eed-26b2-437a-ac79-290c284c3324.gif)

Crie a database, selecione ela, crie as tabelas e inserts

![2022-04-24 20-15-10(1)](https://user-images.githubusercontent.com/103005263/165000774-43bd4b6d-59c3-4cfa-ad3f-0b4da3db76dd.gif)

Com isso a impletementação no MySQL está pronta.

# 4.Conclusão

Este trabalho foi bastante trabalhoso mas serviu de aprendizado a como funciona mesmo de maneira mais leve uma implementação de um SGBD Empresarial. 

Aprender sobre a Linguagem Markdown foi bastante satisfatório e divertido.

Espero continuar aprendendo, até a proxima!!
