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
    preco varchar(255) not null
);

-- Linha para verificar a tabela
show tables;

-- Descrição da tabela
describe produtos;

