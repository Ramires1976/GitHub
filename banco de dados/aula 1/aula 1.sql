## principais estrutura de comando

## DDL - manipilacao estrutural do SQL

## create- criar objetos
## alter - altera estrutura existente
## drop - apagar estrutura existente

## DML manipulacao de registro de uma tabela

# insert - insere registro
# update - altera registro
# delete - apaga registro

#  DQL - consulta registro

# select - traz informacoes de registro

# o primeiro objeto do modelo fisico a ser criado é o banco de dados 

create database basedados;

create table cadastro(
id_cad integer not null auto_increment,
nome varchar(100) not null,
sobrenome varchar(100) not null,
CPF varchar(11) not null,
primary key(id_cad)
);

# checando a tabela

select * from cadastro;

Select nome, sobrenome from cadastro

insert into cadastro( nome, sobrenome, CPF) values ('joao', "cavichiolli", "5555")
insert into cadastro( nome, sobrenome, CPF) values ('ramires', "schlemper", "01739305906")

update cadastro set nome="pedrinho" where id_cad = 2

delete from cadastro where id_cad = 2

# apagando mais de registro
# delete from cadastro where id_cad between 1 and 5

# drop table cadastro - apaga a tabela cadastro

# trabalhando com select e suas clausulas 
# principais clausulas do select
# where - filtra condicoes
# order by - ordenar por um campo
# group by - agrupa por um campo

select nome, sobrenome from cadastro 
order by nome; # ordem alfabetica
# order by nome desc # ordem descrecente

select nome, sobrenome from cadastro
where nome = "joao";

select nome, sobrenome from cadastro
where nome != "joao";

# operadores relacionais

# = igual
# != ou <> diferente
# > maior
# < menor
# >= maior ou igual
# <= menor ou igual

select id_cad, nome, sobrenome from cadastro
where id_cad > 3;

select nome, sobrenome from cadastro
where nome like "jo%";

select nome, sobrenome from cadastro
where nome like "%ria";

# or - ou
# and - E
# not - nao - oposto da condicao

select nome, sobrenome from cadastro
where nome= "roberto" and sobrenome = "ferreira";


select nome, sobrenome from cadastro
where nome= "roberto" or sobrenome = "silva";

select nome, sobrenome from cadastro
where not nome= "roberto";

# distinct

select distinct sobrenome from cadastro






 
 


