-- Liste os nomes dos alunos e o ID das matrículas correspondentes.
SELECT m.id, a.nome FROM alunos a INNER JOIN matriculas m ON a.id = m.FK_aluno_id;

-- Mostre o título dos cursos e o ano das turmas.
SELECT c.titulo, t.ano FROM cursos c INNER JOIN turmas t ON c.id = t.FK_curso_id;

-- Liste os nomes dos alunos e o status de suas matrículas.

-- Mostre os IDs das matrículas e as notas obtidas em cada avaliação.
