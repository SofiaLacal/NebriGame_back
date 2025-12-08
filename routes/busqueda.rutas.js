const express = require("express");
const router = express.Router();

//Búsqueda general
router.get("/", (request, response) => {
    const { q } = request.query;
    response.send(`Resultados de búsqueda para: ${q}`);
});

module.exports = router;

