export default {
  development: {
    username: process.env.DB_USER || "aluno.ifal",
    password: process.env.DB_PASS || "aluno.ifal",
    database: process.env.DB_NAME || "sequelize_db",
    host: process.env.DB_HOST || "localhost",
    dialect: "postgres",
    logging: false,
  },
};
