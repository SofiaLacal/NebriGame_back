const express = require("express");
const router = express.Router();

//Lista de videojuegos
router.get("/", (request, response) => {
    response.send("Página principal de videojuegos");
});

//Mostrar información de un videojuego por nombre
router.get("/:nombre", (request, response) => {
    response.send(`Detalles del videojuego con el nombre ${JSON.stringify(request.params)}`);
});

//Buscar videojuegos por género
router.get("/genero/:genero", (request, response) => {
    response.send(`Videojuegos del género ${JSON.stringify(request.params)}`);
});

//Filtrar juegos por consola
router.get("/consola/:nombreConsola", (request, response) => {
    response.send(`Videojuegos disponibles para ${JSON.stringify(request.params)}`);
});

//Filtrar juegos por edad mínima
router.get("/edad/:edadMinima", (request, response) => {
    response.send(`Videojuegos con edad mínima ${JSON.stringify(request.params)}`);
});

module.exports = router;

