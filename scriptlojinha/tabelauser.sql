/**
Tabela de usuários
@author joao vitor
@version 1.1
*/

create database tabelausuario;

use tabelausuario;

create table usuarios (
	iduser int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique,
    senha varchar(255) not null,
    perfil varchar(255) not null
);
describe usuarios;

insert into usuarios (usuario,login,senha,perfil)
values ('administrador','admin',md5('admin'),'admin');

insert into usuarios (usuario,login,senha,perfil)
values ('Jefferson','jeff',md5('123456'),'user');

select * from usuarios;

select * from usuarios where login='admin' and senha=md5('admin');


-- ========== CREATE TABLE FORNECEDORES==============
create table fornecedores (
idfor int primary key auto_increment,
cnpj varchar(255) not null unique,
ie varchar(255) unique,
im varchar(255) unique,
razao varchar(255) not null,
fantasia varchar(255) not null,
site varchar(255),
fone varchar(255) not null,
contato varchar(255),
email varchar(255),
cep varchar(255) not null,
endereco varchar(255) not null,
numero varchar(255) not null,
complemento varchar(255),
bairro varchar(255) not null,
cidade varchar(255) not null,
uf varchar(255) not null,
obs varchar(255)
);

select * from fornecedores;

select * from produtos;

insert into fornecedores (cnpj, razao, fantasia,fone, cep, endereco, numero, bairro, cidade, uf)
values ('76.256.914/0001-80', 'Assitência técnica', 'LhL Cell','11912543-7481','01011-902','Rua São Bento','329','Centro','São Paulo','SP');

insert into produtos(codigo) values(1);
 select * from fornecedores where idfor = 1;
 
 select * from fornecedores inner join produtos
on fornecedores.idfor = produtos.idfor;

-- verificar pedidos junto com o nome do fornecedor (relatorio simplificado)
-- %H:%i exibir também o horário formatado
select
produtos.codigo,
date_format(produtos.datacad, '%d/%m/%Y - %H:%i') as data_ped,
produtos.produto,
fornecedores.fantasia as fornecedor,
fornecedores.cnpj,
fornecedores.uf
from fornecedores inner join produtos
on fornecedores.idfor = produtos.idfor;

select * from fornecedores;

drop table produtos; 


create table produtos (
	codigo int primary key auto_increment,
    barcode varchar(255),
	produto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
    custo decimal (10,2) not null,
    lucro decimal(10,2),

    venda decimal (10,2),
    idfor int not null,
    foreign key (idfor) references fornecedores(idfor)
);

drop table produtos;

