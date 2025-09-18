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

-- Média de notas por aluno
SELECT al.nome, ROUND(AVG(a.nota),2) AS Notas FROM avaliacoes a INNER JOIN matriculas m ON a.FK_matricula_id = m.id INNER JOIN alunos al ON al.id = m.FK_aluno_id GROUP BY al.id ORDER BY al.nome;

-- Maior nota obtida em cada curso
SELECT c.titulo, MAX(a.nota) FROM avaliacoes a INNER JOIN matriculas m ON a.FK_matricula_id = m.id INNER JOIN turmas t ON m.FK_turma_id = t.id INNER JOIN cursos c ON t.FK_curso_id = c.id GROUP BY c.id ORDER BY c.titulo;

-- Alunos com média >= 8.0 considerando todas as suas avaliações
SELECT a.nome, ROUND(AVG(av.nota),2) AS Media FROM alunos a INNER JOIN matriculas m ON a.id = m.FK_aluno_id INNER JOIN avaliacoes av ON m.id = av.FK_matricula_id GROUP BY a.id HAVING AVG(av.nota) >= 8 ORDER BY a.nome;

-- Cursos com média geral >= 7.5 e pelo menos 5 avaliações lançadas

-- Turmas de 2025 com ao menos 3 matrículas ativas

-- Alunos com pelo menos 2 matrículas em cursos da área "Dados"

-- Cidades com média de notas >= 7.0 (todas as avaliações dos alunos da cidade)