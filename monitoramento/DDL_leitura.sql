/************************************************************
 * SCRIPT DE CRIAÇÃO DO BANCO DE DADOS — GENÉRICO
 * Personalize os nomes conforme sua necessidade.
 *
 * Antes de executar, substitua:
 *   NOME_DO_BANCO       → nome desejado para o banco de dados
 *   NOME_DA_TABELA      → nome desejado para a tabela
 *   USUARIO_DE_LEITURA  → usuário MySQL que acessará o painel
 *   SENHA_DO_USUARIO    → senha definida pelo usuário
 ************************************************************/

-- APAGA o banco caso já exista (opcional)
DROP DATABASE IF EXISTS NOME_DO_BANCO;

-- CRIA o banco
CREATE DATABASE NOME_DO_BANCO;

-- SELECIONA o banco
USE NOME_DO_BANCO;

-- CRIA A TABELA PRINCIPAL DE LEITURAS
CREATE TABLE NOME_DA_TABELA (
    ID_LEITURA        INT NOT NULL AUTO_INCREMENT,
    DATA_HORA         DATETIME NOT NULL,
    SENSOR            VARCHAR(20) NOT NULL,
    VALOR_TEMP_X10    INT NOT NULL,
    VALOR_UMID_X10    INT NOT NULL,
    PRIMARY KEY (ID_LEITURA)
);

-- CRIA USUÁRIO DE SOMENTE LEITURA (PARA O PAINEL)
CREATE USER 'USUARIO_DE_LEITURA'@'localhost' IDENTIFIED BY 'SENHA_DO_USUARIO';

-- PERMISSÃO DE APENAS CONSULTA (SEM ALTERAR NADA)
GRANT SELECT ON NOME_DO_BANCO.* TO 'USUARIO_DE_LEITURA'@'localhost';

-- ATUALIZA PRIVILÉGIOS
FLUSH PRIVILEGES;
