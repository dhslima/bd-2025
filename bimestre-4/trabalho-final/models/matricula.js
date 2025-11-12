// models/matricula.js
import { DataTypes, Model } from "sequelize";

export default (sequelize) => {
  class Matricula extends Model {
    static associate(models) {
      // Matricula pertence a um aluno
      Matricula.belongsTo(models.Aluno, {
        foreignKey: "FK_aluno_id",
        as: "aluno",
      });

      // Matricula pertence a uma turma
      Matricula.belongsTo(models.Turma, {
        foreignKey: "FK_turma_id",
        as: "turma",
      });
    }
  }

  Matricula.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      FK_aluno_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: { model: "alunos", key: "id" },
      },
      FK_turma_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: { model: "turmas", key: "id" },
      },
    },
    {
      sequelize,
      modelName: "Matricula",
      tableName: "matriculas",
      timestamps: false,
    }
  );

  return Matricula;
};
