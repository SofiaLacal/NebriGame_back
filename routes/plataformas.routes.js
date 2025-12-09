/* const express = require("express");
const router = express.Router();

//Lista de plataformas
router.get("/", (request, response) => {
    response.send("Lista de plataformas disponibles");
});

//Detalles de plataforma por ID
router.get("/:id", (request, response) => {
    response.send(`Detalles de la plataforma con ID ${JSON.stringify(request.params)}`);
});

module.exports = router;*/

const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const plataformasData = require("../data/plataformas-data.json");
const plataformas = plataformasData.plataformas;

// ---------------- LISTA DE PLATAFORMAS ----------------
router.get("/", (req, res) => {
  console.log("GET /plataformas - lista completa");

  res.json({
    total: plataformas.length,
    plataformas
  });
});

// ---------------- DETALLES POR ID ----------------
router.get("/:id", (req, res) => {
  const id = parseInt(req.params.id);
  console.log(`GET /plataformas/${id}`);

  const plataforma = plataformas.find(p => p.id === id);

  if (!plataforma) {
    return res.status(404).json({
      error: "Plataforma no encontrada"
    });
  }

  res.json(plataforma);
});

module.exports = router;
