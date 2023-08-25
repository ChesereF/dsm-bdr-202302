CREATE DATABASE bd_aula03;
\c bd_aula03;

CREATE DOMAIN chk_categoria text CHECK (VALUE='DRAMA' OR VALUE='COMEDIA');
CREATE DOMAIN chk_status text CHECK (VALUE='DISPONIVEL' OR VALUE='ALUGADO');

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
	categoria chk_categoria
);


CREATE TABLE tbl_livros (
	cod_livro integer primary key,
	codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo),
	status chk_status 
);


CREATE TABLE tbl_emprestimo (
	numero_emprestimo integer primary key,
	codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente),
	codigo_livro integer REFERENCES tbl_livros(cod_livro)
);

