const express = require("express");
const router = express.Router();
const { Producto, Juego, Plataforma } = require("../models");
const { Op } = require("sequelize");

// ---------------- LISTA DE VIDEOJUEGOS ----------------
router.get("/", async (req, res) => {
    try {
        const juegos = await Producto.findAll({
            where: { tipo: 'juego' },
            include: [{
                model: Juego,
                as: 'juego',
                include: [{
                    model: Plataforma,
                    as: 'plataformas'
                }]
            }]
        });

        res.json({
            success: true,
            total: juegos.length,
            videojuegos: juegos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener videojuegos",
            error: error.message
        });
    }
});

// ---------------- DETALLES POR NOMBRE ----------------
router.get("/:nombre", async (req, res) => {
    try {
        const nombre = req.params.nombre.replace(/-/g, " ");
        
        const videojuego = await Producto.findOne({
            where: { 
                tipo: 'juego',
                nombre: {
                    [Op.like]: `%${nombre}%`
                }
            },
            include: [{
                model: Juego,
                as: 'juego',
                include: [{
                    model: Plataforma,
                    as: 'plataformas'
                }]
            }]
        });

        if (!videojuego) {
            return res.status(404).json({
                success: false,
                error: "Videojuego no encontrado"
            });
        }

        res.json({
            success: true,
            videojuego
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener videojuego",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR GÉNERO ----------------
router.get("/genero/:genero", async (req, res) => {
    try {
        const genero = req.params.genero;

        const juegos = await Producto.findAll({
            where: { tipo: 'juego' },
            include: [{
                model: Juego,
                as: 'juego',
                where: { 
                    genero: {
                        [Op.like]: `%${genero}%`
                    }
                },
                include: [{
                    model: Plataforma,
                    as: 'plataformas'
                }]
            }]
        });

        res.json({
            success: true,
            total: juegos.length,
            genero: genero,
            videojuegos: juegos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por género",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR CONSOLA (PLATAFORMA) ----------------
router.get("/consola/:nombreConsola", async (req, res) => {
    try {
        const nombreConsola = req.params.nombreConsola;

        const juegos = await Producto.findAll({
            where: { tipo: 'juego' },
            include: [{
                model: Juego,
                as: 'juego',
                include: [{
                    model: Plataforma,
                    as: 'plataformas',
                    where: {
                        nombre: {
                            [Op.like]: `%${nombreConsola}%`
                        }
                    }
                }]
            }]
        });

        res.json({
            success: true,
            total: juegos.length,
            consola: nombreConsola,
            videojuegos: juegos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por consola",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR EDAD MÍNIMA ----------------
router.get("/edad/:edadMinima", async (req, res) => {
    try {
        const edadMinima = parseInt(req.params.edadMinima);

        const juegos = await Producto.findAll({
            where: { tipo: 'juego' },
            include: [{
                model: Juego,
                as: 'juego',
                where: {
                    edad_minima: {
                        [Op.lte]: edadMinima
                    }
                },
                include: [{
                    model: Plataforma,
                    as: 'plataformas'
                }]
            }]
        });

        res.json({
            success: true,
            total: juegos.length,
            edadMinima: edadMinima,
            videojuegos: juegos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por edad",
            error: error.message
        });
    }
});

module.exports = router;