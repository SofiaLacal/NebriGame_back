const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const videojuegosData = require("../data/videojuegos-data.json");
const videojuegos = videojuegosData.videojuegos;

// ---------------- LISTA DE VIDEOJUEGOS ----------------
router.get("/", (req, res) => {
  console.log("GET /videojuegos - lista completa");

  res.json({
    total: videojuegos.length,
    videojuegos
  });
});

// ---------------- DETALLES POR NOMBRE ----------------
router.get("/:nombre", (req, res) => {
  const nombre = req.params.nombre.toLowerCase();
  console.log(`GET /videojuegos/${nombre}`);

  const videojuego = videojuegos.find(
    v => v.nombre.toLowerCase().replace(/\s+/g, "-") === nombre
  );

  if (!videojuego) {
    return res.status(404).json({
      error: "Videojuego no encontrado"
    });
  }

  res.json(videojuego);
});

// ---------------- FILTRAR POR GÉNERO ----------------
router.get("/genero/:genero", (req, res) => {
  const genero = req.params.genero.toLowerCase();
  console.log(`GET /videojuegos/genero/${genero}`);

  const resultado = videojuegos.filter(
    v => v.genero && v.genero.toLowerCase() === genero
  );

  res.json({
    total: resultado.length,
    genero: genero,
    videojuegos: resultado
  });
});

// ---------------- FILTRAR POR CONSOLA ----------------
router.get("/consola/:nombreConsola", (req, res) => {
  const nombreConsola = req.params.nombreConsola.toLowerCase();
  console.log(`GET /videojuegos/consola/${nombreConsola}`);

  const resultado = videojuegos.filter(v =>
    v.plataformas && v.plataformas.some(
      p => p.toLowerCase().includes(nombreConsola)
    )
  );

  res.json({
    total: resultado.length,
    consola: nombreConsola,
    videojuegos: resultado
  });
});

// ---------------- FILTRAR POR EDAD MÍNIMA ----------------
router.get("/edad/:edadMinima", (req, res) => {
  const edadMinima = parseInt(req.params.edadMinima);
  console.log(`GET /videojuegos/edad/${edadMinima}`);

  const resultado = videojuegos.filter(
    v => v.edadMinima && v.edadMinima <= edadMinima
  );

  res.json({
    total: resultado.length,
    edadMinima: edadMinima,
    videojuegos: resultado
  });
});

module.exports = router;