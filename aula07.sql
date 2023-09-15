create database bd_aula07;
\c bd_aula07;


create table
    tbl_fornecedor (
        cod_fornecedor serial primary key,
        nome text not null,
        status integer,
        cidade text
    );

create table
    tbl_peca (
        cod_peca serial primary key,
        nome text not null,
        cor text,
        preco numeric,
        cidade text
    );

create table
    tbl_estoque (
        cod_compra serial primary key,
        cod_fornecedor integer references tbl_fornecedor (cod_fornecedor),
        cod_peca integer references tbl_peca (cod_peca),
        quantidade integer
    );

insert into
    tbl_fornecedor (nome, status, cidade)
values
    ('A', 30, 'LONDRES'),
    ('B', 20, 'PARIS'),
    ('C', 10, 'PARIS'),
    ('D', 10, 'LONDRES');

INSERT INTO
    tbl_peca (nome, cor, preco, cidade)
values
    ('PLACA', 'AZUL', 5, 'LONDRES'),
    ('MESA', 'VERMELHA', 10, 'PARIS'),
    ('CADERNO', 'PRETA', 14, 'ROMA'),
    ('TESOURA', 'VERMELHA', 12, 'LONDRES');

INSERT INTO
    tbl_estoque (cod_fornecedor, cod_peca, quantidade)
values
    (1, 1, 30),
    (2, 1, 30),
    (3, 2, 10),
    (3, 3, 50);

select upper(a.nome) as fornecedor, LOWER(b.nome) as peca from tbl_fornecedor a inner join tbl_peca b on a.cidade = b.cidade 
ORDER BY fornecedor, peca;

select distinct cidade from tbl_fornecedor;

select a.nome as nome_peca, a.cor from tbl_peca a inner join tbl_estoque b on a.cod_peca = b.cod_peca
where b.cod_fornecedor = 3
order by nome_peca;
select a.nome as nome_fornecedor, a.cidade from tbl_fornecedor a inner join ( select cod_fornecedor,
sum(case when cod_peca = 1 then quantidade else 0 end) as total_peca_1 from tbl_estoque
group by cod_fornecedor
having sum(case when cod_peca = 1 THEN quantidade else 0 end) > 10)
subquery on a.cod_fornecedor = subquery.cod_fornecedor;

select a.nome as nome_fornecedor, sum(case
when b.cod_peca = 1 then b.quantidade else 0 end) as quantidade_total_peca_1 from tbl_fornecedor a left join tbl_estoque b on a.cod_fornecedor = b.cod_fornecedor
group by a.nome
order by a.nome;
