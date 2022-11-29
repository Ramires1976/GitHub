# trabalhando com indices
# indices sao recursos aplicados em cima de campos de uma tabela do banco de dados afim de gerar performace em consulta e transacoes

# criando uma tabela com indice

create table cliente (
id_cliente integer not null auto_increment,
cod_cliente varchar(10),
Nome varchar(50),
Sobrenome varchar(50),
CPF varchar(11),
D_cadastro date,
primary key (id_cliente),
index ind_cod_cliente (cod_cliente)
);

# criar um indice alterando umaz tabela existente

alter table cliente add index ind_nome_cliente(nome);

alter table cadastro add index ind_nome_cadastro(nome_cadastro);

# adicionar um indice do tipo unico

alter table produtos add unique ind_nome_produto(nome_produtos);

# exibir os indices

show indexes from cliente

# excluir um indice

alter table cliente drop index id_nome_cliente;

# trabalhando com exportar e importar dados do Banco de dados
# vamos exportar dados em uma tabela para txt/csv

select * from produtos into outfile 'c:/temp/lista_clientes.txt'
fields terminated by ',' enclosed by '''';

# ver argumentos ou parametros das variaveis padroes do mysql

show variables

show variables like 'secure_file_priv'

select * from produtos into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/lista_produtos.txt'
fields terminated by ',' enclosed by '''';

# importar dados para o banco de dados

# antes precisamos criar a tabela que ira receber os dados

create table ImportVendas (
CodigoPedido int(10),
EmailCliente varchar(100),
CodigoCliente integer,
Qtd integer,
CodigoProduto integer,
CategoriaProduto varchar(50),
primary key (CodigoPedido)
);

# criar o comando para importar os dados do arquivo

load data infile'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clientes.csv' 
into table importvendas fields terminated by ';' enclosed by '''' lines terminated by '\n' ignore 1 rows;

select * from importvendas

# monitorar recursos e tempos de consulta no banco de dados

show processlist

# kill mata processos (consultas rodando no banco de dados)

kill 16

# conceito de CRUD aplicacao com SQL

# C- create / insert
# R - read / select
# U - update
# D - delete

# acoes de DML  + DQL

