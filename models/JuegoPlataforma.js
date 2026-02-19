// ============================================
// MODELO: JUEGOS_PLATAFORMAS (Relación N:N)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const JuegoPlataforma = sequelize.define('JuegoPlataforma', {
  juego_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    references: {
      model: 'juegos',
      key: 'producto_id'
    }
  },
  plataforma_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    references: {
      model: 'plataforma',
      key: 'id'
    }
  },
  control_stock: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
    validate: {
      min: 0
    }
  }
}, {
  tableName: 'juegos_plataformas',
  timestamps: false,
  indexes: [
    { fields: ['juego_id'] },
    { fields: ['plataforma_id'] }
  ]
});

module.exports = JuegoPlataforma;