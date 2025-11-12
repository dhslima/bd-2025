// src/server.js
import express from "express";
import db from "./models/index.js";

const app = express();
app.use(express.json());

// rotas de teste
app.get("/health", (req, res) => res.json({ ok: true }));

app.get("/alunos", async (req, res) => {
  const alunos = await db.Aluno.findAll({ include: "matriculas" });
  res.json(alunos);
});

app.get("/cursos", async (req, res) => {
  const cursos = await db.Curso.findAll({ include: "turmas" });
  res.json(cursos);
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, async () => {
  try {
    await db.sequelize.authenticate();
    // Escolha UM dos dois:
    // 1) Cria/atualiza tabelas sem perder dados:
    await db.sequelize.sync({ alter: true });
    // 2) (Alternativa) Reset total do schema (DROPA E RECRIA):
    // await db.sequelize.sync({ force: true });

    console.log(`API rodando em http://localhost:${PORT}`);
  } catch (err) {
    console.error("Erro ao inicializar:", err.message);
  }
});
