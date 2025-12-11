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
                { model: Juego, required: false, include: [Plataforma] },
                { model: Consola, required: false, include: [Plataforma] },
                { model: Merchandising, required: false }
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