// models/turma.js
import { DataTypes, Model } from "sequelize";

export default (sequelize) => {
  class Turma extends Model {
    static associate(models) {
      // Turma pertence a um curso
      Turma.belongsTo(models.Curso, {
        foreignKey: "FK_curso_id",
        as: "curso",
      });

      // Turma tem muitas matrículas
      Turma.hasMany(models.Matricula, {
        foreignKey: "FK_turma_id",
        as: "matriculas",
      });
    }
  }

  Turma.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      FK_curso_id: {
        type: DataTypes.INTEGER,
        references: { model: "cursos", key: "id" },
      },
      ano: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      semestre: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      sequelize,
      modelName: "Turma",
      tableName: "turmas",
      timestamps: false,
    }
  );

  return Turma;
};
