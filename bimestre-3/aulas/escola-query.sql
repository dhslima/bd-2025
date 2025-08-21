-- Liste os nomes dos alunos da cidade Recife.
SELECT nome FROM alunos WHERE cidade = 'Recife';

-- Quais cursos são da área Dados? Mostre titulo e carga_horas.
SELECT titulo, carga_horas FROM cursos WHERE area = 'Dados';

-- Nomes dos alunos matriculados em qualquer turma do curso "SQL para Iniciantes".
SELECT nome FROM alunos WHERE id IN (
SELECT FK_aluno_id FROM matriculas WHERE FK_turma_id IN (
SELECT id FROM turmas WHERE FK_curso_id = (
SELECT id FROM cursos WHERE titulo = 'SQL para Iniciantes'))) ORDER BY nome;

-- Alunos com média >= 8.0 em pelo menos uma de suas matrículas.
SELECT nome FROM alunos WHERE id IN (
SELECT FK_aluno_id FROM matriculas WHERE id IN (
SELECT DISTINCT (FK_matricula_id) FROM avaliacoes WHERE nota >= 8)) ORDER BY nome;
-- Turmas com pelo menos 5 matrículas. Mostre id.

-- O curso cuja carga_horas é maior do que a média de todas as cargas.
