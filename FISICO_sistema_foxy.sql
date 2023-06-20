/* Logico_sitema_foxy: */

CREATE TABLE Vendedor (
    ID__PK_ INTEGER PRIMARY KEY,
    CPF VARCHAR,
    CNPJ VARCHAR,
    Nome VARCHAR,
    e_mail VARCHAR
);

CREATE TABLE Comprador (
    CPF__PK_ VARCHAR PRIMARY KEY,
    e_mail VARCHAR
);

CREATE TABLE CATALOGO_DE_PRODUTOS (
    ID_Produto_PK_ INTEGER PRIMARY KEY,
    Quantidade INTEGER,
    Valor_produto_FK_ DOUBLE
);

CREATE TABLE Carrinho_de_compras__COMPRADOR_ (
    Descricao_pedido VARCHAR PRIMARY KEY,
    Valor_compra DOUBLE,
    Info_entrega VARCHAR
);

CREATE TABLE Login (
    e_mail VARCHAR PRIMARY KEY,
    fk_CATALOGO_DE_PRODUTOS_ID_Produto_PK_ INTEGER
);

CREATE TABLE cadastro_de_produtos__VENDEDOR_ (
    Entradas_de_cadastro VARCHAR PRIMARY KEY,
    Descricao_produto_FK_ VARCHAR,
    Desconto_produto_FK_ DOUBLE,
    Valor_produto_FK_ DOUBLE
);

CREATE TABLE Acesso_ao_sistema_Vendedor_Comprador_Login (
    fk_Vendedor_ID__PK_ INTEGER,
    fk_Comprador_CPF__PK_ VARCHAR,
    fk_Login_e_mail VARCHAR
);

CREATE TABLE Compra_de_produtos (
    fk_CATALOGO_DE_PRODUTOS_ID_Produto_PK_ INTEGER,
    fk_Carrinho_de_compras__COMPRADOR__Descricao_pedido VARCHAR
);

CREATE TABLE Inserir_produtos_sist_ (
    fk_CATALOGO_DE_PRODUTOS_ID_Produto_PK_ INTEGER,
    fk_cadastro_de_produtos__VENDEDOR__Entradas_de_cadastro VARCHAR
);
 
ALTER TABLE Login ADD CONSTRAINT FK_Login_2
    FOREIGN KEY (fk_CATALOGO_DE_PRODUTOS_ID_Produto_PK_)
    REFERENCES CATALOGO_DE_PRODUTOS (ID_Produto_PK_)
    ON DELETE RESTRICT;
 
ALTER TABLE Acesso_ao_sistema_Vendedor_Comprador_Login ADD CONSTRAINT FK_Acesso_ao_sistema_Vendedor_Comprador_Login_1
    FOREIGN KEY (fk_Vendedor_ID__PK_)
    REFERENCES Vendedor (ID__PK_)
    ON DELETE NO ACTION;
 
ALTER TABLE Acesso_ao_sistema_Vendedor_Comprador_Login ADD CONSTRAINT FK_Acesso_ao_sistema_Vendedor_Comprador_Login_2
    FOREIGN KEY (fk_Comprador_CPF__PK_)
    REFERENCES Comprador (CPF__PK_)
    ON DELETE NO ACTION;
 
ALTER TABLE Acesso_ao_sistema_Vendedor_Comprador_Login ADD CONSTRAINT FK_Acesso_ao_sistema_Vendedor_Comprador_Login_3
    FOREIGN KEY (fk_Login_e_mail)
    REFERENCES Login (e_mail)
    ON DELETE RESTRICT;
 
ALTER TABLE Compra_de_produtos ADD CONSTRAINT FK_Compra_de_produtos_1
    FOREIGN KEY (fk_CATALOGO_DE_PRODUTOS_ID_Produto_PK_)
    REFERENCES CATALOGO_DE_PRODUTOS (ID_Produto_PK_)
    ON DELETE SET NULL;
 
ALTER TABLE Compra_de_produtos ADD CONSTRAINT FK_Compra_de_produtos_2
    FOREIGN KEY (fk_Carrinho_de_compras__COMPRADOR__Descricao_pedido)
    REFERENCES Carrinho_de_compras__COMPRADOR_ (Descricao_pedido)
    ON DELETE SET NULL;
 
ALTER TABLE Inserir_produtos_sist_ ADD CONSTRAINT FK_Inserir_produtos_sist__1
    FOREIGN KEY (fk_CATALOGO_DE_PRODUTOS_ID_Produto_PK_)
    REFERENCES CATALOGO_DE_PRODUTOS (ID_Produto_PK_)
    ON DELETE SET NULL;
 
ALTER TABLE Inserir_produtos_sist_ ADD CONSTRAINT FK_Inserir_produtos_sist__2
    FOREIGN KEY (fk_cadastro_de_produtos__VENDEDOR__Entradas_de_cadastro)
    REFERENCES cadastro_de_produtos__VENDEDOR_ (Entradas_de_cadastro)
    ON DELETE SET NULL;