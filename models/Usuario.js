const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Usuario = sequelize.define('Usuario', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique: true
    },
    apellido1: {
        type: DataTypes.STRING(50),
        allowNull: false
    },
    apellido2: {
        type: DataTypes.STRING(50),
        allowNull: true
    },
    DNI: {
        type: DataTypes.STRING(9),
        allowNull: false,
        unique: true
    },
    email: {
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true
    },
    contrasenna: {
        type: DataTypes.STRING(255),
        allowNull: false
    }
}, {
    tableName: 'usuarios',
    timestamps: false
});

module.exports = Usuario;