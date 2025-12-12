// ============================================
// MODELO: MÉTODO DE PAGO
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const MetodoPago = sequelize.define('MetodoPago', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  tipo: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  detalles: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  usuario_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'usuarios',
      key: 'id'
    }
  },
  fecha_creacion: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'metodo_pago',
  timestamps: false
});

module.exports = MetodoPago;