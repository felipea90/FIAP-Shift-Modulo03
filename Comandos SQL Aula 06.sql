select * from db_funcionario;

select * from db_depto;

select nm_funcionario, f.cd_depto, nm_depto
from db_funcionario f
inner join db_depto d
on f.cd_depto = d.cd_depto;

-- -- -- -- -- --

select * from db_pedido;

select nr_pedido
from db_pedido p
inner join db_funcionario f
on p.dt_pedido > f.dt_cadastramento
where cd_funcionario = 39;

-- -- -- -- -- --

select d.nm_depto, f.nm_funcionario
from db_funcionario f
inner join db_depto d
on f.cd_depto = d.cd_depto
order by d.nm_depto;

-- -- -- -- -- --

select d.nm_depto, f.nm_funcionario
from db_funcionario f
left join db_depto d
on f.cd_depto = d.cd_depto
where d.cd_depto is null
order by d.nm_depto;

-- -- -- -- -- --

select nm_nome, nm_departamento
from t_ex01_funcionario f
right join t_ex01_departamento d
on f.cd_departamento = d.cd_departamento
where nm_nome is null
order by nm_departamento;

-- -- -- -- -- --

select nm_nome, nm_departamento
from t_ex01_funcionario f
full outer join t_ex01_departamento d
on f.cd_departamento = d.cd_departamento;

-- -- -- -- -- --

SELECT
    f.cd_funcionario as cd_funcionario,
    f.nm_funcionario as funcionario,
    f.cd_gerente as cd_gerente,
    g.nm_funcionario as gerente,
from db_funcionario f
inner join db_funcionario g
on f.cd_gerente = g.cd_gerente;

-- -- -- -- -- -- 

select 
   nm_funcionario
   nm_depto
from db_funcionario
cross join db_depto

