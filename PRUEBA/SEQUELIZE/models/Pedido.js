// ============================================
// MODELO: PEDIDO
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Pedido = sequelize.define('Pedido', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  usuario_id: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'usuarios',
      key: 'id'
    }
  },
  metodo_pago_id: {
    type: DataTypes.INTEGER,
    allowNull: true,
    references: {
      model: 'metodo_pago',
      key: 'id'
    }
  },
  total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    validate: {
      min: 0
    }
  },
  estado: {
    type: DataTypes.ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado'),
    allowNull: false,
    defaultValue: 'pendiente'
  },
  fecha_pedido: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  fecha_actualizacion: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  direccion_envio: {
    type: DataTypes.STRING(255),
    allowNull: false
  },
  codigo_postal: {
    type: DataTypes.STRING(10),
    allowNull: true
  },
  ciudad: {
    type: DataTypes.STRING(100),
    allowNull: true
  },
  telefono_contacto: {
    type: DataTypes.STRING(20),
    allowNull: false
  },
  notas: {
    type: DataTypes.TEXT,
    allowNull: true
  }
}, {
  tableName: 'pedidos',
  timestamps: false,
  indexes: [
    { fields: ['usuario_id'] },
    { fields: ['estado'] },
    { fields: ['fecha_pedido'] },
    { fields: ['usuario_id', 'estado'] },
    { fields: ['fecha_pedido', 'estado'] }
  ]
});

module.exports = Pedido;