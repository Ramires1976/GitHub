# criando funcoes em SQL

# criar uma funcao que passamos o ID do cadastro como parametro e ele retorna o nome do cadastro

delimiter $

create function retorna_nome (id_cad_input int)
# retorno da funcao

returns varchar (50) deterministic

#acao da funcao

begin
declare nome varchar(50);
select nome_cadastro into nome
from cadastro
where id_cad = id_cad_input;
return nome;
end$$
delimiter $

# chamando a funcao na consulta

select retorna_nome(7)

# fazendo um join usando funcoes

select nome_produtos,retorna_nome(id_cad), quantidade from produtos
order by nome_produtos

# procedures
# procedures sao scripts programados que fazem modificacoes no banco de dados
#cargas de tabelas dados bancos, copias exclusoes insercoes
# e fica compilado dentro do banco de dados e execucao em segundo plano (nao vemos a execucao)

delimiter $
create procedure st_select()
begin
select*from produtos;
end$$
delimiter $

# para chamar uma procedure utilizamos o comando call

call st_select()

# criar a procedure que vai coppiar uma tabela para outra
# copiar os dados da produtos2 esta vazia

select*from produtos2

# limpando os registros da tabela

truncate produtos2

DELIMITER $
CREATE PROCEDURE st_input_tabela_produtos2()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE INSERE_ID_PROD int default 0;
DECLARE INSERE_NOME varchar(30) default 0;
DECLARE INSERE_Valor float(10,2) default 0;
DECLARE INSERE_Quantidade int default 0;
DECLARE INSERE_ID_CAD int;
DECLARE cursor1 CURSOR FOR SELECT id_prod,Nome_produtos,Valor,Quantidade,id_cad from produtos;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN cursor1;
read_loop: LOOP
IF done THEN # condicao de teste do true e  falso
LEAVE read_loop;
END IF;
FETCH cursor1 INTO INSERE_ID_PROD,INSERE_NOME,INSERE_VALOR,INSERE_QUANTIDADE,INSERE_ID_CAD;
insert into produtos2 Values(INSERE_ID_PROD,INSERE_NOME,INSERE_VALOR,INSERE_QUANTIDADE,INSERE_ID_CAD);
end loop; # se falso executa o loop pela ultima vez
CLOSE cursor1;
END$$

delimiter $

call st_input_tabela_produtos2()

# testar se a procedure efetuou a carga de copia

select * from produtos2

truncate produtos2

# configurando o agendador de tarefas para rodar a procedure

# ativar o agendador de tarefas

set global event_scheduler = on

# como saber que ativou 

show processlist

# criando a tarefa agendada

delimiter $$

create event chama_procedure on schedule every 1 minute
on completion not preserve disable
do
call st_input_tabela_produtos2()

# para validar se criou o evento

show events

alter event chama_procedure enable

# testar se agendador esta funcionando
truncate produtos2
select * from produtos2

# apagar uma tarefa agendada

drop event chama_procedure

show events

# triggers

# a triggers trabalham em cima de acoes em tabelas after insert after delete after update (DML)

# sao ulilizadas para regras de negocio possuem maior performance que as procedures

# iremos criar uma nova tabela que ira receber a trigger e uma nova acao de venda
# onde ira diiminuir da quantidade da tabela produtos

create table itensvenda
( id_venda int not null auto_increment,
id_produto int (10),
qt_vendida int,
primary key (id_venda)
);

# criar a trigger after insert e after delete
# quando der um insert na tabela itens apontar o id do produto ira diminuir a quantidade do produto

# quando der um delete na tabela itens venda ira somar novamente o valor

# criando a trigger com after insert e after delete
delimiter $

create trigger itensvenda_insert after insert
on itensvenda
for each row
begin
update produtos set quantidade = quantidade - new.qt_vendida
where id_prod = new.id_produto;
end$
create trigger itensvenda_delete after delete
on itensvenda
for each row
begin
update produtos set quantidade = quantidade + old.qt_vendida
where id_prod = old.id_produto;
end$
delimiter $

# exibir as triggers

show triggers

# testar o funcionamente da triggers na tabela itensvenda fazer insert e delete

insert into itensvenda (id_produto,qt_vendida) values (1,10)

select * from itensvenda

delete from itensvenda where id_venda = 1

# excluindo uam trigger

drop trigger itensvenda_insert

# triggers com campos condicionais

# implementar um novo camnpo para trabalhar as condicoes da trigger

alter table itensvenda add column status_vendas varchar(50)

# criando a trigger condicional

delimiter $

create trigger itensvenda_insert after insert
on itensvenda
for each row
begin 
if new.status_vendas = 'vendeu' then
update produtos set quantidade = quantidade - new.qt_vendida
where id_prod = new.id_produto;
end if;
if new.status_vendas = 'devolveu' then
update produtos set quantidade = quantidade + new.qt_vendida
where id_prod = new.id_produto;
end if;

end  $

delimiter $

# testar utilizando inserts

insert into itensvenda (id_produto,qt_vendida,status_vendas) values (2,5,'vendeu')
insert into itensvenda (id_produto,qt_vendida,status_vendas) values (2,5,'devolveu')

select * from itensvenda

# trabalhando com as views

# as views sao constituidas de selects utilizando filtros de campos de 1 ou mais tabelas
# a views ficara armazenada no banco onde esse conjunto podera ser utilizada sempre que precisar
# as views sao chamadas de tabelas virtuais e as tabelas fisicas sao chamadas debased tables

# criando uma view com os campos das tabelas cadastro e produtos

create or replace view vw_cadastro_produtos as
select nome_cadastro, sobrenome,nome_produtos,quantidade,valor
from cadastro
join produtos on
cadastro.id_cad = produtos.id_cad
order by nome_cadastro

# testar a view

select * from vw_cadastro_produtos

select * nome_cadastro,quantidade from vw_cadastro_produtos
where quantidade = 5
# utilizando views para exercutar comandos DML (registros na tabela)

create or replace view vw_produtos as
select nome_produtos,valor,quantidade,id_cad from produtos

# insert atraves da view

insert into vw_produtos values ('jabuticaba',9,20,20,12)

select * from produtos

# fazer update e delete atraves da view nao é recomendado
# se precisar fazer faça na tabela fisica onde o registro se encontra

















  