// ============================================
// MODELO: JUEGOS_PLATAFORMAS (Relación N:N)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

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
  fecha_lanzamiento: {
    type: DataTypes.DATEONLY,
    allowNull: true
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