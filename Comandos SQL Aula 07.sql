-- FUNÇÕES NUMÉRICAS

-- ROUND sem parâmetro (sem casa decimal)
select 
    nm_nome, 
    vl_salario,
    ROUND(vl_salario)
from t_ex01_funcionario;

-- ROUND com parâmetro (mantém 1 casa decimal)
select 
    nm_nome, 
    vl_salario,
    ROUND(vl_salario, 1)
from t_ex01_funcionario;

-- MOD (retorna o resto da divisão)
select 
    nm_nome, 
    vl_salario,
    ROUND(vl_salario, 2),
    MOD(vl_salario, 2),
    MOD(ROUND(vl_salario), 2)
from t_ex01_funcionario;

-- TRUNC (elimina casas decimais)
select 
    nm_nome, 
    vl_salario,
    ROUND(vl_salario, 2),
    MOD(vl_salario, 2),
    MOD(ROUND(vl_salario), 2),
    TRUNC(vl_salario)
from t_ex01_funcionario;

-- SQRT (raiz quadrada)
select 
    nm_nome, 
    vl_salario,
    ROUND(vl_salario, 2),
    MOD(vl_salario, 2),
    MOD(ROUND(vl_salario), 2),
    TRUNC(vl_salario),
    SQRT(vl_salario),
    ROUND(SQRT(vl_salario), 2)
from t_ex01_funcionario;

-- ABS (converte o numero para positivo)
select 
    nm_nome, 
    vl_salario * -1,
    ABS(vl_salario)
from t_ex01_funcionario;

-- FLOOR (arredonda sempre para baixo)
select 
    nm_nome, 
    vl_salario,
    FLOOR(vl_salario)
from t_ex01_funcionario;

-- CEIL (arredonda sempre para cima)
select 
    nm_nome, 
    vl_salario,
    CEIL(vl_salario)
from t_ex01_funcionario;


-- FUNÇÕES CARACTERES

-- LOWER (transforme varchar em minusculo)
select 
    nm_nome,
    LOWER(nm_nome),
    INITCAP(nm_nome) --Primeiro caracter maiusculo
from t_ex01_funcionario;

-- UPPER (transforme varchar em maiusculo)
select 
    nm_nome,
    UPPER(nm_nome)
from t_ex01_funcionario;

-- CONCAT (concatenar campos texto)
select 
    CONCAT('Olá ', nm_nome)
from t_ex01_funcionario;

select 
    CONCAT(ds_endereco, nm_nome)
from t_ex01_funcionario;

-- SUBSTR (retorna caracteres a partir de uma posição)
select 
    SUBSTR(nm_funcionario, 3), -- Retorna caracter a partir da posição 3
    SUBSTR(nm_funcionario, 1, 3) -- Retorna caracter no intervalo de 1 a 3
from t_ex01_funcionario;

-- LENGTH (retorna a quantidade de caracteres)
select 
    LENGTH(nm_nome)
from t_ex01_funcionario;

-- INSTR (retorna a posição do caracter indicado na busca)
select
    nm_funcionario,
    INSTR(nm_funcionario, 'A'), -- Retorna a primeira ocorrência do caracter na sua posição
    INSTR(nm_funcionario, 'A', 3), -- Retorna a primeira ocorrência do caracter na sua posição a partir da terceira posição
    INSTR(nm_funcionario, 'A', 3, 2) -- Retorna a segunda ocorrência do caracter na sua posição a partir da terceira posição
from db_funcionario;

-- RPAD (conta os caracteres e cria uma identação ao lado direito com o restante dos caracteres informados)
select
    nm_funcionario,
    RPAD(nm_funcionario, 20), -- preenche as posições com vazio
    RPAD(nm_funcionario, 20, '.') -- preenche as posições com '.'
from db_funcionario;

-- LPAD (conta os caracteres e cria uma identação ao lado esquerdo com o restante dos caracteres informados)
select
    nm_funcionario,
    LPAD(nm_funcionario, 20), -- preenche as posições com vazio
    LPAD(nm_funcionario, 20, '.') -- preenche as posições com '.'
from db_funcionario;

-- LTRIM (elimina espaço ou caracteres especificos à esquerda)
select
    nm_funcionario,
    LTRIM(nm_funcionario),
    LTRIM(nm_funcionario, 'A') -- Case sensitive
from db_funcionario;

-- RTRIM (elimina espaço ou caracteres especificos à direita)
select
    nm_funcionario,
    RTRIM(nm_funcionario),
    RTRIM(nm_funcionario, 'A') -- Case sensitive
from db_funcionario;

-- TRIM (elimina espaço ou caracteres especificos à esquerda e direita)
select
    nm_funcionario,
    TRIM(nm_funcionario),
    TRIM('A' from nm_funcionario) -- Case sensitive
from db_funcionario;

select
    nm_funcionario,
    CONCAT(CONCAT('   ', nm_funcionario), '   '),
    LTRIM(nm_funcionario),
    CONCAT(CONCAT('   ', nm_funcionario), '   '),
    RTRIM(nm_funcionario),
    CONCAT(CONCAT('   ', nm_funcionario), '   '),
    TRIM(nm_funcionario)
from db_funcionario;

-- REPLACE (buscar e renomear o caracter)
select
    nm_funcionario,
    REPLACE(nm_funcionario, 'a', 'e')
from db_funcionario;

-- FUNÇÕES CONVERSÃO

-- TO_CHAR (transforma para texto)
select
    vl_salario_bruto,
    TO_CHAR(vl_salario_bruto, 'c999999.99') -- Define uma máscara para a conversão
from db_funcionario;

-- Para DATE existem várias máscaras disponíveis
select
    dt_nascimento,
    TO_CHAR(dt_nascimento, 'DD'),
    TO_CHAR(dt_nascimento, 'MM'),
    TO_CHAR(dt_nascimento, 'YY'),
    TO_CHAR(dt_nascimento, 'DAY')
from db_funcionario;

-- TO_NUMBER (converte uma cadeira de caracteres para um valor numerico)

-- TO_DATE (converte uma cadeira de caracteres para um formato de data)

-- FUNÇÕES DE DATA

SYSDATE / CURRENT_DATE
SYSTIMESTAMP / CURRENT_TIMESTAMP
ADD_MONTHS (X, Y)
MONTHS_BETWEEN (mes_final, mes_inicial)

select
    SYSDATE,
    CURRENT_DATE,
    SYSTIMESTAMP,
    CURRENT_TIMESTAMP
from DUAL;

select
    dt_nascimento,
    SYSDATE,
    SYSTIMESTAMP
from db_funcionario;

select
    SYSDATE,
    ADD_MONTHS(SYSDATE, -11),
    ADD_MONTHS(SYSDATE, 11)
from DUAL;

select
    MONTHS_BETWEEN(SYSDATE, '01/01/2018'),
    MONTHS_BETWEEN('05/05/2018', '01/01/2018'),
    MONTHS_BETWEEN('01/01/2017', '01/01/2018'),
    MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, -11)),
from DUAL;
