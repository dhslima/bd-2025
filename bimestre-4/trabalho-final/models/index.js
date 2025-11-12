// models/index.js
import { Sequelize } from "sequelize";
import AlunoModel from "./aluno.js";
import CursoModel from "./curso.js";
import TurmaModel from "./turma.js";
import MatriculaModel from "./matricula.js";

// Conexão (sem dotenv)
const sequelize = new Sequelize("banco_sequelize", "postgres", "postgres", {
  host: "127.0.0.1",
  dialect: "postgres",
  logging: false,
});

// Inicializa models
const Aluno = AlunoModel(sequelize);
const Curso = CursoModel(sequelize);
const Turma = TurmaModel(sequelize);
const Matricula = MatriculaModel(sequelize);

// Associações
[Aluno, Curso, Turma, Matricula]
  .filter((m) => typeof m.associate === "function")
  .forEach((m) => m.associate({ Aluno, Curso, Turma, Matricula }));

const db = { sequelize, Sequelize, Aluno, Curso, Turma, Matricula };
export default db;
