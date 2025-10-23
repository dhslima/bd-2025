import { query, pool } from "./db.js";

try {
  const res = await query("SELECT NOW() as hora_servidor;");
  console.log("✅ Conectado com sucesso:", res.rows[0]);
} catch (err) {
  console.error("❌ Erro na conexão:", err.message);
} finally {
  await pool.end();
}
