const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Consola = sequelize.define('Consola', {
    producto_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: 'productos',
            key: 'id'
        }
    },
    nombre: {
        type: DataTypes.STRING(100),
        allowNull: true
    },
    capacidad_almacenamiento: {
        type: DataTypes.STRING(50),
        allowNull: true
    },
    color: {
        type: DataTypes.STRING(50),
        allowNull: true
    },
    fabricante: {
        type: DataTypes.STRING(100),
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
    tableName: 'consolas',
    timestamps: false
});

module.exports = Consola;