const sequelize = require('../config/db');
const Producto = require('./Producto');
const Juego = require('./Juego');
const Consola = require('./Consola');
const Merchandising = require('./Merchandising');
const Plataforma = require('./Plataforma');
const Usuario = require('./Usuario');

// Relaciones Producto -> Juego/Consola/Merchandising
Producto.hasOne(Juego, { foreignKey: 'producto_id' });
Juego.belongsTo(Producto, { foreignKey: 'producto_id' });

Producto.hasOne(Consola, { foreignKey: 'producto_id' });
Consola.belongsTo(Producto, { foreignKey: 'producto_id' });

Producto.hasOne(Merchandising, { foreignKey: 'producto_id' });
Merchandising.belongsTo(Producto, { foreignKey: 'producto_id' });

// Relaciones con Plataforma
Juego.belongsTo(Plataforma, { foreignKey: 'plataforma_id' });
Plataforma.hasMany(Juego, { foreignKey: 'plataforma_id' });

Consola.belongsTo(Plataforma, { foreignKey: 'plataforma_id' });
Plataforma.hasMany(Consola, { foreignKey: 'plataforma_id' });

module.exports = {
    sequelize,
    Producto,
    Juego,
    Consola,
    Merchandising,
    Plataforma,
    Usuario
};