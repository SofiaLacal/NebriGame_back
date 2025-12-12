// ============================================
// MODELO: VISTA - RESUMEN PEDIDOS (Solo lectura)
// ============================================

const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const VistaResumenPedidos = sequelize.define('VistaResumenPedidos', {
  pedido_id: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  usuario_nombre: DataTypes.STRING,
  usuario_email: DataTypes.STRING,
  total: DataTypes.DECIMAL(10, 2),
  estado: DataTypes.STRING,
  fecha_pedido: DataTypes.DATE,
  total_productos: DataTypes.INTEGER,
  total_items: DataTypes.INTEGER
}, {
  tableName: 'vista_resumen_pedidos',
  timestamps: false,
  hooks: {
    beforeCreate: () => {
      throw new Error('No se puede insertar en una vista');
    },
    beforeUpdate: () => {
      throw new Error('No se puede actualizar una vista');
    },
    beforeDestroy: () => {
      throw new Error('No se puede eliminar de una vista');
    }
  }
});

module.exports = VistaResumenPedidos;