// ============================================
// MODELO: PRODUCTO (Tabla base)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Producto = sequelize.define('Producto', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  nombre: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  precio: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    validate: {
      min: 0
    }
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  stock: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 0,
    validate: {
      min: 0
    }
  },
  tipo: {
    type: DataTypes.ENUM('merchandising', 'juego', 'consola'),
    allowNull: false
  },
  imagen_url: {
    type: DataTypes.STRING(255),
    allowNull: true
  },
  fecha_creacion: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'productos',
  timestamps: false,
  indexes: [
    { fields: ['tipo'] },
    { fields: ['precio'] },
    { fields: ['nombre'] },
    { fields: ['stock'] },
    { fields: ['tipo', 'stock'] }
  ]
});

module.exports = Producto;