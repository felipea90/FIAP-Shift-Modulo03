CREATE TABLE Categoria (
    Cod_Categoria NUMBER CONSTRAINT PK_Categoria_Cod_Categoria PRIMARY KEY,
    Categoria VARCHAR2(255) UNIQUE,
	CONSTRAINT CK_Categoria_Categoria CHECK (Categoria in ('DOCE', 'BEBIDA', 'CONGELADO'))
);

CREATE TABLE Materia_Prima (
    Cod_Materia_Prima NUMBER CONSTRAINT PK_Materia_Prima_Cod_Materia_Prima PRIMARY KEY,
    Materia_Prima VARCHAR2(255) UNIQUE
);

CREATE TABLE Produto (
    Cod_Produto NUMBER CONSTRAINT PK_Produto_Cod_Produto PRIMARY KEY,
    Produto VARCHAR2(255) UNIQUE,
    Cod_Categoria NUMBER CONSTRAINT FK_Produto_Cod_Produto_Categoria_Cod_Categoria 
    REFERENCES Categoria (Cod_Categoria)
);

CREATE TABLE Item_Produto (
    Cod_Produto NUMBER,
    Cod_Materia_Prima NUMBER,
    Quantidade NUMBER NOT NULL,
    
    CONSTRAINT PK_Item_Produto_Cod_Produto_Cod_Materia_Prima 
	PRIMARY KEY (Cod_Produto, Cod_Materia_Prima),
    
    CONSTRAINT FK_Item_Produto_Cod_Produto_Produto_Cod_Produto 
	FOREIGN KEY (Cod_Produto) REFERENCES Produto (Cod_Produto),
    
    CONSTRAINT FK_Item_Produto_Cod_Materia_Prima_Materia_Prima_Cod_Materia_Prima 
	FOREIGN KEY (Cod_Materia_Prima) REFERENCES Materia_Prima (Cod_Materia_Prima)
);
