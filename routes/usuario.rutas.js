const express = require("express");
const router = express.Router();

//Login de usuarios
router.get("/login/", (request, response) => {
    response.send("Página de login");
});

//Login de usuarios (POST para autenticación)
router.post("/login/", (request, response) => {
    response.send(`Autenticación de usuario ${JSON.stringify(request.body)}`);
});

//Registro de nuevos usuarios (POST)
router.post("/registro/", (request, response) => {
    response.send(`Registro de nuevo usuario ${JSON.stringify(request.body)}`);
});

//Perfil del usuario
router.get("/usuario/:userId", (request, response) => {
    response.send(`Perfil del usuario con ID ${JSON.stringify(request.params)}`);
});

//Actualizar perfil del usuario
router.put("/usuario/:userId", (request, response) => {
    response.send(`Actualizar perfil del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar cuenta de usuario
router.delete("/usuario/:userId", (request, response) => {
    response.send(`Eliminar usuario con ID ${JSON.stringify(request.params)}`);
});

//Carrito del usuario
router.get("/usuario/:userId/carrito", (request, response) => {
    response.send(`Carrito de compras del usuario ${JSON.stringify(request.params)}`);
});

//Añadir producto al carrito
router.post("/usuario/:userId/carrito", (request, response) => {
    response.send(`Añadir producto al carrito del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Actualizar cantidad de producto en el carrito
router.put("/usuario/:userId/carrito/:productoId", (request, response) => {
    response.send(`Actualizar producto ${JSON.stringify(request.params)} en el carrito con datos ${JSON.stringify(request.body)}`);
});

//Eliminar producto del carrito
router.delete("/usuario/:userId/carrito/:productoId", (request, response) => {
    response.send(`Eliminar producto ${JSON.stringify(request.params)} del carrito`);
});

//Completar compra (crear pedido)
router.post("/usuario/:userId/carrito/comprar", (request, response) => {
    response.send(`Completar compra del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Historial de compras
router.get("/usuario/:userId/historial-compras", (request, response) => {
    response.send(`Historial de compras del usuario ${JSON.stringify(request.params)}`);
});

//Favoritos guardados del usuario
router.get("/usuario/:userId/wishlist", (request, response) => {
    response.send(`Lista de favoritos del usuario ${JSON.stringify(request.params)}`);
});

//Añadir producto a favoritos
router.post("/usuario/:userId/wishlist", (request, response) => {
    response.send(`Añadir producto a favoritos del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar lista de deseos completa
router.delete("/usuario/:userId/wishlist", (request, response) => {
    response.send(`Eliminar lista de deseos ${JSON.stringify(request.params)}`);
});

//Eliminar producto de favoritos
router.delete("/usuario/:userId/wishlist/:productoId", (request, response) => {
    response.send(`Eliminar producto ${JSON.stringify(request.params)} de favoritos`);
});

//Métodos de pago del usuario
router.get("/usuario/:userId/metodos-pago", (request, response) => {
    response.send(`Métodos de pago del usuario ${JSON.stringify(request.params)}`);
});

//Añadir método de pago
router.post("/usuario/:userId/metodos-pago", (request, response) => {
    response.send(`Añadir método de pago para usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Actualizar método de pago
router.put("/usuario/:userId/metodos-pago/:metodoId", (request, response) => {
    response.send(`Actualizar método de pago ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar método de pago
router.delete("/usuario/:userId/metodos-pago/:metodoId", (request, response) => {
    response.send(`Eliminar método de pago ${JSON.stringify(request.params)}`);
});

module.exports = router;

