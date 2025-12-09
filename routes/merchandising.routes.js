const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const merchandisingData = require("../data/merchandising-data.json");
const merchandising = merchandisingData.merchandising;

// ---------------- LISTA DE MERCHANDISING ----------------
router.get("/", (req, res) => {
  console.log("GET /merchandising - lista completa");

  res.json({
    total: merchandising.length,
    merchandising
  });
});

// ---------------- FILTRAR POR NOMBRE DEL JUEGO ----------------
router.get("/juego/:nombreJuego", (req, res) => {
  const nombreJuego = req.params.nombreJuego.toLowerCase();
  console.log(`GET /merchandising/juego/${nombreJuego}`);

  const resultado = merchandising.filter(
    m =>
      m.juegoAsociado &&
      m.juegoAsociado.toLowerCase().includes(nombreJuego)
  );

  res.json({
    total: resultado.length,
    merchandising: resultado
  });
});

// ---------------- FILTRAR POR CATEGORÍA ----------------
router.get("/categoria/:categoria", (req, res) => {
  const categoria = req.params.categoria.toLowerCase();
  console.log(`GET /merchandising/categoria/${categoria}`);

  const resultado = merchandising.filter(
    m =>
      m.categoria &&
      m.categoria.toLowerCase() === categoria
  );

  res.json({
    total: resultado.length,
    merchandising: resultado
  });
});

module.exports = router;


