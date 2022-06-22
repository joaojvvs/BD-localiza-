create database localiza;
use localiza;

create table cliente (
cpf_locador int not null,
 nome varchar (40) not null,
 rg varchar(40) not null,
 numero_cnh int not null,
 d_nascimento varchar(40) not null,
 primary key (cpf_locador)
 );
 insert	into cliente (cpf_locador, nome, rg, numero_cnh, d_nascimento) values (10840550, 'joão_Fernando', 1612942154, 00525, '15/05/2004');
insert	into cliente (cpf_locador, nome, rg, numero_cnh, d_nascimento) values (78945623, 'elpablo', 1432676, 00525, '15/05/2005');
insert	into cliente (cpf_locador, nome, rg, numero_cnh, d_nascimento) values (10848550, 'apresentação', 65642154,17082, '18/06/2004');
insert	into cliente (cpf_locador, nome, rg, numero_cnh, d_nascimento) values (78840550, 'vitoria', 942154, 07785, '25/05/2003');
select * from  cliente;
 
create table carro (
 chassi varchar(40) not null,
 placa varchar(40) not null,
 marca varchar(40) not null,
 cor varchar(40) not null,
 modelo varchar(40) not null,
 ano int not null,
 preço float,
 cod_categoria int not null,
 primary key (chassi)
 );
 insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('6GU79kF233hVr1828','f809mpc','audi', 'preta','r8', '2018', 6.511, 1);
 insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('2t5 Km5tAL 3a 4A5969','JWE-4629','lamborghini', 'roxa','urus', '2020',27.194, 2);
insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('61P 1gRl38 7n 4j3233','NFA-8079','dodge' , 'verde','viper', '2016', 5.287, 1);
insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('7eU YdArVL aG 291001','MVU-8859','mitsubishi', 'preta','Starion', '2007',8.812, 1);
insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('7zm 2LR9AZ jc 4R9986','IXP-1835','NISSAN', 'branca','GTR', '2011',6,318, 1);
insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('116 5tWA1D ZX A80471','HQC-3009','MERCEDES', 'azul','BENZ', '2022',2.812, 2);
insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('7Rv 6YpYAl mu 6y9922','JUT-6218','BMW', 'preta','X5', '2018',6.812, 2);
insert	into carro (chassi,placa,marca,cor,modelo,ano, preço, cod_categoria) values ('3k2 wAmfT0 M2 bz7833','MMM-1413','BMW', 'branca','i8', '2020',11.812, 1);
select * from carro;
 
 
create table categoria (
 cod_categoria int not null,
 descrição varchar(20), 

 primary key (cod_categoria)
 );
 insert into categoria (cod_categoria, descrição) values (1, 'esportivo muito top');
 insert into categoria (cod_categoria, descrição) values (2, 'suv carro de velho');
select * from categoria;

 
create table locaçao (
 id_locaçao int auto_increment,
 cpf_locador int not null,
 chassi varchar(40) not null,
 cod_categoria int not null,
 d_locação varchar(40) not null,
 h_locaçao varchar (40) not null,
 d_devoluçao varchar(40) not null,
 h_devoluçao varchar(40) not null,
 primary key (id_locaçao)
 );
 insert into locaçao (cpf_locador, chassi, cod_categoria, d_locação, h_locaçao, d_devoluçao, h_devoluçao) values (10840550, '6GU79kF233hVr1828', 1, '13/05/2022', '11:30', '02/06/2022', '17:30');
 insert into locaçao (cpf_locador, chassi, cod_categoria, d_locação, h_locaçao, d_devoluçao, h_devoluçao) values (98479797, '2t5 Km5tAL 3a 4A5969', 2, '14/05/2022', '11:30', '03/06/2022', '17:30');
 insert into locaçao (cpf_locador, chassi, cod_categoria, d_locação, h_locaçao, d_devoluçao, h_devoluçao) values (34134611, '61P 1gRl38 7n 4j3233', 1, '15/05/2022', '11:30', '04/06/2022', '17:30');
 insert into locaçao (cpf_locador, chassi, cod_categoria, d_locação, h_locaçao, d_devoluçao, h_devoluçao) values (70339038632, '7eU YdArVL aG 291001', 1, '16/05/2022', '11:30', '05/06/2022', '17:30');
select * from locaçao;
drop table locaçao;
 
alter table locaçao add foreign key (cpf_locador) references cliente (cpf_locador);
alter table locaçao add foreign key (cod_categoria) references categoria (cod_categoria);
alter table carro add foreign key (cod_categoria) references categoria (cod_categoria); 

-------------------------------------------------------- pesquisa-------------------------------------------------------------------------
-- mostrar carros--
select * from carro;
-- carro mais caro--
select modelo,marca,cod_categoria, max(preço) from carro;
-- carro mais barato--
select modelo, marca ,cod_categoria, min(preço) from carro;
--  mostrar carros esportivos -- 
select  marca ,modelo, preço from carro where cod_categoria = 1; 
-- mostrar carros suv --
select marca ,modelo,  preço from carro where cod_categoria = 2; 
-- carros alugados--
select modelo , marca , preço from carro where carro.chassi = (select chassi from locaçao);
select * from locaçao;
select * from carro;
select carro.modelo, carro.marca , carro.preço from carro, locaçao where carro.chassi=locaçao.chassi;