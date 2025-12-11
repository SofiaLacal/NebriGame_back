// ============================================
// ARCHIVO DE ASOCIACIONES Y SETUP
// ============================================

const sequelize = require('../config/database');

// Importar todos los modelos
const Usuario = require('./Usuario');
const MetodoPago = require('./MetodoPago');
const Plataforma = require('./Plataforma');
const Producto = require('./Producto');
const Juego = require('./Juego');
const Consola = require('./Consola');
const Merchandising = require('./Merchandising');
const JuegoPlataforma = require('./JuegoPlataforma');
const Carrito = require('./Carrito');
const Wishlist = require('./Wishlist');
const Pedido = require('./Pedido');
const PedidoProducto = require('./PedidoProducto');
/* const VistaProductosCompleta = require('./VistaProductosCompleta'); */
const VistaResumenPedidos = require('./VistaResumenPedidos');


// ============================================
// DEFINIR TODAS LAS ASOCIACIONES
// ============================================

// Usuario - MetodoPago (1:N)
Usuario.hasMany(MetodoPago, {
  foreignKey: 'usuario_id',
  as: 'metodosPago'
});
MetodoPago.belongsTo(Usuario, {
  foreignKey: 'usuario_id',
  as: 'usuario'
});

// Usuario - Carrito (1:N)
Usuario.hasMany(Carrito, {
  foreignKey: 'usuario_id',
  as: 'carrito'
});
Carrito.belongsTo(Usuario, {
  foreignKey: 'usuario_id',
  as: 'usuario'
});

// Usuario - Wishlist (1:N)
Usuario.hasMany(Wishlist, {
  foreignKey: 'usuario_id',
  as: 'wishlist'
});
Wishlist.belongsTo(Usuario, {
  foreignKey: 'usuario_id',
  as: 'usuario'
});

// Usuario - Pedidos (1:N)
Usuario.hasMany(Pedido, {
  foreignKey: 'usuario_id',
  as: 'pedidos'
});
Pedido.belongsTo(Usuario, {
  foreignKey: 'usuario_id',
  as: 'usuario'
});

// Pedido - MetodoPago (N:1)
Pedido.belongsTo(MetodoPago, {
  foreignKey: 'metodo_pago_id',
  as: 'metodoPago'
});

// Producto - Carrito (1:N)
Producto.hasMany(Carrito, {
  foreignKey: 'producto_id',
  as: 'enCarritos'
});
Carrito.belongsTo(Producto, {
  foreignKey: 'producto_id',
  as: 'producto'
});

// Producto - Wishlist (1:N)
Producto.hasMany(Wishlist, {
  foreignKey: 'producto_id',
  as: 'enWishlists'
});
Wishlist.belongsTo(Producto, {
  foreignKey: 'producto_id',
  as: 'producto'
});

// Producto - Especialización (1:1)
Producto.hasOne(Juego, {
  foreignKey: 'producto_id',
  as: 'juego'
});
Juego.belongsTo(Producto, {
  foreignKey: 'producto_id',
  as: 'producto'
});

Producto.hasOne(Consola, {
  foreignKey: 'producto_id',
  as: 'consola'
});
Consola.belongsTo(Producto, {
  foreignKey: 'producto_id',
  as: 'producto'
});

Producto.hasOne(Merchandising, {
  foreignKey: 'producto_id',
  as: 'merchandising'
});
Merchandising.belongsTo(Producto, {
  foreignKey: 'producto_id',
  as: 'producto'
});

// Consola - Plataforma (N:1)
Consola.belongsTo(Plataforma, {
  foreignKey: 'plataforma_id',
  as: 'plataforma'
});
Plataforma.hasMany(Consola, {
  foreignKey: 'plataforma_id',
  as: 'consolas'
});

// Juego - Plataforma (N:N) a través de JuegoPlataforma
Juego.belongsToMany(Plataforma, {
  through: JuegoPlataforma,
  foreignKey: 'juego_id',
  otherKey: 'plataforma_id',
  as: 'plataformas'
});
Plataforma.belongsToMany(Juego, {
  through: JuegoPlataforma,
  foreignKey: 'plataforma_id',
  otherKey: 'juego_id',
  as: 'juegos'
});

// Pedido - Producto (N:N) a través de PedidoProducto
Pedido.belongsToMany(Producto, {
  through: PedidoProducto,
  foreignKey: 'pedido_id',
  otherKey: 'producto_id',
  as: 'productos'
});
Producto.belongsToMany(Pedido, {
  through: PedidoProducto,
  foreignKey: 'producto_id',
  otherKey: 'pedido_id',
  as: 'pedidos'
});

// Acceso directo a la tabla intermedia
Pedido.hasMany(PedidoProducto, {
  foreignKey: 'pedido_id',
  as: 'detalles'
});
PedidoProducto.belongsTo(Pedido, {
  foreignKey: 'pedido_id',
  as: 'pedido'
});

PedidoProducto.belongsTo(Producto, {
  foreignKey: 'producto_id',
  as: 'producto'
});

// ============================================
// EXPORTAR TODO
// ============================================

module.exports = {
  sequelize,
  Usuario,
  MetodoPago,
  Plataforma,
  Producto,
  Juego,
  Consola,
  Merchandising,
  JuegoPlataforma,
  Carrito,
  Wishlist,
  Pedido,
  PedidoProducto,
  VistaProductosCompleta,
  VistaResumenPedidos
};