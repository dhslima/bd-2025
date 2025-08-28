-- Quantidade de alunos por cidade
SELECT cidade, COUNT(*) FROM alunos GROUP BY cidade ORDER BY cidade;

-- Quantidade de cursos por área
SELECT area, COUNT(*) AS qntd FROM cursos GROUP BY area ORDER BY area;

-- Número de matrículas por status
SELECT status, COUNT(*) AS qntd FROM matriculas GROUP BY status ORDER BY status;

-- Média das notas por tipo de avaliação
SELECT tipo, AVG(nota) AS media FROM avaliacoes GROUP BY tipo ORDER BY media DESC;

-- Média de notas por matrícula
SELECT FK_matricula_id AS matricula, ROUND(AVG(nota),2) AS media FROM avaliacoes GROUP BY FK_matricula_id ORDER BY FK_matricula_id;

-- HAVING
-- Cidades com pelo menos 2 alunos
SELECT cidade, COUNT(*) AS qntd FROM alunos GROUP BY cidade HAVING COUNT(*) >= 2 ORDER BY cidade;

-- Cursos que tiveram mais de 1 turma em 2025
SELECT titulo FROM cursos WHERE id IN (SELECT DISTINCT FK_curso_id FROM turmas WHERE ano = 2025 GROUP BY FK_curso_id HAVING COUNT(*) > 1) ORDER BY titulo;

-- Turmas com pelo menos 3 matrículas

-- Matrículas com média >= 8.0

-- Alunos com pelo menos 2 matrículas

-- Tipos de avaliação com média >= 7.5
SELECT tipo, ROUND(AVG(nota),2) AS media FROM avaliacoes GROUP BY tipo HAVING AVG(nota) >= 7.5 ORDER BY media DESC;






































-- SELECT coluna1, coluna2, ..., função_agregada(colunaX) FROM tabela WHERE condição GROUP BY coluna1, coluna2, ... HAVING condição_agregada ORDER BY coluna1;