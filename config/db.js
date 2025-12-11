const {Sequelize} = require("sequelize");

const sequelize = new Sequelize(
  'nebrigame', 
  'root', 
  '', 
  {
    host: 'localhost',
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
    console.log('Conexión establecida correctamente a NebriGame')

  }).catch((error) => {
    console.log('Error al conectar a la BD: ', error)

  });


module.exports = sequelize;