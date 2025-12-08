const express = require("express");
const router = express.Router();

//Lista de todos los productos
router.get("/", (request, response) => {
    response.send("Lista de todos los productos");
});

//Detalles de producto por ID
router.get("/:id", (request, response) => {
    response.send(`Detalles del producto con ID ${JSON.stringify(request.params)}`);
});

//Filtrar productos por tipo
router.get("/tipo/:tipo", (request, response) => {
    response.send(`Productos del tipo ${JSON.stringify(request.params)}`);
});

//Filtrar productos por rango de precio
router.get("/precio", (request, response) => {
    const { min, max } = request.query;
    response.send(`Productos con precio entre ${min} y ${max}`);
});

module.exports = router;

