
-- Inserts para a tabela estudantes
INSERT INTO estudantes (nome, matricula, email) VALUES ('Ana Silva', '2021001', 'ana.silva@ifal.edu.br');
INSERT INTO estudantes (nome, matricula, email) VALUES ('Carlos Souza', '2021002', 'carlos.souza@ifal.edu.br');
INSERT INTO estudantes (nome, matricula, email) VALUES ('Maria Oliveira', '2021003', 'maria.oliveira@ifal.edu.br');

-- Inserts para a tabela livros
INSERT INTO livros (titulo, autor, isbn) VALUES ('Introdução à Programação', 'João Pereira', 'ISBN001');
INSERT INTO livros (titulo, autor, isbn) VALUES ('Banco de Dados', 'Fernanda Lima', 'ISBN002');
INSERT INTO livros (titulo, autor, isbn) VALUES ('Engenharia de Software', 'Carlos Ribeiro', 'ISBN003');

-- Inserts para a tabela exemplares
INSERT INTO exemplares (patrimonio, FK_livro_isbn) VALUES ('PAT001', 'ISBN001');
INSERT INTO exemplares (patrimonio, FK_livro_isbn) VALUES ('PAT002', 'ISBN001');
INSERT INTO exemplares (patrimonio, FK_livro_isbn) VALUES ('PAT003', 'ISBN002');

-- Inserts para a tabela estudantes_exemplares
INSERT INTO estudantes_exemplares (FK_estudantes_matricula, FK_exemplares_patrimonio, dt_reserva, prazo)
VALUES ('2021001', 'PAT001', '2025-07-01', 7);
INSERT INTO estudantes_exemplares (FK_estudantes_matricula, FK_exemplares_patrimonio, dt_reserva, prazo)
VALUES ('2021002', 'PAT002', '2025-07-02', 10);
INSERT INTO estudantes_exemplares (FK_estudantes_matricula, FK_exemplares_patrimonio, dt_reserva, prazo)
VALUES ('2021003', 'PAT003', '2025-07-03', 5);

-- Inserts para a tabela cartoes
INSERT INTO cartoes (FK_estudantes_matricula) VALUES ('2021001');
INSERT INTO cartoes (FK_estudantes_matricula) VALUES ('2021002');
INSERT INTO cartoes (FK_estudantes_matricula) VALUES ('2021003');
