// ============================================
// MODELO: DIRECCIÓN
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Direccion = sequelize.define('Direccion', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  usuario_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'usuarios',
      key: 'id'
    }
  },
  calle: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  numero_casa: {
    type: DataTypes.STRING(20),
    allowNull: false
  },
  ciudad: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  codigo_postal: {
    type: DataTypes.STRING(10),
    allowNull: false
  },
  region: {
    type: DataTypes.STRING(20),
    allowNull: false,
    defaultValue: 'peninsula'
  },
  telefono_contacto: {
    type: DataTypes.STRING(20),
    allowNull: false
  }
}, {
  tableName: 'direcciones',
  timestamps: false,
  indexes: [
    { fields: ['usuario_id'] }
  ]
});

module.exports = Direccion;
