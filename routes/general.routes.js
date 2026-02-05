const express = require("express");
const router = express.Router();
const { Producto, Juego, Consola, Merchandising } = require("../models");
const { Op } = require("sequelize");

// ---------------- HOME ----------------
router.get("/", async (req, res) => {
    try {
        // Productos destacados (primeros 5)
        const destacados = await Producto.findAll({
            limit: 5,
            include: [
                { model: Juego, as: 'juego', required: false },
                { model: Consola, as: 'consola', required: false },
                { model: Merchandising, as: 'merchandising', required: false }
            ]
        });

        const totalProductos = await Producto.count();

        res.json({
            success: true,
            mensaje: "Bienvenido a NebriGame",
            destacados,
            totalProductos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error en página principal",
            error: error.message
        });
    }
});

// ---------------- OFERTAS ----------------
router.get("/ofertas", async (req, res) => {
    try {
        // Productos con precio menor a 50
        const ofertas = await Producto.findAll({
            where: {
                precio: {
                    [Op.lt]: 50
                }
            },
            include: [
                { model: Juego, as: 'juego', required: false },
                { model: Consola, as: 'consola', required: false },
                { model: Merchandising, as: 'merchandising', required: false }
            ]
        });

        res.json({
            success: true,
            total: ofertas.length,
            ofertas
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener ofertas",
            error: error.message
        });
    }
});

// ---------------- NOVEDADES ----------------
router.get("/novedades", async (req, res) => {
    try {
        // Últimos 5 productos añadidos
        const novedades = await Producto.findAll({
            order: [['fecha_creacion', 'DESC']],
            limit: 5,
            include: [
                { model: Juego, as: 'juego', required: false },
                { model: Consola, as: 'consola', required: false },
                { model: Merchandising, as: 'merchandising', required: false }
            ]
        });

        res.json({
            success: true,
            total: novedades.length,
            novedades
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener novedades",
            error: error.message
        });
    }
});

// ---------------- CONTACTO ----------------
router.get("/contacto", (req, res) => {
    res.json({
        success: true,
        email: "contacto@nebrigame.com",
        telefono: "+34 600 123 456",
        direccion: "Madrid, España"
    });
});

// ---------------- OBTENER UN PRODUCTO POR ID ----------------
router.get("/producto/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const producto = await Producto.findOne({
            where: { 
                id: id
            },
            include: [
                { model: Juego, as: 'juego', required: false },
                { model: Consola, as: 'consola', required: false },
                { model: Merchandising, as: 'merchandising', required: false }
            ]
        });
        if (!producto) {
            return res.status(404).json({
                success: false,
                error: "Producto no encontrado"
            });
        }
        res.json({
            success: true,
            producto
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener producto",
            error: error.message
        });
    }
});
module.exports = router;