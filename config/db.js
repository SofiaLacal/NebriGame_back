const {Sequelize} = require("sequelize");

// Valores por defecto para desarrollo local si el .env está vacío o no define la clave
const dbName = process.env.DB_NAME || "nebrigame";
const dbUser = process.env.DB_USER || "root";
const dbHost = process.env.DB_HOST || "localhost";
const dbPassword = process.env.DB_PASSWORD ?? "";

const sequelize = new Sequelize(dbName, dbUser, dbPassword, {
  host: dbHost,
  dialect: "mysql",
  logging: false,
  pool: {
    max: 10,
    min: 0,
  },
}); 

sequelize.authenticate()

  .then(() => {
    console.log('Conexión establecida correctamente a la BD')

  }).catch((error) => {
    console.log('Error al conectar a la BD: ', error)

  });

module.exports = sequelize;