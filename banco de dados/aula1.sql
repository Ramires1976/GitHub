## Comentario no SQL e o # comentarios não ão lidos ou executados pelo interpretador
## SQL 
## Principais estruturas de comando SQL 

# DDL - Manipulação estrutural do SQL (tabelas,procedures,views,funcoes)
# CREATE - Criar objetos
# ALTER  - Altera estrutura existente
# DROP - Apagar estruturas existentes

## DML - Manipulação de Registro de uma tabela

# Insert - Insere registro na tabela
# Update - Altera registro de uma tabela 
# Delete - Apaga registros de uma tabela

#DQL - Consultas de Registro em uma ou mais tabelas
#SELECT - Traz informações de registros de uma ou mais tabelas

## O primeiro objeto do modelo fisico a ser criado é o banco de dados

# Vamos criar um banco de dados utilizando o comando DDL Create

create database basedados;

## O Segundo passo do modelo fisico é a criação de tabelas
# Criação de tabela também é estrutural utilizando comando de DDL 

## Criação da tabela 

create table cadastro(
id_cad integer not null auto_increment,
Nome varchar(100) not null,
Sobrenome varchar(100) not null,
CPF  varchar(11) not null,
primary key(id_cad)
);

## Checando a tabela cadastro afim de conferir as informações usando o comando tipo
# DQL select

# * no select tras a informação de todos os campos da tabela
select * from cadastro

# Neste select trazemos apenas o campo nome e sobrenome

select Nome,Sobrenome from cadastro

### Utilizamos  comando DML insert para inserir registros na tabela

insert into cadastro (Nome,Sobrenome,CPF) values ('João','Cavichiolli','5555');

insert into cadastro (Nome,Sobrenome,CPF) values ('Pedro','Cunha','444');

### Para os comandos DML Update e delete teremos que usar a clausula WHERE(onde)
## Senão utilizarmos as clausulas where ele irá afetar ação em todos os registros da tabela

# Clausulas de Update ou Delete utilizamos o where filtrando campos unicos

update cadastro set Nome='Pedrinho' where id_cad = 2

# Apagando mais de um registro ao mesmo tempo

delete from cadastro where id_cad  between 1 and 5

## Comando DDL DROP e ALTER

# drop table cadastro - Apaga a tabela cadastro

## Alter o comando DDL que iremos alterar um objeto existente (tabelas)

## Adicionar o campo CEP na tabela cadastro

alter table cadastro add CEP integer(9) after cpf

# Select para exibir o novo campo

select * from cadastro

 ### Trabalhando com select e suas clausulas.
 
 ### Prinicipais clausulas do select
 
 # Where filtra condições
 # Order by - ordenar por um campo
 # Group by - agrupa por um campo
 
 ## Select simples de 1 tabela
 
 select Nome,Sobrenome from cadastro
 order by Nome; # ordenar por ordem alfabetica os nomes
 
select Nome,Sobrenome from cadastro
 order by Nome desc # ordenar pro ordem descrescente.
 
# Trabalhando com where

# Trazendo registros com nome João

select Nome,Sobrenome from cadastro
where Nome = 'João';

# Trazendo nomes que são diferentes de João

select Nome,Sobrenome from cadastro
where nome !="João";

## Operadores Relacionais (Comparação)

# = igual 
# = != ou <> diferente
# > maior
# < menor
# >= maior ou igual
# <= menor ou igual 


## Trabalhando com operadores em select

select id_cad,Nome,Sobrenome from cadastro
where id_cad > 6

## Utilizando operador coringa like

select Nome,Sobrenome from cadastro
where Nome like 'Jo%'

select Nome,Sobrenome from cadastro
where Nome like '%ria'

### Operadores Lógicos ##

# OR - OU - quando uma ou outra condição for verdadeira
# AND - E - Quando todas as condições forem verdadeiras
# NOT - Não - Inverte a condição ou é o oposto da condição

# AND
select Nome,Sobrenome from cadastro
where Nome = 'Roberto' and Sobrenome = "Ferreira"

#OR

select Nome,Sobrenome from cadastro
where Nome = 'Roberto' or Sobrenome = "Silva"

select Nome,Sobrenome from cadastro
where not nome = "Roberto"

# Distinct - Tras valores de registro que não são duplicados

select * from cadastro

select distinct Sobrenome from cadastro

select  Sobrenome from cadastro





