const express = require("express");
const router = express.Router();

//Lista de productos de merchandising
router.get("/", (request, response) => {
    response.send(`Lista de productos de merchandising ${JSON.stringify(request.params)}`);
});

//Filtrar merchandising por nombre del juego
router.get("/juego/:nombre-juego", (request, response) => {
    response.send(`Merchandising filtrado por nombre del juego ${JSON.stringify(request.params)}`);
});

//Filtrar merchandising por categoría
router.get("/categoria/:categoria", (request, response) => {
    response.send(`Merchandising de la categoría ${JSON.stringify(request.params)}`);
});

module.exports = router;