-- modificar o barcode adicionando o unique
alter table produtos modify column barcode varchar(255) unique;

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda,idfor)
values ('1234567890','Capinha','Capinha para Smartphone', 'Tux Capas',20300720,25,'40','UN','setor de capinhas',10.90,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('111111111','Fone bluetooth','Fone bluetooth aprova dágua', 'fone max',20250410,50,'5','UN','setor de fones',15.90,100,200,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('222222222','Celular Samsung','Samsug A20', 'Pro celulares ',20350926,2,'3','UN','vitrine de smartphone',2000,400,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('333333333','Caixinha de som','Caixinha JBL Camuflada', 'JBL Caixas',20400330,70,'10','UN','pratilheira de caixas de som',220,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('444444444','Teclado','Teclado gamer RGB', 'Teclas HW',20240109,70,'10','UN','Setor de perifericos',140,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('555555555','Mouse','Mouse gamer RGB DPI 1300', 'Ratos fio',20230613,70,'10','UN','Setor de perifericos',110,100,300, 1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('666666666','Monitor','Monitor 24 polegadas 1080p', 'Monitor',20270423,70,'10','UN','Setor de TVs e Monitores',1200,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('777777777','Cadeira','Cadeira gamer', 'caders gamer',20290728,70,'10','UN','Setor de cadeiras',1700,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('888888888','SSD','SSD 1TB', 'Kingston',20190312,70,'10','UN','Vitrine de hardwares',2200,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('999999999','Carregador','Carregadores Apple, samsung, motorola, lg', 'carre cabos',20180122,70,'10','UN','Vitrine de hardwares',35,100,300,1);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda, idfor)
values ('1010101010','Pelicula','Pelicula 3D', 'Peliculos',20171124,70,'10','UN','Setor de peliculas',10,100,300,1);

-- modificar o barcode adicionando o unique
alter table produtos modify column barcode varchar(255) unique;

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1234567890','Capinha','Capinha para Smartphone', 'Tux Capas',20300720,25,'40','UN','setor de capinhas',10.90,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('111111111','Fone bluetooth','Fone bluetooth aprova dágua', 'fone max',20250410,50,'5','UN','setor de fones',15.90,100,200);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('222222222','Celular Samsung','Samsug A20', 'Pro celulares ',20350926,2,'3','UN','vitrine de smartphone',2000,400,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('333333333','Caixinha de som','Caixinha JBL Camuflada', 'JBL Caixas',20400330,70,'10','UN','pratilheira de caixas de som',220,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('444444444','Teclado','Teclado gamer RGB', 'Teclas HW',20240109,70,'10','UN','Setor de perifericos',140,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('555555555','Mouse','Mouse gamer RGB DPI 1300', 'Ratos fio',20230613,70,'10','UN','Setor de perifericos',110,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('666666666','Monitor','Monitor 24 polegadas 1080p', 'Monitor',20270423,70,'10','UN','Setor de TVs e Monitores',1200,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('777777777','Cadeira','Cadeira gamer', 'caders gamer',20290728,70,'10','UN','Setor de cadeiras',1700,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('888888888','SSD','SSD 1TB', 'Kingston',20190312,70,'10','UN','Vitrine de hardwares',2200,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('999999999','Carregador','Carregadores Apple, samsung, motorola, lg', 'carre cabos',20180122,70,'10','UN','Vitrine de hardwares',35,100,300);

insert into produtos (barcode,produto,descricao,fabricante,dataval,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values ('1010101010','Pelicula','Pelicula 3D', 'Peliculos',20171124,70,'10','UN','Setor de peliculas',10,100,300);

describe produtos;

select * from produtos;

-- inventario do estoque (patrimônio)
-- sum() função de soma no banco de dados
select sum(estoque * custo) as total from produtos;

-- Relatório de reposição de etoque 1
select * from produtos where estoque < estoquemin;

-- relatório de reposição de estoque 2
-- date_format() função usada para formatar a data
-- %d/%m/%Y dd/mm/aaaa | %d/%m/%y dd/mm/aa

select codigo as código,produto,
date_format(dataval, '%d/%m/%Y') as data_validade,
estoque,estoquemin as estoque_minimo
from produtos where estoque < estoquemin;

-- relatório de validade de produtos 1 
select codigo as código,produto,
date_format(dataval, '%d/%m/%Y') as data_validade
from produtos;

-- relatório de validade de produtos 2
-- datediff() calcula a diferença em dias
-- curdate obtém a data atua

select codigo as código,produto,
date_format(dataval, '%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from produtos;

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    cpf varchar(255) unique,
    email varchar(255),
    marketing varchar(255) not null,
    cep varchar(255),
    endereco varchar(255),
    numero varchar(255),
    complemento varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(2)
    );
    
-- adicionando um campo de nascimento na tabela clientes
alter table clientes add column nascimento varchar(255);

describe clientes;

-- ====CRUD CREATE CLIENT===
insert into clientes (nome, fone, cpf, marketing)
values ('pablo', '1196455-6220', '322.748.523-49','não');

insert into clientes (nome, fone, cpf, marketing, email)
values ('ale', '1196182-4236','973.451.205-74','sim', 'aeeeooooo@gmail.com');

insert into clientes (nome, fone, cpf, marketing, uf)
values ('pedro', '2194292-7163','825.753.155-34','não','RJ');

insert into clientes (nome, fone, cpf, marketing, endereco)
values ('Beto', '1197344-5110', '112.637.412-38','não', 'Jardim rua sem entrada');

insert into clientes (nome, fone, cpf, marketing, bairro)
values ('Marcos mion', '1194233-4080', '998.776.665-55','não', 'bairro da vila');

insert into clientes (nome, fone, cpf, marketing, cidade)
values ('Ratinho', '11912543-7481', '489.726.301-20','não','São Paulo');

-- ====CRUD READ CLIENT=======
select * from clientes;

-- =====CRUD UPDATE CLIENT=====
update clientes set fone = '4002-8922' where idcli=6;

-- =======CRUD DELETE CLIENT=============
delete from clientes where idcli=6;

-- =====Relatório de cliente personalizados
select nome,fone,email
from clientes;

select nome, nascimento,
date_format(nascimento, '%d/%m/%Y') as data_validade
from clientes;

select * from clientes where marketing = 'sim';

-- foreign key(FK) Chave estrangeira que cria o relacionamento
-- do tipo 1-N com a tabela clientes
-- FK(pedidos)______________PK(clientes)
-- Observação: Usar o mesmo nome e tipo de dados nas chaves (PK e FK)
create table pedidos (
pedido int primary key auto_increment,
dataped timestamp default current_timestamp,
total decimal(10,2),
idcli int not null,
foreign key (idcli) references clientes(idcli)
);

-- abertura de pedido
insert into pedidos(idcli) values(1);

-- verificar pedidos
select * from pedidos where pedido = 1;

-- verificar pedido junto com o nome do cliente
-- inner join (unir informações de 2 ou mais tabelas)
select * from pedidos inner join clientes
on pedidos.idcli = clientes.idcli;

-- verificar pedidos junto com o nome do cliente (relatorio simplificado)
-- %H:%i exibir também o horário formatado
select
pedidos.pedido,
date_format(pedidos.dataped, '%d/%m/%Y - %H:%i') as data_ped,
clientes.nome as cliente,
clientes.fone
from pedidos inner join clientes
on pedidos.idcli = clientes.idcli;

-- ===== Linha de tabela de carrinho =======
-- tabela de apoio para criar um relacionamento de tipo M-M
-- (muitos para muitos) neste caso não criamos a chave primaria
create table carrinho (
	pedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
    foreign key(codigo) references produtos(codigo)
);
insert into carrinho values (1,2,3);
insert into carrinho values (1,4,1);

select * from carrinho;

-- Exibir o carrinho
select pedidos.pedido,
carrinho.codigo as código,
produtos.produto,
carrinho.quantidade,
produtos.venda,
produtos.venda * carrinho.quantidade as sub_total
from (carrinho inner join pedidos on carrinho.pedido =
pedidos.pedido)
inner join produtos on carrinho.codigo = produtos.codigo;

-- Total do pedido(carrinho)
select sum(produtos.venda * carrinho.quantidade) as total
from carrinho inner join produtos on carrinho.codigo = produtos.codigo;

-- atualização do estoque
update carrinho
inner join produtos
on carrinho.codigo = produtos.codigo
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;