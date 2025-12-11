const express = require("express");
const router = express.Router();
const { Producto, Consola, Plataforma } = require("../models");
const { Op } = require("sequelize");

// ---------------- LISTA DE CONSOLAS ----------------
router.get("/", async (req, res) => {
    try {
        const consolas = await Producto.findAll({
            where: { tipo: 'consola' },
            include: [{
                model: Consola,
                include: [Plataforma]
            }]
        });

        res.json({
            success: true,
            total: consolas.length,
            consolas
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener consolas",
            error: error.message
        });
    }
});

// ---------------- DETALLES POR ID ----------------
router.get("/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id);

        const consola = await Producto.findOne({
            where: { 
                id: id,
                tipo: 'consola'
            },
            include: [{
                model: Consola,
                include: [Plataforma]
            }]
        });

        if (!consola) {
            return res.status(404).json({
                success: false,
                error: "Consola no encontrada"
            });
        }

        res.json({
            success: true,
            consola
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener consola",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR PLATAFORMA ----------------
router.get("/plataforma/:categoriaId", async (req, res) => {
    try {
        const categoriaId = parseInt(req.params.categoriaId);

        const consolas = await Producto.findAll({
            where: { tipo: 'consola' },
            include: [{
                model: Consola,
                where: { plataforma_id: categoriaId },
                include: [Plataforma]
            }]
        });

        res.json({
            success: true,
            total: consolas.length,
            consolas
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por plataforma",
            error: error.message
        });
    }
});

// ---------------- FILTRAR POR FABRICANTE ----------------
router.get("/fabricante/:fabricante", async (req, res) => {
    try {
        const fabricante = req.params.fabricante;

        const consolas = await Producto.findAll({
            where: { tipo: 'consola' },
            include: [{
                model: Consola,
                where: {
                    fabricante: {
                        [Op.like]: `%${fabricante}%`
                    }
                },
                include: [Plataforma]
            }]
        });

        res.json({
            success: true,
            total: consolas.length,
            fabricante: fabricante,
            consolas
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al filtrar por fabricante",
            error: error.message
        });
    }
});

module.exports = router;