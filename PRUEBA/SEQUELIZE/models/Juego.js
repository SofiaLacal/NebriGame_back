// ============================================
// MODELO: JUEGO (Especialización)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Juego = sequelize.define('Juego', {
  producto_id: {
    type: DataTypes.INTEGER,  
    primaryKey: true,
    references: {
      model: 'productos',
      key: 'id'
    }
  },
  genero: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  edad_minima: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
    validate: {
      min: 0,
      max: 18
    }
  }
}, {
  tableName: 'juegos',
  timestamps: false,
  indexes: [
    { fields: ['genero'] },
    { fields: ['edad_minima'] }
  ]
});

module.exports = Juego;