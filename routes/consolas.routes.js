/* const express = require("express");
const router = express.Router();

//Lista de consolas
router.get("/", (request, response) => {
    response.send("Lista de consolas disponibles");
});

//Detalles de consola por ID
router.get("/:id", (request, response) => {
    response.send(`Detalles de la consola con ID ${JSON.stringify(request.params)}`);
});

//Filtrar consolas por plataforma
router.get("/plataforma/:plataformaId", (request, response) => {
    response.send(`Consolas de la plataforma ${JSON.stringify(request.params)}`);
});

//Filtrar consolas por fabricante
router.get("/fabricante/:fabricante", (request, response) => {
    response.send(`Consolas del fabricante ${JSON.stringify(request.params)}`);
});

module.exports = router; */

//EJEMPLO DE LO QUE CREO QUE NECESITAMOS

const express = require("express");
const router = express.Router();

const consolasData = require("../data/consolas.json");
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

