const express = require("express");
const router = express.Router();
const { Producto, Juego, Consola, Merchandising, Plataforma } = require("../models");
const { Op } = require("sequelize");

// ---------------- BÚSQUEDA GENERAL ----------------
router.get("/", async (req, res) => {
    try {
        const { q } = req.query;

        if (!q || q.trim() === "") {
            return res.status(400).json({
                success: false,
                error: "Debe proporcionar un término de búsqueda mediante el parámetro 'q'"
            });
        }

        const terminoBusqueda = q.toLowerCase();

        // Buscar en productos (nombre y descripción)
        const productos = await Producto.findAll({
            where: {
                [Op.or]: [
                    { nombre: { [Op.like]: `%${terminoBusqueda}%` } },
                    { descripcion: { [Op.like]: `%${terminoBusqueda}%` } }
                ]
            },
            include: [
                { 
                    model: Juego, 
                    as: 'juego',
                    required: false, 
                    include: [{
                        model: Plataforma,
                        as: 'plataformas'
                    }]
                },
                { 
                    model: Consola, 
                    as: 'consola',
                    required: false, 
                    include: [{
                        model: Plataforma,
                        as: 'plataforma'
                    }]
                },
                { 
                    model: Merchandising, 
                    as: 'merchandising',
                    required: false 
                }
            ]
        });

        res.json({
            success: true,
            terminoBusqueda: q,
            total: productos.length,
            resultados: productos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error en la búsqueda",
            error: error.message
        });
    }
});

module.exports = router;