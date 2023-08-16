CREATE DATABASE bd_sistema_bancario;
\c bd_sistema_bancario;

CREATE TABLE clientes (
	nome varchar(100),
	email varchar(100),
	telefone varchar(20)
);

CREATE TABLE produtos (
	nome varchar(100),
	preco numeric(10, 2),
	estoque integer
);

CREATE TABLE funcionarios (
	nome varchar(100),
	cargo varchar (50),
	salario numeric (10, 2),
	data_contratacao date
);

CREATE TABLE fornecedores (
	nome varchar (100),
	endereco varchar (200),
	telefone varchar (20)
);

CREATE TABLE vendas (
	nome_cliente varchar (100),
	data_venda date,
	total_venda numeric(10, 2)
);

CREATE TABLE cliente (
	nome_cliente text,
	cidade_cliente text,
	endereco_cliente text
);

CREATE TABLE emprestimo(
	numero_emprestimo integer, 
	nome_agencia text,
	valor real
);
	
CREATE TABLE conta(
	numero_conta integer,
	nome_agencia text, 
	saldo real
);

CREATE TABLE agencia(
	nome_agencia text, 
	cidade_agencia text, 
	depositos real
);

DROP TABLE clientes, fornecedores, funcionarios, produtos, vendas;

ALTER TABLE cliente RENAME TO tbl_cliente;
ALTER TABLE emprestimo RENAME TO tbl_emprestimo;
ALTER TABLE conta RENAME TO tbl_conta;
ALTER TABLE agencia RENAME TO tbl_agencia;
ALTER TABLE tbl_cliente ADD COLUMN idade integer;
ALTER TABLE tbl_cliente ADD COLUMN cpf integer;
ALTER TABLE tbl_agencia RENAME COLUMN cidade_agencia TO endereco_agencia;

CREATE SCHEMA franciele;
