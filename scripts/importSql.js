const fs = require("fs");
const path = require("path");
const mysql = require("mysql2/promise");

function loadSql(fileName) {
  const sqlPath = path.join(__dirname, "..", "sql", fileName);
  let sql = fs.readFileSync(sqlPath, "utf8");

  // Evitar borrar/crear otra base en Railway; usamos la DB de la conexión
  sql = sql.replace(/DROP\s+DATABASE\s+IF\s+EXISTS\s+\w+\s*;/gi, "");
  sql = sql.replace(/CREATE\s+DATABASE\s+IF\s+NOT\s+EXISTS\s+\w+\s*;/gi, "");
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

  const schema = loadSql("nebrigame-BD.sql");
  const inserts = loadSql("inserts-BD.sql");

  console.log("Creando tablas (esquema)...");
  await connection.query(schema);

  console.log("Insertando datos...");
  await connection.query(inserts);

  const [tables] = await connection.query("SHOW TABLES");
  console.log(`Tablas en ${database}:`, tables.length);

  await connection.end();
  console.log("Importación completada.");
}

main().catch((err) => {
  console.error("Error importando SQL:", err.message);
  process.exit(1);
});
