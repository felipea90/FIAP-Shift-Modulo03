UPDATE DB_CLIENTE
SET VL_MEDIO_COMPRA = (SELECT AVG(VL_TOT_PEDIDO)
FROM DB_PEDIDO
WHERE DB_CLIENTE.NR_CLIENTE = DB_PEDIDO.NR_CLIENTE);

-----

select * from db_funcionario;

select nm_funcionario, dt_cadastramento from db_funcionario;

-----

select nm_funcionario, vl_salario_bruto, vl_salario_bruto * 1.05, vl_salario_bruto * 1.08 from db_funcionario;

-----

select * from db_cliente;

select nm_cliente, qt_estrelas from db_cliente;

-----

select * from db_produto;

select ds_produto, vl_unitario from db_produto;

-----

select * from db_cliente where qt_estrelas >= 4;

-----

select * from db_cliente where qt_estrelas >= 3 AND vl_medio_compra > 90;

-----

select nm_cliente, qt_estrelas from db_cliente where vl_medio_compra > 100;

-----

select * from db_produto where vl_unitario > 30;

-----

select * from db_pedido;

select * from db_pedido where EXTRACT(MONTH FROM dt_pedido) between 1 and 3 and extract (year FROM dt_pedido) in (select max (extract (year from dt_pedido)) as Ano from db_pedido);

-----

select * from db_funcionario;

select * from db_funcionario where EXTRACT(MONTH FROM dt_cadastramento) between 11 and 12;

-----

select * from db_pedido;

select * from db_pedido where EXTRACT(YEAR FROM dt_pedido) = 2018;
