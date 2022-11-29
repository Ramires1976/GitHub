create table produtos(
id_prod integer not null auto_increment,
Nome varchar(100) not null,
Valor float(10) not null,
Quantidade integer(10) not null,
id_cad integer(10) not null,
primary key (id_prod)
);

select * from produtos

alter table produtos add constraint fk_cadastro_produtos
foreign key(id_cad)
references cadastro(id_cad)
on delete no action
on update no action;

select * from produtos

# subconsultas e quando temos um select dentro de outro select
# in = dentro
# not in = fora 

select nome, sobrenome from cadastro
where id_cad in (select id_cad from produtos where(id_cad));

select id_cad, nome, sobrenome from cadastro
where id_cad not in (select id_cad from produtos where(id_cad));

select nome,(select nome from cadastro where id_cad = produtos.id_cad) as compradores # alias ou apelido para a tabela e a saida do produto 
from produtos

# trabalahndo com select de campo de mais de 1 tabela 
# select com join

select nome,sobrenome,quantidade,valor
from produtos,cadastro
where cadastro.id_cad = produtos.id_cad
order by quantidade

alterar o nome da modelagem das tabelas

alter table cadastro change nome nome_cadastro varchar (100);
alter table produtos change nome nome_produtos varchar (100);

select nome_cadastro,sobrenome,quantidade,valor
from produtos,cadastro
where cadastro.id_cad = produtos.id_cad
order by quantidade

select * from produtos
join cadastro on
produtos.id_cad = cadastro.id_cad

select nome_cadastro, nome, produtos, valor, CPF
from produtos
join cadastro on
produtos.id_cad = cadastro.id_cad
order by nome_cadastro;

# letf join os valores da esquerda para a direita
# right join os valores da direita para esquerda

select*from cadastro
left join produtos on
produtos.id_cad = cadastro.id_cad

select*from cadastro
right join produtos on
produtos.id_cad = cadastro.id_cad

# criando e alterando registro e  tabelas utilizando select

# criar uma tabela utilizando sub select

create table produtos2(
select*from produtos where quantidade>=10)

select*from produtos2

insert into produtos2(
select id_cad, nome_produtos,valor,quantidade,id_cad from produtos)

#  ## Trabalhando com Funções de Agregação ########

# São responsaveis por agrupar varios registro e retornar um unico valor para uma determinada ação.

select Nome_Cadastro,Nome_Produtos,Quantidade 
from produtos,cadastro
where cadastro.id_cad = produtos.id_cad
order by Quantidade

### Group by para agrupar dados repetidos 

insert into produtos (Nome_Produtos,Valor,Quantidade,id_cad) values ('Laranja',3.50,15,11)

select Nome_Produtos,Nome_cadastro,Quantidade
from cadastro,produtos
where cadastro.id_cad = produtos.id_cad
group by Nome_produtos
order by nome_produtos

### Função Count conta os registros de uma tabela baseado na clausula (no que deseja)

# contando os registro de uma tabela

select count(*) from produtos

select Nome_Produtos,Nome_Cadastro,count(Nome_produtos) as Qt_Produtos
from produtos,cadastro
where cadastro.id_cad = produtos.id_cad
group by nome_produtos
order by nome_produtos


## Having Count conta utilizando operadores relacionais ( = > < <>)

select Nome_Produtos,Nome_Cadastro,count(Nome_produtos) as Qt_Produtos
from produtos,cadastro
where cadastro.id_cad = produtos.id_cad
group by nome_produtos
having count(nome_produtos) >= 1
order by nome_produtos


## MAX e MIN
# retorna o maximo e o minimo valor de um registro da tabela

select min(Quantidade) as QT_PROD_MIN,max(quantidade) as QT_PROD_MAX from produtos

## Soma total dos registro de uma coluna

select sum(Quantidade) as QT_TOTAL,format(sum(Valor),2) as VL_TOTAL from produtos

## Calculo de media average

select format(avg(valor),3) as Média from produtos

## Format formata a saida das casas decimais dos campo.


########### Funções de Texto ###

