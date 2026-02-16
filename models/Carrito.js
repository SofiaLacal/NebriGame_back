// ============================================
// MODELO: CARRITO
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Carrito = sequelize.define('Carrito', {
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
  producto_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'productos',
      key: 'id'
    }
  },
  plataforma_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0
  },
  cantidad: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 1,
    validate: {
      min: 1
    }
  },
  fecha_agregado: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'carrito',
  timestamps: false,
  indexes: [
    { unique: true, fields: ['usuario_id', 'producto_id', 'plataforma_id'] },
    { fields: ['usuario_id'] },
    { fields: ['producto_id'] }
  ]
});

module.exports = Carrito;