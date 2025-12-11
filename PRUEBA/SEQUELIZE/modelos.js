//POR SI AL FINAL QUEREMOS METER LA VISTA DE PRODUCTOS COMPLETA

// ============================================
// MODELO: VISTA - PRODUCTOS COMPLETA (Solo lectura)
// ============================================
// models/VistaProductosCompleta.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const VistaProductosCompleta = sequelize.define('VistaProductosCompleta', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true
  },
  nombre: DataTypes.STRING,
  precio: DataTypes.DECIMAL(10, 2),
  descripcion: DataTypes.TEXT,
  stock: DataTypes.INTEGER,
  tipo: DataTypes.STRING,
  imagen_url: DataTypes.STRING,
  juego_genero: DataTypes.STRING,
  juego_edad_minima: DataTypes.INTEGER,
  plataformas: DataTypes.TEXT,
  capacidad_almacenamiento: DataTypes.STRING,
  color: DataTypes.STRING,
  fabricante: DataTypes.STRING,
  consola_plataforma: DataTypes.STRING,
  categoria: DataTypes.STRING
}, {
  tableName: 'vista_productos_completa',
  timestamps: false,
  // Marcar como solo lectura
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

module.exports = VistaProductosCompleta;

