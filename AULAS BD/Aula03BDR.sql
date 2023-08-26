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
INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES
    (1, 'João Silva', 'São Paulo', 'Rua A, 123'),
    (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
    (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');
INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES
    (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
    (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
    (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
    (4, 'Código Enigmático', 'Segredos ocultos', 'COMEDIA'),
    (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');
INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
VALUES
    (1, 1, 'DISPONIVEL'),
    (2, 1, 'ALUGADO'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'ALUGADO'),
    (5, 4, 'DISPONIVEL');
INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5),
    (5, 5, 3);
