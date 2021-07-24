-- Questão 1
select
    nm_funcionario,
    upper(nm_funcionario),
    lower(nm_funcionario),
    initcap(nm_funcionario)
from db_funcionario;

-- Questão 2
select
    nm_funcionario,
    dt_nascimento,
    trunc(months_between(current_date, dt_nascimento)/12) as idade
from db_funcionario;

-- Questão 3
select
    nm_funcionario,
    dt_nascimento,
    trunc(months_between(current_date, dt_nascimento)/12) as idade,
    round(mod(trunc(months_between(current_date, dt_nascimento)/12), 2), 2) as par_impar
from db_funcionario;

-- Questão 4
select
    nm_funcionario,
    vl_salario_bruto,
    vl_salario_bruto / 3 as aumento,
    ceil(vl_salario_bruto + (vl_salario_bruto / 3)) as total
from db_funcionario;

-- Desafio

-- Questão 1.1
select
    nm_funcionario,
    dt_nascimento,
    trunc(months_between(current_date, dt_nascimento)/12) as idade,
    trunc(months_between('31/12/2025', dt_nascimento)/12) as aposentado_2025
from db_funcionario
where trunc(months_between('31/12/2025', dt_nascimento)/12) >= 55;

-- Questão 2.1
select
    nm_funcionario,
    dt_nascimento,
    trunc(months_between(current_date, dt_nascimento)/12) as idade,
    trunc(months_between('31/12/2025', dt_nascimento)/12) as nao_aposentado_2025,
    55 - (trunc(months_between('31/12/2025', dt_nascimento)/12)) as faltam_anos
from db_funcionario
where trunc(months_between('31/12/2025', dt_nascimento)/12) < 55
order by trunc(months_between(current_date, dt_nascimento)/12);

-- Questão 3.1
select
    nm_funcionario,
    dt_nascimento,
    trunc(months_between('31/12/2025', dt_nascimento)/12) as aposentado_2025,
    to_char((vl_salario_bruto * 0.70), 'c9999999.99') as salario_aposentadoria_2025
from db_funcionario
where trunc(months_between('31/12/2025', dt_nascimento)/12) >= 55;

