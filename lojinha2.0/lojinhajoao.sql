/**
Lojinha
@author joao vitor
*/

-- Linha de criação do banco e dados
create database lojinhajoao;

-- Linha de verificação dos bancos de dados
show databases;

-- Linha para usar o banco de dados
use lojinhajoao;

-- Linha de tabela
create table produtos (
	id int primary key auto_increment,
    nome varchar(255) not null,
    estoque int not null,
    preco decimal (10,2)
);

-- Linha para verificar a tabela
show tables;

-- Descrição da tabela
describe produtos;

-- CRUD CREATE --
-- Criação da lista

insert into produtos (nome, estoque, preco)
values ('Capinha Smartphone', 10, 15.00);

insert into produtos (nome, estoque, preco)
values ('Carregador Iphone', 7, 80.00);

insert into produtos (nome, estoque, preco)
values ('Pelicula', 20, 12.00);

insert into produtos (nome, estoque, preco)
values ('Caixa de som', 25, 50.00);

insert into produtos (nome, estoque, preco)
values ('Fone', 30, 15.00);

insert into produtos (nome, estoque, preco)
values ('Pen Drive', 21, 32.00);

-- CRUD READ --

-- selecionar todos os dados da tabela
select * from produtos;

-- seleção de registro especifico
select * from produtos where id=6;

-- ver os dados por ordem alfabetica
select nome, estoque, preco from produtos order by nome;

-- CRUD UPDATE --
-- comando para atualizar a lista de produtos
update produtos set nome = 'Carregador Samsung' where id=2;

update produtos set estoque = 10 where id=2;

update produtos set preco = 60.00 where id=2;

-- CRUD DELETE --

delete from produtos where id=6;
