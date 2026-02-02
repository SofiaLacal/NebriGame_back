// ============================================
// MODELO: USUARIO
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Usuario = sequelize.define('Usuario', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  apellido1: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  apellido2: {
    type: DataTypes.STRING(50),
    allowNull: true
  },
  email: {
    type: DataTypes.STRING(100),
    allowNull: false,
    unique: true,
    validate: {
      isEmail: true
    }
  },
  contrasenna: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  fecha_registro: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'usuarios',
  timestamps: false, // Usamos fecha_registro manual
  indexes: [
    { fields: ['email'] },
  ]
});

module.exports = Usuario;