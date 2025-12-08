const express = require("express");
const router = express.Router();

//Lista de plataformas
router.get("/", (request, response) => {
    response.send("Lista de plataformas disponibles");
});

//Detalles de plataforma por ID
router.get("/:id", (request, response) => {
    response.send(`Detalles de la plataforma con ID ${JSON.stringify(request.params)}`);
});

module.exports = router;

