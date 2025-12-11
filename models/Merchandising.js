const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Merchandising = sequelize.define('Merchandising', {
    producto_id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        references: {
            model: 'productos',
            key: 'id'
        }
    },
    categoria: {
        type: DataTypes.STRING(50),
        allowNull: true
    }
}, {
    tableName: 'merchandising',
    timestamps: false
});

module.exports = Merchandising;