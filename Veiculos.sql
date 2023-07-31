CREATE DATABASE VEICULOS;

USE VEICULOS;

CREATE TABLE MODELO(
    CODIGO INT UNSIGNED AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(60) NOT NULL,
    VERSAO VARCHAR(30) NOT NULL,
    PRIMARY KEY(CODIGO)
)ENGINE = INNODB;

CREATE TABLE RESPONSAVEL(
    ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(80) NOT NULL,
    TELEFONE CHAR(15) NOT NULL,
    ENDERECO VARCHAR(150) NOT NULL,
    PRIMARY KEY(ID)
)ENGINE = INNODB;

CREATE TABLE MARCA(
    ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(80) NOT NULL,
    DESCRICAO VARCHAR(150),
    PRIMARY KEY(ID)
)ENGINE = INNODB;

CREATE TABLE CATEGORIA(
    ID INT UNSIGNED AUTO_INCREMENT NOT NULL,
    NOME VARCHAR(80) NOT NULL,
    TIPO VARCHAR(40) NOT NULL,
    PRIMARY KEY(ID)
)ENGINE = INNODB;

CREATE TABLE HISTORICO(
    CODIGO INT UNSIGNED NOT NULL AUTO_INCREMENT ,
    DESCRICAO VARCHAR(150) NOT NULL,
    RESPONSAVEL_ID INT UNSIGNED NOT NULL,
    PRIMARY KEY(CODIGO),
    FOREIGN KEY(RESPONSAVEL_ID) REFERENCES RESPONSAVEL(ID)
) ENGINE = INNODB;

CREATE TABLE VEICULO(
    PLACA CHAR(8) NOT NULL,
    COR VARCHAR(40) NOT NULL,
    LUGARES INT UNSIGNED NOT NULL,
    ANO_FABRICACAO INT UNSIGNED NOT NULL,
    PORTAS INT UNSIGNED NOT NULL,
    RESPONSAVEL_ID INT UNSIGNED NOT NULL,
    MODELO_CODIGO INT UNSIGNED NOT NULL,
    MARCA_ID INT UNSIGNED NOT NULL,
    CATEGORIA_ID INT UNSIGNED NOT NULL,
    FOREIGN KEY(RESPONSAVEL_ID) REFERENCES RESPONSAVEL(ID),
    FOREIGN KEY(MODELO_CODIGO) REFERENCES MODELO(CODIGO),
    FOREIGN KEY(MARCA_ID) REFERENCES MARCA(ID),
    FOREIGN KEY(CATEGORIA_ID) REFERENCES CATEGORIA(ID),
    PRIMARY KEY(PLACA)
) ENGINE = INNODB;