-- Questão 1

select
    f.cd_funcionario codigo,
    f.nm_funcionario nome,
    f.dt_nascimento nascimento,
    d.nm_depto departamento
from db_funcionario f
left join db_depto d
    on f.cd_depto = d.cd_depto
order by f.cd_funcionario;

-- Questão 2

select
    f.cd_funcionario codigo,
    f.nm_funcionario nome,
    l.nm_logradouro endereço,
    e.nr_end numero,
    e.ds_complemento_end complemento,
    l.nr_cep
from db_funcionario f
left join db_end_func e 
    on f.cd_funcionario = e.cd_funcionario
left join db_logradouro l
    on e.cd_logradouro = l.cd_logradouro
order by f.cd_funcionario;

-- Questão 1.1

select
    f.cd_funcionario codigo,
    f.nm_funcionario nome,
    f.dt_nascimento nascimento,
    d.nm_depto departamento
from db_funcionario f
left outer join db_depto d
    on f.cd_depto = d.cd_depto
left join db_end_func ef
    on f.cd_funcionario = ef.cd_funcionario
left join db_logradouro l
    on ef.cd_logradouro = l.cd_logradouro
left join db_bairro b
    on l.cd_bairro = b.cd_bairro
left join db_cidade c
    on b.cd_cidade = c.cd_cidade
left join db_estado e
    on c.sg_estado = e.sg_estado
where e.nm_estado = 'BAHIA'
order by f.cd_funcionario;

-- Questão 2.1

select
    p.nr_pedido pedido,
    f.nm_funcionario motoboy,
    c.nm_cliente cliente
from db_pedido p
left join db_cliente c
    on p.nr_cliente = c.nr_cliente
left join db_funcionario f
    on p.cd_func_motoboy = f.cd_funcionario
where extract(year from p.dt_pedido) = 2019
order by p.nr_pedido;
