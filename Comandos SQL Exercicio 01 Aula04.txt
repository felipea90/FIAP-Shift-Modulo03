create table Cientista 
(
    Codigo number(4) constraint pk_cientista_codigo primary key,
    Nome varchar2(50) CONSTRAINT NN_CIE_NOME NOT NULL,
    dt_nasc Date,
    SEXO CHAR(1) CONSTRAINT CK_CIE_SEX CHECK (SEXO IN ('F', 'M', 'f', 'm'))
);

insert into cientista
values (1010, 'Stephen Hawking', '08/01/1942', 'M');

insert into cientista
values (1011, 'Alberto Einstein', '14/03/1879', 'M');

insert into cientista
values (1012, 'Isaac Newton', '04/01/1643', 'M');

insert into cientista
values (1013, 'Galileu Galilei', '05/02/1564', 'M');

insert into cientista
values (1014, 'Nicolau Corpenico', '19/02/1473', 'M');

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'PORTUGUESE';

select * from cientista;

create table Cliente 
(
    Codigo number(4) constraint pk_Cliente_codigo primary key,
    Nome varchar2(50) CONSTRAINT NN_Cli_NOME NOT NULL
);


insert into cliente select codigo, nome from cientista;

select * from cliente;

alter table cientista
add dt_obito date;

update cientista
set dt_obito = '05/08/2000'
where codigo = 1010;

update cientista
set dt_obito = '08/07/1939'
where codigo = 1011;

update cientista
set dt_obito = '05/12/1711'
where codigo = 1012;

update cientista
set dt_obito = '01/02/1622'
where codigo = 1013;

update cientista
set dt_obito = '13/09/1536'
where codigo = 1014;

select * from cientista;

update cientista
set nome = 'Einstein'
where codigo = 1011;

update cientista
set nome = 'Newton'
where codigo = 1012;

select * from cientista;

ALTER TABLE CLIENTE
ADD DT_NASC DATE;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

update cliente 
set dt_nasc = (
select dt_nasc from cientista where cliente.codigo = cientista.codigo);

select * from cliente;

--Usando a ação DELETE

select * from cientista;

---- x ----
select * from cientista
where extract (month from dt_nasc) != 2;

delete from cientista
where extract (month from dt_nasc) != 2;

---- x ----

select * from cientista
where to_char (dt_nasc, 'month') <> 'fevereiro';

delete from cientista
where to_char (dt_nasc, 'month') <> 'fevereiro';

-------------

select * from cliente;

select codigo from cientista;

delete from cliente
where cliente.codigo not in (select codigo from cientista);