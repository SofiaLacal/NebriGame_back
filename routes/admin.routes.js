const express = require("express");
const router = express.Router();

//Crear producto
router.post("/productos/", (request, response) => {
    response.send(`Crear nuevo producto con datos ${JSON.stringify(request.body)}`);
});

//Actualizar producto
router.put("/productos/:id", (request, response) => {
    response.send(`Actualizar producto ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar producto
router.delete("/productos/:id", (request, response) => {
    response.send(`Eliminar producto con ID ${JSON.stringify(request.params)}`);
});

//Crear juego
router.post("/juegos/", (request, response) => {
    response.send(`Crear nuevo juego con datos ${JSON.stringify(request.body)}`);
});

//Crear consola
router.post("/consolas/", (request, response) => {
    response.send(`Crear nueva consola con datos ${JSON.stringify(request.body)}`);
});

//Crear merchandising
router.post("/merchandising/", (request, response) => {
    response.send(`Crear nuevo producto de merchandising con datos ${JSON.stringify(request.body)}`);
});

module.exports = router;

