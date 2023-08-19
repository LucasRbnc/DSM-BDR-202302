drop database if exists bd_aula03;
create database bd_aula03;

CREATE DOMAIN chk_categoria text CHECK (VALUE='DRAMA' OR VALUE='COMEDIA');
CREATE DOMAIN chk_status text CHECK (VALUE='DISPONIVEL' OR VALUE='ALUGADO');
create table tbl_cliente(
  codigo_cliente integer PRIMARY KEY ,
  nome VARCHAR(50) NOT NULL,
  cidade VARCHAR(50),
  endereco VARCHAR(50)
);
create table tbl_titulo(
  codigo_titulo integer PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  descricao VARCHAR(50),
  categoria chk_categoria
);
create table tbl_livros(
  cod_livro integer PRIMARY KEY,
  codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo),
  status chk_status
);
create table tbl_emprestimo(
  numero_emprestimo integer PRIMARY KEY,
  codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente),
  codigo_livro integer REFERENCES tbl_livros(cod_livro)
);
