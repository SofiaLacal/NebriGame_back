const sequelize = require('../config/db');

// Importar todos los modelos
const Producto = require('./Producto');
const Juego = require('./Juego');
const Consola = require('./Consola');
const Merchandising = require('./Merchandising');
const Plataforma = require('./Plataforma');
const Usuario = require('./Usuario');
const Carrito = require('./Carrito');
const Wishlist = require('./Wishlist');
const MetodoPago = require('./MetodoPago');
const Pedido = require('./Pedido');
const PedidoProducto = require('./PedidoProducto');

// ========================================
// RELACIONES PRODUCTO -> JUEGO/CONSOLA/MERCHANDISING
// ========================================
Producto.hasOne(Juego, { foreignKey: 'producto_id' });
Juego.belongsTo(Producto, { foreignKey: 'producto_id' });

Producto.hasOne(Consola, { foreignKey: 'producto_id' });
Consola.belongsTo(Producto, { foreignKey: 'producto_id' });

Producto.hasOne(Merchandising, { foreignKey: 'producto_id' });
Merchandising.belongsTo(Producto, { foreignKey: 'producto_id' });

// ========================================
// RELACIONES CON PLATAFORMA
// ========================================
Juego.belongsTo(Plataforma, { foreignKey: 'plataforma_id' });
Plataforma.hasMany(Juego, { foreignKey: 'plataforma_id' });

Consola.belongsTo(Plataforma, { foreignKey: 'plataforma_id' });
Plataforma.hasMany(Consola, { foreignKey: 'plataforma_id' });

// ========================================
// RELACIONES USUARIO -> CARRITO
// ========================================
Usuario.hasMany(Carrito, { foreignKey: 'usuario_id' });
Carrito.belongsTo(Usuario, { foreignKey: 'usuario_id' });

Producto.hasMany(Carrito, { foreignKey: 'producto_id' });
Carrito.belongsTo(Producto, { foreignKey: 'producto_id' });

// ========================================
// RELACIONES USUARIO -> WISHLIST
// ========================================
Usuario.hasMany(Wishlist, { foreignKey: 'usuario_id' });
Wishlist.belongsTo(Usuario, { foreignKey: 'usuario_id' });

Producto.hasMany(Wishlist, { foreignKey: 'producto_id' });
Wishlist.belongsTo(Producto, { foreignKey: 'producto_id' });

// ========================================
// RELACIONES USUARIO -> MÉTODO DE PAGO
// ========================================
Usuario.hasMany(MetodoPago, { foreignKey: 'usuario_id' });
MetodoPago.belongsTo(Usuario, { foreignKey: 'usuario_id' });

// ========================================
// RELACIONES PEDIDOS
// ========================================
Usuario.hasMany(Pedido, { foreignKey: 'usuario_id' });
Pedido.belongsTo(Usuario, { foreignKey: 'usuario_id' });

MetodoPago.hasMany(Pedido, { foreignKey: 'metodo_pago_id' });
Pedido.belongsTo(MetodoPago, { foreignKey: 'metodo_pago_id' });

// Relación muchos a muchos: Pedido <-> Producto (a través de PedidoProducto)
Pedido.belongsToMany(Producto, { 
    through: PedidoProducto, 
    foreignKey: 'pedido_id',
    otherKey: 'producto_id'
});

Producto.belongsToMany(Pedido, { 
    through: PedidoProducto, 
    foreignKey: 'producto_id',
    otherKey: 'pedido_id'
});

// Relaciones directas con la tabla intermedia
Pedido.hasMany(PedidoProducto, { foreignKey: 'pedido_id' });
PedidoProducto.belongsTo(Pedido, { foreignKey: 'pedido_id' });

Producto.hasMany(PedidoProducto, { foreignKey: 'producto_id' });
PedidoProducto.belongsTo(Producto, { foreignKey: 'producto_id' });

// ========================================
// EXPORTAR TODOS LOS MODELOS
// ========================================
module.exports = {
    sequelize,
    Producto,
    Juego,
    Consola,
    Merchandising,
    Plataforma,
    Usuario,
    Carrito,
    Wishlist,
    MetodoPago,
    Pedido,
    PedidoProducto
};