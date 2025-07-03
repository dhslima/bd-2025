
-- SELECTS COM WHERE SIMPLES

-- Seleciona todos os dados do estudante com matrícula '2021001'
SELECT * FROM estudantes
WHERE matricula = '2021001';

-- Seleciona livros do autor 'Fernanda Lima'
SELECT * FROM livros
WHERE autor = 'Fernanda Lima';

-- Seleciona exemplares do livro com ISBN 'ISBN001'
SELECT * FROM exemplares
WHERE FK_livro_isbn = 'ISBN001';

-- Seleciona reservas com prazo superior a 7 dias
SELECT * FROM estudantes_exemplares
WHERE prazo > 7;

-- Seleciona cartões emitidos em uma data específica
SELECT * FROM cartoes
WHERE dt_emissao = '2025-07-03';


-- SELECTS COM LIKE E SELEÇÃO DE COLUNAS ESPECÍFICAS

-- Buscar estudantes com nome começando por "Ma"
SELECT nome, email FROM estudantes
WHERE nome LIKE 'Ma%';

-- Buscar livros cujo título contenha "Dados"
SELECT titulo, autor FROM livros
WHERE titulo LIKE '%Dados%';

-- Selecionar exemplares cujo patrimônio comece com "PAT00"
SELECT patrimonio FROM exemplares
WHERE patrimonio LIKE 'PAT00%';

-- Buscar reservas com data de reserva no mês de julho
SELECT FK_estudantes_matricula, dt_reserva FROM estudantes_exemplares
WHERE dt_reserva LIKE '2025-07-%';

-- Selecionar número e matrícula dos cartões emitidos em 2025
SELECT num, FK_estudantes_matricula FROM cartoes
WHERE dt_emissao LIKE '2025%';
