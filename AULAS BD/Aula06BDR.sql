create database bd_aula06;
create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');
create table tbl_cliente (codigo_cliente integer PRIMARY KEY, nome text not null, cidade text, endereco text);
create table tbl_titulo (codigo_titulo integer primary key, titulo text not null, descricao text, categoria chk_categoria);
create table tbl_livros (cod_livro integer PRIMARY KEY, codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'DISPONIVEL');
create table tbl_emprestimo (numero_emprestimo integer PRIMARY KEY, codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente), codigo_livro integer REFERENCES tbl_livros(cod_livro));

INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES
    (1, 'Joao Silva', 'Sao Paulo', 'Rua A, 123'),
    (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
    (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');

INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES
    (1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
    (2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
    (3, 'Amor nas Estrelas', 'Um romance intergaláctico', 'DRAMA'),
    (4, 'Código Enigmatico', 'Segredos ocultos', 'COMEDIA'),
    (5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');

INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
VALUES
    (1, 1, 'ALUGADO'),
    (2, 1, 'ALUGADO'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'ALUGADO'),
    (5, 4, 'ALUGADO');

INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5);

--Liste os títulos e seus status, incluindo os que não têm status definido
select b.titulo,a.status from tbl_titulo b INNER JOIN tbl_livros a ON b.codigo_titulo = a.codigo_titulo;
--Liste os títulos e suas descrições dos livros alugados
select b.titulo,b.descricao,a.status from tbl_titulo b INNER JOIN tbl_livros a ON b.codigo_titulo = a.codigo_titulo WHERE status = 'ALUGADO';
--Liste os nomes dos clientes que não têm livros alugados
select a.nome,c.status from tbl_cliente a INNER JOIN tbl_emprestimo b ON b.codigo_cliente = a.codigo_cliente
INNER JOIN tbl_livros c ON b.codigo_cliente = c.cod_livro WHERE status = 'DISPONIVEL';
--Liste os títulos e suas categorias dos livros disponiveis
select a.titulo,a.categoria,b.status from tbl_titulo a INNER JOIN tbl_livros b ON a.codigo_titulo = b.codigo_titulo WHERE status = 'DISPONIVEL';
--Liste os nomes dos clientes e os títulos dos livros que eles têm alugados
select a.nome,d.titulo,c.status from tbl_cliente a INNER JOIN tbl_emprestimo b ON a.codigo_cliente = b.codigo_cliente
INNER JOIN tbl_livros c ON c.cod_livro = b.codigo_livro
INNER JOIN tbl_titulo d ON c.codigo_titulo = d.codigo_titulo WHERE status = 'ALUGADO'
--Retorne o nome, titulo do livro e o status do esmprestimo do livro alugado pela Ana Oliveira
