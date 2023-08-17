CREATE DATABASE bd_aula03;
\c bd_aula03;

CREATE TABLE tbl_cliente (
	codigo_cliente integer primary key,
	Nome varchar (100) NOT NULL,
	Cidade varchar (100),
	Endereco varchar (100)
);

CREATE TABLE tbl_titulo (
	codigo_titulo integer primary key,
	titulo text NOT NULL,
	descricao text,
	categoria text
);

CREATE TABLE tbl_emprestimo (
	numero_emprestimo integer primary key,
	codigo_cliente varchar (20),
	codigo_livro varchar (20)
);

CREATE TABLE tbl_livros (
	cod_livro integer primary key,
	codigo_titulo varchar (20),
	status text 
);
