-- FUNÇÕES DE AGREGAÇÃO

-- AVG (retorna a média entre os valores)
select
    TRUNC(AVG(vl_salario_bruto), 2)
from db_funcionario;

select
    TRUNC(AVG(f.vl_salario_bruto), 2),
    d.nm_depto
from db_funcionario f
inner join db_depto d
    on f.cd_depto = d.cd_depto
group by d.nm_depto
order by TRUNC(AVG(f.vl_salario_bruto), 2);

-- COUNT (faz a contagem de registros)
select
    TRUNC(AVG(vl_salario_bruto), 2),
    COUNT(cd_funcionario)
from db_funcionario;

select
    TRUNC(AVG(f.vl_salario_bruto), 2),
    COUNT(f.cd_funcionario),
    d.nm_depto
from db_funcionario f
inner join db_depto d
    on f.cd_depto = d.cd_depto
group by d.nm_depto
order by TRUNC(AVG(f.vl_salario_bruto), 2);

-- MAX (Maior valor da consulta)
select
    MAX(vl_salario_bruto)
from db_funcionario;

-- MIN (Menor valor da consulta)
select
    MIN(vl_salario_bruto)
from db_funcionario;

-- SUM (Soma de todos os valores da coluna)
select
    SUM(vl_salario_bruto)
from db_funcionario;

-- STDDEV (desvio padrão -> indica o grau de variação de um conjunto de elementos)
select
    STDDEV(vl_salario_bruto)
from db_funcionario;

-- VARIANCE (é uma medida de dispersão que mostra o quão distante cada valor desse conjunto está do valor central (médio))
select
    VARIANCE(vl_salario_bruto)
from db_funcionario;


-- FUNÇÕES DE AGREGAÇÃO COM CONDIÇÃO

-- HAVING (pode ser usado com qualquer função de agregação)

select
    TRUNC(AVG(f.vl_salario_bruto), 2),
    COUNT(f.cd_funcionario),
    d.nm_depto
from db_funcionario f
inner join db_depto d
    on f.cd_depto = d.cd_depto
group by d.nm_depto
HAVING COUNT(f.cd_funcionario) > 1;

-- EXPRESSÃO CASE

select
    nm_funcionario,
    CASE
        WHEN st_func = 'A' THEN 'ATIVO'
        ELSE 'INATIVO'
    END STATUS -- recebe ALIAS para nome do CASE
from db_funcionario;
