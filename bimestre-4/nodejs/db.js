// db.js
import pg from "pg";
const { Pool } = pg;

export const pool = new Pool({
  host: "ep-rapid-sea-acxua5ps-pooler.sa-east-1.aws.neon.tech", // ajuste para o seu host
  port: 5432, // porta do seu PG
  user: "neondb_owner", // seu usuário
  password: "npg_yEfiY3xjQ6qo", // sua senha
  database: "neondb", // << NOME DO SEU BANCO
  max: 10, // conexões no pool
  idleTimeoutMillis: 10000, // fecha conexões ociosas após 10 segundos
  ssl: {
    rejectUnauthorized: false, // permite certificado do servidor Neon
  },
});
