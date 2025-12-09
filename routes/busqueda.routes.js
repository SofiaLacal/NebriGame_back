const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const videojuegosData = require("../data/videojuegos-data.json");
const consolasData = require("../data/consolas-data.json");
const merchandisingData = require("../data/merchandising-data.json");

const videojuegos = videojuegosData.videojuegos;
const consolas = consolasData.consolas;
const merchandising = merchandisingData.merchandising;

// Array con todos los productos para búsqueda
const todosLosProductos = [
  ...videojuegos.map(v => ({ ...v, tipo: "videojuego" })),
  ...consolas.map(c => ({ ...c, tipo: "consola" })),
  ...merchandising.map(m => ({ ...m, tipo: "merchandising" }))
];

// ---------------- BÚSQUEDA GENERAL ----------------
router.get("/", (req, res) => {
  const { q } = req.query;

  if (!q || q.trim() === "") {
    return res.status(400).json({
      error: "Debe proporcionar un término de búsqueda mediante el parámetro 'q'"
    });
  }

  console.log(`GET /buscar?q=${q}`);

  const terminoBusqueda = q.toLowerCase();

  // Buscar en nombre, descripción, marca, categoría, etc.
  const resultados = todosLosProductos.filter(producto => {
    const nombre = producto.nombre?.toLowerCase() || "";
    const descripcion = producto.descripcion?.toLowerCase() || "";
    const marca = producto.marca?.toLowerCase() || "";
    const genero = producto.genero?.toLowerCase() || "";
    const categoria = producto.categoria?.toLowerCase() || "";

    return (
      nombre.includes(terminoBusqueda) ||
      descripcion.includes(terminoBusqueda) ||
      marca.includes(terminoBusqueda) ||
      genero.includes(terminoBusqueda) ||
      categoria.includes(terminoBusqueda)
    );
  });

  res.json({
    terminoBusqueda: q,
    total: resultados.length,
    resultados
  });
});

module.exports = router;