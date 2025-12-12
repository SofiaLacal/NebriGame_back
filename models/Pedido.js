const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Pedido = sequelize.define('Pedido', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    usuario_id: {
        type: DataTypes.INTEGER,
        references: {
            model: 'usuarios',
            key: 'id'
        }
    },
    metodo_pago_id: {
        type: DataTypes.INTEGER,
        references: {
            model: 'metodo_pago',
            key: 'id'
        }
    },
    total: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false
    },
    estado: {
        type: DataTypes.ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado'),
        allowNull: false,
        defaultValue: 'pendiente'
    },
    fecha_pedido: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    direccion_envio: {
        type: DataTypes.STRING(255),
        allowNull: true
    },
    telefono_contacto: {
        type: DataTypes.STRING(20),
        allowNull: true
    },
    notas: {
        type: DataTypes.TEXT,
        allowNull: true
    }
}, {
    tableName: 'pedidos',
    timestamps: false
});

module.exports = Pedido;