CREATE DATABASE bd_aula04;
\c bd_aula04;

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

insert into tbl_cliente
values
    (1, 'João Silva', 'São Paulo', 'Rua A, 123'),
    (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
    (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');
	
insert into tbl_titulo
values
    (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
    (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
    (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
    (4, 'Código Enigmático', 'Segredos ocultos', 'COMEDIA'),
    (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');
	
insert into tbl_livros
values
    (1, 1, 'DISPONIVEL'),
    (2, 1, 'INDISPONIVEL'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'INDISPONIVEL'),
    (5, 4, 'DISPONIVEL');
insert into tbl_emprestimo
values
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5),
    (5, 5, 3);

select * from tbl_cliente;
select * from tbl_cliente where cidade = 'São Paulo';
select * from tbl_cliente where codigo_cliente > 3;
select * from tbl_titulo;

UPDATE tbl_livros
set status = 'DISPONIVEL'
where status = 'INDISPONIVEL';

CREATE table tbl_cliente2 (codigo integer);
insert into tbl_cliente2 select codigo_cliente from tbl_cliente;

DELETE FROM tbl_cliente2 
WHERE codigo>3;
