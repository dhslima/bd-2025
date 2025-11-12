// models/curso.js
import { DataTypes, Model } from "sequelize";

export default (sequelize) => {
  class Curso extends Model {
    static associate(models) {
      // Curso tem muitas turmas
      Curso.hasMany(models.Turma, {
        foreignKey: "FK_curso_id",
        as: "turmas",
      });
    }
  }

  Curso.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      titulo: {
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true,
      },
      area: {
        type: DataTypes.STRING(40),
        allowNull: false,
      },
      carga_horas: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      sequelize,
      modelName: "Curso",
      tableName: "cursos",
      timestamps: false,
    }
  );

  return Curso;
};
