// ============================================
// MODELO: WISHLIST
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Wishlist = sequelize.define('Wishlist', {
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
  fecha_agregado: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'wishlist',
  timestamps: false,
  indexes: [
    { unique: true, fields: ['usuario_id', 'producto_id'] },
    { fields: ['usuario_id'] },
    { fields: ['producto_id'] }
  ]
});

module.exports = Wishlist;