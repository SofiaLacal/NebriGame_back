const express = require("express");
const router = express.Router();

//PRINCIPAL
router.get("/", (request, response) => {
    response.send("Página principal (index)");
});

//OFERTAS
router.get("/ofertas/", (request, response) => {
    response.send("Página de ofertas");
});

//NOVEDADES
router.get("/novedades/", (request, response) => {
    response.send("Página para novedades");
});

//CONTACTO
router.get("/contacto/", (request, response) => {
    response.send("Página de contacto");
});

module.exports = router;

