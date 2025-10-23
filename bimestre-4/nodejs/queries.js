import { query, pool } from "./db.js";

async function selectBasico() {
  console.log("1) SELECT * FROM alunos LIMIT 5;");
  const r = await query(`SELECT * FROM alunos ORDER BY id LIMIT 5;`);
  console.table(r.rows);
}

async function filtroComParametro() {
  console.log("\n2) Alunos por cidade (parâmetro $1) — ex.: 'Maceió'");
  const cidade = "Maceió";
  const r = await query(
    `SELECT id, nome, cidade, nascimento
       FROM alunos
      WHERE cidade = $1
      ORDER BY nome;`,
    [cidade]
  );
  console.table(r.rows);
}

async function join1N_TurmasCurso() {
  console.log("\n3) JOIN 1-N: turmas → cursos (curso de cada turma)");
  const r = await query(
    `SELECT t.id   AS turma_id,
            c.titulo AS curso,
            t.ano, t.semestre
       FROM turmas t
       JOIN cursos c ON c.id = t.fk_curso_id
      ORDER BY t.ano, t.semestre, c.titulo;`
  );
  console.table(r.rows);
}

async function joinNM_MatriculasDetalhe() {
  console.log("\n4) JOIN N-M: matriculas com aluno, turma e curso");
  const r = await query(
    `SELECT m.id        AS matricula_id,
            a.nome      AS aluno,
            c.titulo    AS curso,
            t.ano, t.semestre,
            m.data, m.status
       FROM matriculas m
       JOIN alunos a  ON a.id = m.fk_aluno_id
       JOIN turmas t  ON t.id = m.fk_turma_id
       JOIN cursos c  ON c.id = t.fk_curso_id
      ORDER BY a.nome, c.titulo;`
  );
  console.table(r.rows);
}

async function notasPorMatricula() {
  console.log("\n5) Notas por matrícula (avaliacoes)");
  const r = await query(
    `SELECT m.id            AS matricula_id,
            a.nome          AS aluno,
            c.titulo        AS curso,
            av.tipo, av.nota
       FROM avaliacoes av
       JOIN matriculas m ON m.id = av.fk_matricula_id
       JOIN alunos a     ON a.id = m.fk_aluno_id
       JOIN turmas t     ON t.id = m.fk_turma_id
       JOIN cursos c     ON c.id = t.fk_curso_id
      ORDER BY m.id, av.tipo;`
  );
  console.table(r.rows.slice(0, 15));
}

async function mediaPorAluno() {
  console.log("\n6) Média por aluno (todas as avaliações de cada matrícula)");
  const r = await query(
    `SELECT a.id,
            a.nome,
            ROUND(AVG(av.nota)::numeric, 2) AS media_geral
       FROM alunos a
       JOIN matriculas m ON m.fk_aluno_id = a.id
       JOIN avaliacoes av ON av.fk_matricula_id = m.id
      GROUP BY a.id, a.nome
      ORDER BY media_geral DESC, a.nome;`
  );
  console.table(r.rows);
}

async function mediaPorCurso() {
  console.log("\n7) Média por curso");
  const r = await query(
    `SELECT c.titulo,
            ROUND(AVG(av.nota)::numeric, 2) AS media
       FROM cursos c
       JOIN turmas t      ON t.fk_curso_id = c.id
       JOIN matriculas m  ON m.fk_turma_id = t.id
       JOIN avaliacoes av ON av.fk_matricula_id = m.id
      GROUP BY c.titulo
      ORDER BY media DESC, c.titulo;`
  );
  console.table(r.rows);
}

async function rankingTop5Alunos() {
  console.log("\n8) TOP 5 alunos por média geral");
  const r = await query(
    `SELECT a.nome,
            ROUND(AVG(av.nota)::numeric, 2) AS media
       FROM alunos a
       JOIN matriculas m  ON m.fk_aluno_id = a.id
       JOIN avaliacoes av ON av.fk_matricula_id = m.id
      GROUP BY a.nome
      ORDER BY media DESC, a.nome
      LIMIT 5;`
  );
  console.table(r.rows);
}

async function matriculasAtivasPorSemestre() {
  console.log("\n9) Matrículas ATIVAS por ano/semestre");
  const r = await query(
    `SELECT t.ano,
            t.semestre,
            COUNT(*) FILTER (WHERE m.status ILIKE 'ativa') AS ativas
       FROM turmas t
       JOIN matriculas m ON m.fk_turma_id = t.id
      GROUP BY t.ano, t.semestre
      ORDER BY t.ano, t.semestre;`
  );
  console.table(r.rows);
}

async function run() {
  console.log(
    "🚀 Demonstrações — seu esquema (alunos, cursos, turmas, matriculas, avaliacoes)\n"
  );

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
  console.log("\n🏁 Fim!");
}

run().catch((err) => {
  console.error("❌ Erro geral:", err);
  pool.end();
});
