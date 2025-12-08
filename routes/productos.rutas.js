const express = require("express");
const router = express.Router();
const Producto = require("../models/Producto");

//Lista de todos los productos
router.get("/", async (request, response) => {
    try {
        const productos = await Producto.findAll();
        response.json({
            success: true,
            count: productos.length,
            data: productos
        });
    } catch (error) {
        response.status(500).json({
            success: false,
            message: "Error al obtener los productos",
            error: error.message
        });
    }
});

//Detalles de producto por ID
router.get("/:id", async (request, response) => {
    try {
        const { id } = request.params;
        const producto = await Producto.findByPk(id);
        
        if (!producto) {
            return response.status(404).json({
                success: false,
                message: `Producto con ID ${id} no encontrado`
            });
        }

        response.json({
            success: true,
            data: producto
        });
    } catch (error) {
        response.status(500).json({
            success: false,
            message: "Error al obtener el producto",
            error: error.message
        });
    }
});

//Filtrar productos por tipo
router.get("/tipo/:tipo", async (request, response) => {
    try {
        const { tipo } = request.params;
        const productos = await Producto.findAll({
            where: { tipo: tipo }
        });

        response.json({
            success: true,
            count: productos.length,
            tipo: tipo,
            data: productos
        });
    } catch (error) {
        response.status(500).json({
            success: false,
            message: "Error al filtrar productos por tipo",
            error: error.message
        });
    }
});

//Filtrar productos por rango de precio
router.get("/precio", async (request, response) => {
    try {
        const { min, max } = request.query;
        
        if (!min || !max) {
            return response.status(400).json({
                success: false,
                message: "Debe proporcionar los parámetros 'min' y 'max' para el rango de precio"
            });
        }

        const minPrecio = parseFloat(min);
        const maxPrecio = parseFloat(max);

        if (isNaN(minPrecio) || isNaN(maxPrecio)) {
            return response.status(400).json({
                success: false,
                message: "Los valores de precio deben ser números válidos"
            });
        }

        const productos = await Producto.findAll({
            where: {
                precio: {
                    gte: minPrecio,
                    lte: maxPrecio
                }
            }
        });

        response.json({
            success: true,
            count: productos.length,
            rango: {
                min: minPrecio,
                max: maxPrecio
            },
            data: productos
        });
    } catch (error) {
        response.status(500).json({
            success: false,
            message: "Error al filtrar productos por precio",
            error: error.message
        });
    }
});

module.exports = router;

