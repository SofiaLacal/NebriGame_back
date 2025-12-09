const express = require("express");
const router = express.Router();

const consolasData = require("../data/consolas-data.json");
const consolas = consolasData.consolas;

// Lista de consolas
router.get("/", (req, res) => {
  console.log("GET /consolas");
  res.json({ total: consolas.length, consolas });
});

// Detalles por ID
router.get("/:id", (req, res) => {
  const id = parseInt(req.params.id);
  const consola = consolas.find(c => c.id === id);

  if (!consola) {
    return res.status(404).json({ error: "Consola no encontrada" });
  }

  res.json(consola);
});

// Filtrar por plataforma (categoria_id)
router.get("/plataforma/:categoriaId", (req, res) => {
  const categoriaId = parseInt(req.params.categoriaId);
  const resultado = consolas.filter(c => c.categoria_id === categoriaId);

  res.json({ total: resultado.length, consolas: resultado });
});

// Filtrar por fabricante
router.get("/fabricante/:fabricante", (req, res) => {
  const fabricante = req.params.fabricante.toLowerCase();
  const resultado = consolas.filter(
    c => c.marca.toLowerCase() === fabricante
  );

  res.json({ total: resultado.length, consolas: resultado });
});

module.exports = router;

