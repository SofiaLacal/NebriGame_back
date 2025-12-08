const express = require("express");
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

module.exports = router;

