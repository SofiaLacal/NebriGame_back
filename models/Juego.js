const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Juego = sequelize.define('Juego', {
    producto_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: 'productos',
            key: 'id'
        }
    },
    genero: {
        type: DataTypes.STRING(50),
        allowNull: true
    },
    edad_minima: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    plataforma_id: {
        type: DataTypes.INTEGER,
        references: {
            model: 'plataforma',
            key: 'id'
        }
    }
}, {
    tableName: 'juegos',
    timestamps: false
});

module.exports = Juego;