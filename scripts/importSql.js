const fs = require("fs");
const path = require("path");
const mysql = require("mysql2/promise");

function loadInserts() {
  const sqlPath = path.join(__dirname, "..", "sql", "inserts-BD.sql");
  let sql = fs.readFileSync(sqlPath, "utf8");
  sql = sql.replace(/USE\s+\w+\s*;/gi, "");
  return sql.trim();
}

async function main() {
  const host = process.env.DB_HOST || process.env.MYSQLHOST;
  const port = Number(process.env.DB_PORT || process.env.MYSQLPORT || 3306);
  const user = process.env.DB_USER || process.env.MYSQLUSER;
  const password = process.env.DB_PASSWORD || process.env.MYSQLPASSWORD;
  const database = process.env.DB_NAME || process.env.MYSQLDATABASE;

  if (!host || !user || !database) {
    console.error("Faltan variables de conexión.");
    console.error({
      host: host || "(vacío)",
      port,
      user: user || "(vacío)",
      database: database || "(vacío)",
      password: password ? "(definida)" : "(vacía)",
    });
    process.exit(1);
  }

  console.log(`Conectando a ${host}:${port} / DB ${database} ...`);

  const connection = await mysql.createConnection({
    host,
    port,
    user,
    password,
    database,
    multipleStatements: true,
  });

  console.log("Insertando datos (sin recrear tablas)...");
  await connection.query(loadInserts());

  const [[{ total }]] = await connection.query(
    "SELECT COUNT(*) AS total FROM productos"
  );
  console.log(`Productos en BD: ${total}`);

  await connection.end();
  console.log("Importación completada.");
}

main().catch((err) => {
  console.error("Error importando SQL:", err.message);
  process.exit(1);
});
