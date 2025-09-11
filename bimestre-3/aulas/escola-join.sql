-- Liste os nomes dos alunos e o ID das matrículas correspondentes.
SELECT m.id, a.nome FROM alunos a INNER JOIN matriculas m ON a.id = m.FK_aluno_id;

-- Mostre o título dos cursos e o ano das turmas.
SELECT c.titulo, t.ano FROM cursos c INNER JOIN turmas t ON c.id = t.FK_curso_id;

-- Liste os nomes dos alunos e o status de suas matrículas.
SELECT a.nome, m.status FROM alunos a INNER JOIN matriculas m ON a.id = m.FK_aluno_id ORDER BY a.nome;

-- Mostre os IDs das matrículas e as notas obtidas em cada avaliação.
SELECT m.id, a.nota FROM matriculas m INNER JOIN avaliacoes a ON m.id = a.FK_matricula_id ORDER BY m.id;

-- Nome do aluno, curso e status da matrícula
SELECT a.nome, c.titulo, m.status FROM alunos a INNER JOIN matriculas m ON a.id = m.FK_aluno_id INNER JOIN turmas t ON m.FK_turma_id = t.id INNER JOIN cursos c ON c.id = t.FK_curso_id ORDER BY a.nome;

-- Alunos que estão matriculados em cursos da área “Dados”
SELECT DISTINCT a.nome FROM alunos a INNER JOIN matriculas m ON a.id = m.FK_aluno_id INNER JOIN turmas t ON m.FK_turma_id = t.id INNER JOIN cursos c ON c.id = t.FK_curso_id WHERE c.area = 'Dados' ORDER BY a.nome;

SELECT a.nome FROM alunos a INNER JOIN cursos c ON a.id = c.id WHERE c.area = 'Dados';

-- Média de notas por aluno

-- Maior nota obtida em cada curso