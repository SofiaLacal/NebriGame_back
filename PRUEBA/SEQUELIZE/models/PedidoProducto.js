// ============================================
// MODELO: PEDIDO_PRODUCTO (Relación N:N)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const PedidoProducto = sequelize.define('PedidoProducto', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  pedido_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'pedidos',
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
  cantidad: {
    type: DataTypes.INTEGER,
    allowNull: false,
    defaultValue: 1,
    validate: {
      min: 1
    }
  },
  precio_unitario: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    validate: {
      min: 0
    }
  },
  subtotal: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
    validate: {
      min: 0
    }
  }
}, {
  tableName: 'pedidos_productos',
  timestamps: false,
  indexes: [
    { fields: ['pedido_id'] },
    { fields: ['producto_id'] }
  ],
  hooks: {
    // Calcular subtotal automáticamente
    beforeCreate: (pedidoProducto) => {
      pedidoProducto.subtotal = pedidoProducto.cantidad * pedidoProducto.precio_unitario;
    },
    beforeUpdate: (pedidoProducto) => {
      pedidoProducto.subtotal = pedidoProducto.cantidad * pedidoProducto.precio_unitario;
    }
  }
});

module.exports = PedidoProducto;