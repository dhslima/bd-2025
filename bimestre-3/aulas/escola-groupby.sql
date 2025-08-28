-- Quantidade de alunos por cidade
SELECT cidade, COUNT(*) FROM alunos GROUP BY cidade ORDER BY cidade;
SELECT * FROM alunos ORDER BY cidade;

-- Quantidade de cursos por área


-- Número de matrículas por status
-- Média das notas por tipo de avaliação
-- Média de notas por matrícula

-- SELECT coluna1, coluna2, ..., função_agregada(colunaX) FROM tabela WHERE condição GROUP BY coluna1, coluna2, ... HAVING condição_agregada ORDER BY coluna1;