const express = require("express");
const router = express.Router();
const { Producto, Merchandising } = require("../models");
const { Op } = require("sequelize");

// ---------------- LISTA DE MERCHANDISING ----------------
router.get("/", async (req, res) => {
    try {
        const merchandising = await Producto.findAll({
            where: { tipo: 'merchandising' },
            include: [Merchandising]
        });

        res.json({
            success: true,
            total: merchandising.length,
            merchandising
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener merchandising",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR NOMBRE DEL JUEGO ----------------
// Nota: En tu BD actual no hay campo "juegoAsociado" en la tabla merchandising
// Si lo necesitas, deberás agregarlo a la tabla primero
router.get("/juego/:nombreJuego", async (req, res) => {
    try {
        const nombreJuego = req.params.nombreJuego;

        // Búsqueda por nombre del producto que contenga el nombre del juego
        const merchandising = await Producto.findAll({
            where: { 
                tipo: 'merchandising',
                nombre: {
                    [Op.like]: `%${nombreJuego}%`
                }
            },
            include: [Merchandising]
        });

        res.json({
            success: true,
            total: merchandising.length,
            merchandising
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por juego",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR CATEGORÍA ----------------
router.get("/categoria/:categoria", async (req, res) => {
    try {
        const categoria = req.params.categoria;

        const merchandising = await Producto.findAll({
            where: { tipo: 'merchandising' },
            include: [{
                model: Merchandising,
                where: {
                    categoria: {
                        [Op.like]: `%${categoria}%`
                    }
                }
            }]
        });

        res.json({
            success: true,
            total: merchandising.length,
            categoria: categoria,
            merchandising
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por categoría",
            error: error.message
        });
    }
});

module.exports = router;