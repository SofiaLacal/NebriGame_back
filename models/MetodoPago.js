const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const MetodoPago = sequelize.define('MetodoPago', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    tipo: {
        type: DataTypes.STRING(50),
        allowNull: false
    },
    detalles: {
        type: DataTypes.STRING(255),
        allowNull: false
    },
    usuario_id: {
        type: DataTypes.INTEGER,
        references: {
            model: 'usuarios',
            key: 'id'
        }
    }
}, {
    tableName: 'metodo_pago',
    timestamps: false
});

module.exports = MetodoPago;