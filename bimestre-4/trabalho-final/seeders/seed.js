// scripts/seed.js
import db from "../models";

(async () => {
  try {
    await db.sequelize.authenticate();
    // garante que as tabelas existem
    await db.sequelize.sync();

    const [esw] = await db.Curso.findOrCreate({
      where: { titulo: "Engenharia de Software" },
      defaults: { area: "TI", carga_horas: 320 },
    });
    const [fis] = await db.Curso.findOrCreate({
      where: { titulo: "Física Geral" },
      defaults: { area: "Exatas", carga_horas: 200 },
    });

    const [t1] = await db.Turma.findOrCreate({
      where: { FK_curso_id: esw.id, ano: 2025, semestre: 1 },
    });
    const [t2] = await db.Turma.findOrCreate({
      where: { FK_curso_id: fis.id, ano: 2025, semestre: 1 },
    });

    const [a1] = await db.Aluno.findOrCreate({
      where: { nome: "Ana Souza" },
      defaults: { cidade: "Maceió", nascimento: "2005-01-10" },
    });
    const [a2] = await db.Aluno.findOrCreate({
      where: { nome: "Bruno Lima" },
      defaults: { cidade: "Rio Largo", nascimento: "2004-11-22" },
    });

    await db.Matricula.findOrCreate({
      where: { FK_aluno_id: a1.id, FK_turma_id: t1.id },
    });
    await db.Matricula.findOrCreate({
      where: { FK_aluno_id: a2.id, FK_turma_id: t2.id },
    });

    console.log("Seed concluído.");
    process.exit(0);
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
})();
