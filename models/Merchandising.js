// ============================================
// MODELO: MERCHANDISING (Especialización)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Merchandising = sequelize.define('Merchandising', {
  producto_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    references: {
      model: 'productos',
      key: 'id'
    }
  },
  categoria: {
    type: DataTypes.STRING(50),
    allowNull: false
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
  tableName: 'merchandising',
  timestamps: false,
  indexes: [
    { fields: ['categoria'] }
  ]
});

module.exports = Merchandising;