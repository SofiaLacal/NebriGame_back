const express = require("express");
const router = express.Router();
const { Plataforma } = require("../models");

// ---------------- LISTA DE PLATAFORMAS ----------------
router.get("/", async (req, res) => {
    try {
        const plataformas = await Plataforma.findAll();

        res.json({
            success: true,
            total: plataformas.length,
            plataformas
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener plataformas",
            error: error.message
        });
    }
});

// ---------------- DETALLES POR ID ----------------
router.get("/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const plataforma = await Plataforma.findByPk(id);

        if (!plataforma) {
            return res.status(404).json({
                success: false,
                error: "Plataforma no encontrada"
            });
        }

        res.json({
            success: true,
            plataforma
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener plataforma",
            error: error.message
        });
    }
});

module.exports = router;