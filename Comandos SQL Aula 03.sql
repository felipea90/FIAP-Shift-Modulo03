--VERIFICAR O RELACIONAMENTO DAS TABELAS PELO COMANDO SELECT EM USER CONSTRAINTS

SELECT
    CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM
    USER_CONSTRAINTS;

--ALTERAR UMA TABELA EXISTENTE, ADICIONANDO NOVOS CAMPOS

ALTER TABLE
    CATEGORIA
ADD (
    ALTERADA1 NUMBER,
    ALTERADA2 VARCHAR2(50)
);

--ALTERANDO UMA TABELA EXISTENTE, REMOVENDO CAMPOS ESPECIFICOS

ALTER TABLE
    CATEGORIA
DROP (
    ALTERADA1,
    ALTERADA2
);

--ALTERANDO UMA TABELA EXISTENTE, ADICIONANDO UMA CHAVE PRIMÁRIA

ALTER TABLE
    CATEGORIA
ADD CONSTRAINT 
    PK_CATEGORIA_ALTERADA1
PRIMARY KEY
    (ALTERADA1);

--SELECT ESPECÍFICO DA TABELA NA USER CONSTRAINT    

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CATEGORIA';
    
--ALTERANDO UMA TABELA EXISTENTE, REMOVENDO UMA OU MAIS CONSTRAINTS

ALTER TABLE
    CATEGORIA
DROP CONSTRAINT
    PK_CATEGORIA_ALTERADA1;
    
--ALTERANDO UMA TABELA EXISTENTE, DESABILITANDO A CONSTRAINT

ALTER TABLE
    CATEGORIA
DISABLE CONSTRAINT
    PK_CATEGORIA_ALTERADA1;
    
--ALTERANDO UMA TABELA EXISTENTE, MODIFICANDO O TIPO DA COLUNA

ALTER TABLE
    CATEGORIA
MODIFY
    ALTERADA2 VARCHAR2(100);

--ELIMINA TODO O CONTEPUDO DA TABELA

TRUNCATE TABLE <NOME_TABELA>;

--ELIMINA A TABELA GERAL

DROP TABLE <NOME_TABELA>;

--USO DE SEQUENCE PARA ADICIOANR REGISTROS

CREATE TABLE ALUNO (
    CODIGO NUMBER,
    NOME VARCHAR2(50),
    SEXO VARCHAR2(1)
);

INSERT INTO ALUNO
VALUES (1, 'FELIPE', 'M');

INSERT INTO ALUNO
VALUES (2, 'THIAGO', 'M');

INSERT INTO ALUNO
VALUES (3, 'TASSIA', 'F');

ALTER TABLE ALUNO
ADD DATANASC DATE;

UPDATE ALUNO SET DATANASC = '15/06/1995' WHERE CODIGO = 3;

CREATE SEQUENCE SEQ_ALUNO;

INSERT INTO ALUNO
VALUES (SEQ_ALUNO.NEXTVAL, 'CARLOS', 'M', '05/08/2000');

CREATE SEQUENCE SEQ_ALUNO
START WITH 10
INCREMENT BY 5;

INSERT INTO ALUNO
VALUES (SEQ_ALUNO.NEXTVAL, 'AMANDA', 'F', '06/09/2002');

INSERT INTO ALUNO
VALUES (SEQ_ALUNO.NEXTVAL, 'JULIA', 'F', '03/06/1998');

SELECT * FROM ALUNO;

