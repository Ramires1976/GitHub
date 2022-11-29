### Criando Funções em SQL ###

## Criar uma função que passamos o id do cadastro como parametro e ele
#retorna o nome do cadastro

delimiter $
create function retorna_nome(id_cad_input int)
# retorno da função
returns varchar(50) deterministic
## ação da função
begin
declare nome varchar(50);
select Nome_Cadastro into nome
from cadastro
where id_cad = id_cad_input;
return nome;
end$$
delimiter $

## Chamando a função na consulta 

select retorna_nome(7)

## Fazendo um join usando funções

select Nome_Produtos,retorna_nome(id_cad),Quantidade from produtos
order by Nome_Produtos

##################### PROCEDURES #####

## Procedures sao scripts programados que fazem modificações no banco de dados
# Cargas de tabelas dados bancos, copias exclusões inserções. 
# E fica compilado dentro do banco de dados e execução em segundo plano (não vemos a execução)

## Criar uma procedure que faz um select

delimiter $
create procedure st_select()
begin

select * from produtos;
end$$
delimiter $

### Para chamar uma procedure utilizamos o comando call

call st_select()

### Criar a procedure que vai copiar uma tabela para outra 
# Copiar os dados da produtos para produtos2

# Validar se a tabela produtos2 esta vazia

select * from produtos2

## Limpando os registro da tabela

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
DECLARE cursor1 CURSOR FOR SELECT id_prod,Nome_Produtos,Valor,Quantidade,id_cad from produtos;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor1;
 read_loop: LOOP
 IF done THEN # condicao de teste do true e false 
      LEAVE read_loop;
       END IF;
FETCH cursor1 INTO INSERE_ID_PROD,INSERE_NOME,INSERE_VALOR,INSERE_QUANTIDADE,INSERE_ID_CAD;
insert into produtos2 Values(INSERE_ID_PROD,INSERE_NOME,INSERE_VALOR,INSERE_QUANTIDADE,INSERE_ID_CAD);   
end loop; # Se falso executa o loop pela ultima vez
  CLOSE cursor1;
END$$
delimiter $

## Rodando a procedure

call st_input_tabela_produtos2()

# Testar se a procedure efetuou a carga de copia

select * from produtos2

truncate produtos2

### Configurando o agendador de tarefas para rodar a procedure

# ativar o agendador de tarefas

set global event_scheduler = on;

# Como saber que ativou

show processlist

# Criando a tarefa agendada


delimiter $$
create event chama_procedure on schedule every 1 minute
on completion not preserve disable
do
call st_input_tabela_produtos2()

## Para validar se criou o evento

show events

## ATivar a tarefa agendada

alter event chama_procedure enable;

# Testar se o agendador esta funcionando
truncate produtos2
select * from produtos2

## Apagar uma tarefa agendada

drop event chama_procedure

show events


################################## TRIGGERS ######################

# As triggers trabalham em cima de ações em tabelas AFTER Insert After Delete
# After update (DML)
# São utlizadas para regras de negócio possuem maior performance que as procedures

# Iremos criar uma nova tabela que irá receber a trigger e uma ação de venda 
# Onde irá diminuir da quantidade da tabela produtos

create table ItensVenda
( id_venda int not null auto_increment,
  id_produto int(10),
  Qt_Vendida int,
  primary key(id_venda)
  );

# Criar a trigger after insert e after delete
# Quando der um insert na tabela itens apontar o id do produto ira diminuir a quantidade
# do produto
# Quando der um delete na tabela itens venda ira somar novamente o valor.


# Criando a trigger com After insert e after delete
delimiter $

create trigger ItensVenda_Insert after insert
on itensvenda
for each row
begin
update produtos set Quantidade = quantidade - new.Qt_Vendida
where id_prod = new.id_produto;
end$
create trigger ItensVenda_Delete after delete
on itensvenda
for each row
begin
update produtos set Quantidade = Quantidade + old.Qt_Vendida
where id_prod = old.id_produto;
end$
delimiter $

#Exibir as triggers
show triggers

# Testar o funcionamento da trigger na tabela itensvenda fazer insert e delete

insert into itensvenda (id_produto,Qt_vendida) values(7,10)

select * from itensvenda

delete from itensvenda where id_venda=1

# Excluindo uma trigger

drop trigger ItensVenda_Insert


############# Triggers com Campos Condicionais ##########

# Implementar um novo campo para trabalhar as condições da trigger

alter table itensvenda add column status_vendas varchar(50)

## Criando a trigger condicional

delimiter $

create trigger ItensVenda_Insert after insert
on itensvenda
for each row
begin
if new.status_vendas = 'vendeu' then
update produtos set Quantidade = Quantidade - new.Qt_Vendida
where id_prod = new.id_produto;
end if;
if new.status_vendas = 'devolveu' then
update produtos set quantidade = quantidade + new.Qt_vendida
where id_prod = new.id_produto;
end if;
end$
delimiter $

## Testar utilizando inserts

insert into itensvenda (id_produto,QT_Vendida,status_vendas) values (6,15,'vendeu')

insert into itensvenda (id_produto,QT_Vendida,status_vendas) values (6,15,'devolveu')


select * from itensvenda

###################### Trabalhando com os VIEWS ############

# As views sao constituidas de selects utilizando filtros de campos de 1 ou mais tabelas
# A view ficará armazenada no banco onde esse conjunto podera ser utilizado sempre
# que precisar. As views são chamadas de tabelas virtuais
# E as tabelas fisicas sao chamadas de based tables

# Criando uma view com os campos das tabelas cadastro e produtos

create or replace view vw_cadastro_produtos as
select Nome_Cadastro,Sobrenome,Nome_Produtos,Quantidade,Valor
from cadastro
join produtos on
cadastro.id_cad = produtos.id_cad
order by Nome_Cadastro

# Testar a View

select * from vw_cadastro_produtos

select Nome_Cadastro,Quantidade from vw_cadastro_produtos
where Quantidade = 5

# utilizando views para executar comandos DML (registros na tabela)

create or replace view vw_produtos as
select Nome_Produtos,Valor,Quantidade,id_cad from produtos

# Insert atraves da view

insert into vw_produtos values('Jabuticaba',9.20,20,12)

select * from produtos

### Fazer update e delete atraves da view não e muito recomendado
# Se precisar fazer faça na tabela fisica onde o registro se encontra