# substring obtem parte do texto passado na consulta

# lenght captura pelo tamanho de caracteres


# Substring

select Quantidade,Nome_produtos from produtos
where substr(nome_produtos,1,1) = 'l'
and length(Nome_produtos) > 6;

# recomendação usem o like mais facil mais pratico 

### concat e o Concatws

# Concat concatena valores

select concat(Nome_cadastro,' Gosta DE:  ',nome_produtos) as Gosto_Frutas from 
cadastro,produtos
where cadastro.id_cad = produtos.id_cad
order by Nome_Cadastro


select concat_ws(';',Nome_Produtos,Quantidade,Valor) from produtos
where Nome_produtos like 'L%';

## trazer na consulta os dados em maisculo e minusculo

# lcase = lower case minusculo
# ucase = upper case maisculo

select lcase(Nome_Cadastro) as Minusculo,ucase(Nome_cadastro) as Maiusculo from cadastro


				####### Funções de Calculos aritmeticos #########
                
## format e o round fazendo arredondamento de casas decimais 
# calculo com valores no parametro da funcao sem a necessidade de ser algo fisico da tabela

select round(133.44334,3) from dual # dual e uma tabela fictica para voce fazer um calculo sem valor de tabela

## Calcular Raiz Quadrada

select sqrt(67.78) as Raiz_Quadrada

# pi

select pi()


################ Função Matematicas ###############
## adicao, substracao, multiplicacao, divisão


# Adição

select (Quantidade+valor) as Adição from produtos
where id_prod = 3

# Multiplicacao

select (Quantidade*valor) as Multiplicacao from produtos

# Subtracao

select (Quantidade-valor) as Subtracao from produtos


# Divisao

select (Quantidade/valor) as Divisao from produtos


###########  Funções de Data #############

# Trazer a data atual (corrente)

select curdate();

## Trazer data e hora atual 

select now()
select sysdate()
 
# Trazer a hora atual

select curtime()

## Intervalo de datas

select datediff('2018-09-09' , '2022-02-02')

## Adicionar dias a uma data

select date_add('2019-01-31', interval 60 day)

## Saida do ultimo dia do mes de uma data

select last_day('2016-02-01')

### Mudar o padrao de data

select date_format('2021-11-04',get_format(date,'EUR'));


######################################### Funções Logicas IF e CASE em SQL ####################

## IF e a função SE que pode retornar  o tipo de dados Booleano TRUE e FALSE
## CASE caso for 1 faça tal caso for 2 faça tal caso for 3 faça tal, falso

## IF 

#Quantidade de Frutas que tem e trazer com um resultado baixo ou alto

select Nome_produtos,Quantidade,
if(quantidade<=20,"Baixo","Alto") as Estoque from produtos


# if(condicao_de_teste," Mensagem se for TRUE","Mensagem se for FALSE")

select Valor,
if(valor<>10.00,"Diferente","Igual") as Classificação 
from produtos;


### CASE e quando temos mais de 1 condição verdadeira na analise ###

## Supor uma analise de estoque ##

select Quantidade,
case

when Quantidade <= 4 then "Baixo Estoque"
when Quantidade <= 15 then "Estoque Bom"
when Quantidade <= 30 then "Estoque Médio"
else 'Estoque Alto'
end as Quantidade,
count(*) Quantidade
from produtos
group by Quantidade
order by Quantidade;

### Analisar cliente com quantidades acima de 10

select Nome_cadastro,Nome_produtos,Quantidade,
if(quantidade>=10,"Alto","Baixo") as Compras_Clientes
from produtos join cadastro on
cadastro.id_cad = produtos.id_cad
order by compras_clientes

### Fazer uma analise de Quantidade de clientes com vendas boas e Ruins ###

select 

case

when Quantidade <=10 then "Clientes com Poucas Vendas"
else 'Clientes com Vendas Boas'
end as compras_clientes,
count(*)Nome_Cadastro
from produtos 
join cadastro on produtos.id_cad = cadastro.id_cad
group by compras_clientes
order by compras_clientes




















