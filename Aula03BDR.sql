drop database if exists bd_aula03;
create database bd_aula03;

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
  categoria VARCHAR(50) IN (DRAMA, COMEDIA)
);
  
