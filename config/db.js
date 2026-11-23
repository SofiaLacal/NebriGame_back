const {Sequelize} = require("sequelize");

const dbName = process.env.DB_NAME;
const dbUser = process.env.DB_USER;
const dbHost = process.env.DB_HOST;
const dbPassword = process.env.DB_PASSWORD;
const dbPort = Number(process.env.DB_PORT);

const sequelize = new Sequelize(dbName, dbUser, dbPassword, {
  host: dbHost,
  port: dbPort,
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