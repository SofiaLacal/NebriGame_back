// ============================================
// MODELO: CONSOLA (Especialización)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Consola = sequelize.define('Consola', {
  producto_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    references: {
      model: 'productos',
      key: 'id'
    }
  },
  capacidad_almacenamiento: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  color: {
    type: DataTypes.STRING(50),
    allowNull: true
  },
  fabricante: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  plataforma_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'plataforma',
      key: 'id'
    }
  }
}, {
  tableName: 'consolas',
  timestamps: false,
  indexes: [
    { fields: ['plataforma_id'] },
    { fields: ['fabricante'] }
  ]
});

module.exports = Consola;