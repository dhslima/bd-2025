// models/aluno.js
import { DataTypes, Model } from "sequelize";

export default (sequelize) => {
  class Aluno extends Model {
    static associate(models) {
      // Aluno tem muitas matrículas
      Aluno.hasMany(models.Matricula, {
        foreignKey: "FK_aluno_id",
        as: "matriculas",
      });
    }
  }

  Aluno.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      nome: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      cidade: {
        type: DataTypes.STRING(60),
        allowNull: false,
      },
      nascimento: {
        type: DataTypes.DATEONLY,
        allowNull: false,
      },
    },
    {
      sequelize,
      modelName: "Aluno",
      tableName: "alunos",
      timestamps: false,
    }
  );

  return Aluno;
};
