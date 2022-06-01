/**
Agenda de contatos
@author João Vitor
*/

-- Verificar bancos de dados
show databases;

-- Criar um novo banco de dados
create database teste;

create database agendajoao;
-- Excluir o banco de dados
drop database teste;

-- Selecionar banco de dados
use agendajoao;

-- Criando uma tabela
-- int (tipo de dados - números inteiros)
-- decimal(10,2) -> tipo de dados - números não inteiros
-- (10,2) 10 dígitos com 2 casas decimais
-- primary key (transforma o campo em chave primária)
-- auto_increment (numeração automática)
-- varchar(255) -> tipo de dados String
-- char(255) -> tipo de String (sem variação)
-- (255) -> máximo de caracteres
-- not null (obrigatório o preenchimento)

create table contatos (
	id int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    email varchar(255)
);

-- verificar tabelas do banco
show tables;

-- Descrever a tabela
describe contatos;

-- adicionando uma coluna(campo) a tabela
alter table contatos add column obs varchar(255);

-- adicionando uma coluna(campo) a tabela após um campo
alter table contatos add column cel varchar(255) after fone;

-- modificando uma pripriedade da tabela
alter table contatos modify column cel varchar(255) not null;

-- excluir uma coluna(campo) da tabela
alter table contatos drop column obs;

-- excluir a tabela
<<<<<<< HEAD
drop table contatos;


/***** CRUD E SEUS FUNDAMENTOS *****/

-- CRUD CREATE
-- Inserir um registro na tabela
-- Tipo varchar ou char usar 'aspas simples'
-- Se você cadastrar um produto utilizar . para casa decimal 

insert into contatos (nome, fone, email)
values ('joao vitor', '1196455-6220', 'joaovitor@gmail.com');

insert into contatos (nome, fone, email)
values ('lica', '1196182-4236', 'lica@gmail.com');

insert into contatos (nome, fone)
values ('pedro', '2194292-7163');

-- EXEMPLO EQUIVOCADO: pois o campo nome é obrigatório

insert into contatos (fone, email)
values ('2194292-7163', 'pedropereira@gmail.com');

insert into contatos (nome, fone, email)
values ('Rosangela Aparecida', '1194123-7766', 'rosangelaaparecida@gmail.com');

insert into contatos (nome, fone, email)
values ('Ana Dutra', '1193695-2312', 'anadutra@gmail.com');

insert into contatos (nome, fone, email)
values ('Anamara Medeiros', '1193345-1296', 'anamaramedeiros@gmail.com');

insert into contatos (nome, fone, email)
values ('Jéssica Macedo', '1192396-1412', 'jessicamacedo@gmail.com');



-- CRUD READ
-- Seleção de todos os registros da tabela
select * from contatos;

-- seleção de registro (contato) especifico
select * from contatos where id=2;
select * from contatos where nome='josé de assis';
select * from contatos where nome like 'b%';

-- seleção de campos especificos de um registro
select nome, fone from contatos;

-- seleção de campos especificos por ordem alfabetica de cima para baixo
select nome, fone, email from contatos order by nome;

-- seleção de campos especificos por ordem alfabetica de baixo para cima
select nome, fone, email from contatos order by nome desc;

-- criando apelidos para os campos
select nome as Contato, fone as Telefone, email as Email
from contatos order by nome;

-- CRUD UPDATE
update contatos set email = 'pedropereira@gmail.com' where id=3;

update contatos set nome = 'João Roberto' where id=4;
update contatos set fone = '1195623-4129' where id=4; 
update contatos set email = 'joaoroberto@gmail.com' where id=4;

-- exemplo de como poderia ser feito também 
-- update contatos set nome = 'João Roberto', fone = '1195623-4129', email = 'joaoroberto@gmail.com' where id=5;

-- CRUD DELETE
delete from contatos where id=2;
=======
drop table contatos;
>>>>>>> d299c98f381739297d9b2ea75a277af75965839c
