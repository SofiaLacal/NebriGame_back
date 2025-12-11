// ============================================
// MODELO: PLATAFORMA
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Plataforma = sequelize.define('Plataforma', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING(100),
    allowNull: false,
    unique: true
  }
}, {
  tableName: 'plataforma',
  timestamps: false
});

module.exports = Plataforma;