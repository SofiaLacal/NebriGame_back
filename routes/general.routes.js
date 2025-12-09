const express = require("express");
const router = express.Router();

// Importamos datos
const videojuegosData = require("../data/videojuegos-data.json");
const consolasData = require("../data/consolas-data.json");
const merchandisingData = require("../data/merchandising-data.json");

const videojuegos = videojuegosData.videojuegos;
const consolas = consolasData.consolas;
const merchandising = merchandisingData.merchandising;

// Array general
const todosLosProductos = [
  ...videojuegos,
  ...consolas,
  ...merchandising
];

// ---------------- HOME ----------------
router.get("/", (req, res) => {
  console.log("GET / - Página principal");

  // Simulamos productos destacados
  const destacados = todosLosProductos.slice(0, 5);

  res.json({
    mensaje: "Bienvenido a NebriGame",
    destacados,
    totalProductos: todosLosProductos.length
  });
});

// ---------------- OFERTAS ----------------
router.get("/ofertas", (req, res) => {
  console.log("GET /ofertas");

  // Simulación: productos con precio menor a X
  const ofertas = todosLosProductos.filter(p => p.precio && p.precio < 50);

  res.json({
    total: ofertas.length,
    ofertas
  });
});

// ---------------- NOVEDADES ----------------
router.get("/novedades", (req, res) => {
  console.log("GET /novedades");

  // Simulamos novedades (últimos añadidos)
  const novedades = todosLosProductos.slice(-5).reverse();

  res.json({
    total: novedades.length,
    novedades
  });
});

// ---------------- CONTACTO ----------------
router.get("/contacto", (req, res) => {
  console.log("GET /contacto");

  res.json({
    email: "contacto@nebrigame.com",
    telefono: "+34 600 123 456",
    direccion: "Madrid, España"
  });
});

module.exports = router;


