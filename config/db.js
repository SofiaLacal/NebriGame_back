const {Sequelize} = require("sequelize");

const sequelize = new Sequelize(
  'nebrigame', 
  'root', 
  '', 
  {
    host: 'localhost',
    dialect: 'mysql'
  }
);

sequelize.authenticate()

  .then(() => {
    console.log('Conexión establecida correctamente')

  }).catch((error) => {
    console.log('Error al conectar a la BD: ', error)

  });


module.exports = sequelize;