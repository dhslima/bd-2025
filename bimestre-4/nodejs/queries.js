import { pool } from "./db.js";

// node queries.js

async function selectBasico() {
  console.log("1) SELECT * FROM alunos LIMIT 5;");
  const r = await pool.query(`SELECT * FROM alunos ORDER BY id LIMIT 5;`);
  console.table(r.rows);
}

async function filtroComParametro() {
  console.log("\n2) Alunos por cidade (parâmetro $1) — ex.: 'Maceió'");
  const cidade = "Maceió";
  const r = await pool.query(
    `SELECT id, nome, cidade, nascimento
       FROM alunos
      WHERE cidade = $1
      ORDER BY nome;`,
    [cidade]
  );
  console.table(r.rows);
}

async function join1N_TurmasCurso() {
  console.log("\n3) JOIN 1-N: turmas → cursos");
  const r = await pool.query(`
    SELECT t.*, c.* FROM turmas t
    INNER JOIN cursos c ON t.fk_curso_id = c.id
    ORDER BY t.id
    `);
  console.table(r.rows);
}

async function joinNM_MatriculasDetalhe() {
  console.log("\n4) JOIN N-M: matriculas com aluno, turma e curso");
  const r = await pool.query(`
    SELECT a.nome AS aluno, c.titulo AS curso, c.area AS area, t.ano AS ano, t.semestre AS semestre FROM alunos a 
    INNER JOIN matriculas m ON a.id = m.fk_aluno_id
    INNER JOIN turmas t ON m.fk_turma_id = t.id
    INNER JOIN cursos c ON t.fk_curso_id = c.id
    ORDER BY a.nome
    `);
  console.table(r.rows);
}

async function notasPorMatricula() {
  console.log("\n5) Notas por matrícula (avaliacoes)");
  const r = await pool.query(
    `SELECT a.nome AS aluno, av.nota AS nota, av.tipo AS tipo , c.titulo AS curso
    FROM avaliacoes av INNER JOIN matriculas m ON av.fk_matricula_id = m.id 
    INNER JOIN alunos a ON m.fk_aluno_id = a.id 
    INNER JOIN turmas t ON m.fk_turma_id = t.id
    INNER JOIN cursos c ON t.fk_curso_id = c.id
    ORDER BY a.nome, c.titulo, av.tipo;`
  );
  console.table(r.rows);
}

async function mediaPorAluno() {
  console.log("\n6) Média por aluno");
}

async function mediaPorCurso() {
  console.log("\n7) Média por curso");
}

async function rankingTop5Alunos() {
  console.log("\n8) TOP 5 alunos por média geral");
}

async function matriculasAtivasPorSemestre() {
  console.log("\n9) Matrículas ATIVAS por ano /semestre");
}

async function run() {
  await selectBasico();
  await filtroComParametro();
  await join1N_TurmasCurso();
  await joinNM_MatriculasDetalhe();
  await notasPorMatricula();
  await mediaPorAluno();
  await mediaPorCurso();
  await rankingTop5Alunos();
  await matriculasAtivasPorSemestre();

  await pool.end();
}

run().catch((err) => {
  console.error("Erro geral:", err);
  pool.end();
});
