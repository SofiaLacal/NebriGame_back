const {Sequelize} = require("sequelize");

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  { host: process.env.DB_HOST,
    dialect: 'mysql',
    logging: false,
    pool: {  
      max: 10,  // Máximo de conexiones simultáneas 
      min: 0    // Mínimo de conexiones siempre abiertas
    }
   }
); 

sequelize.authenticate()

  .then(() => {
    console.log('Conexión establecida correctamente a la BD')

  }).catch((error) => {
    console.log('Error al conectar a la BD: ', error)

  });

module.exports = sequelize;