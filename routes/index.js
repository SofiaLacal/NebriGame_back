//Llamo al framework express
const express = require("express");

//Inicializo express creando la app
const app = express();

//Middleware para parsear JSON
app.use(express.json());

//Dejo el puerto 4004 para pruebas con nodemon
var PORT = 4004;

//Abro el servidor y empiezo a escuchar peticiones.
app.listen(PORT, () => {
    console.log(`App corriendo el puerto ${PORT}...`);
})

//---------RUTAS-----------

//PRINCIPAL
app.get("/", (request, response) =>{
    response.send("Página principal (index)"); 
});

//OFERTAS
app.get("/ofertas/", (request, response) =>{
    response.send("Página de ofertas");
});

//NOVEDADES
app.get("/novedades/", (request, response) =>{
    response.send("Página para novedades");
})

//CONTACTO
app.get("/contacto/", (request, response) => {
    response.send("Página de contacto");
});

//-------------RUTAS PARA USUARIOS----------

//Login de usuarios
app.get("/login/", (request, response) =>{
    response.send("Página de login");
});

//Login de usuarios (POST para autenticación)
app.post("/login/", (request, response) =>{
    response.send(`Autenticación de usuario ${JSON.stringify(request.body)}`);
});

//Registro de nuevos usuarios (POST)
app.post("/registro/", (request, response) =>{
    response.send(`Registro de nuevo usuario ${JSON.stringify(request.body)}`);
});

//Perfil del usuario
app.get("/usuario/:userId", (request, response) => {
  response.send(`Perfil del usuario con ID ${JSON.stringify(request.params)}`);
});

//Actualizar perfil del usuario
app.put("/usuario/:userId", (request, response) => {
  response.send(`Actualizar perfil del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar cuenta de usuario
app.delete("/usuario/:userId", (request, response) => {
  response.send(`Eliminar usuario con ID ${JSON.stringify(request.params)}`);
});

//Carrito del usuario
app.get("/usuario/:userId/carrito", (request, response) => {
  response.send(`Carrito de compras del usuario ${JSON.stringify(request.params)}`);
});

//Añadir producto al carrito
app.post("/usuario/:userId/carrito", (request, response) => {
  response.send(`Añadir producto al carrito del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Actualizar cantidad de producto en el carrito
app.put("/usuario/:userId/carrito/:productoId", (request, response) => {
  response.send(`Actualizar producto ${JSON.stringify(request.params)} en el carrito con datos ${JSON.stringify(request.body)}`);
});

//Eliminar producto del carrito
app.delete("/usuario/:userId/carrito/:productoId", (request, response) => {
  response.send(`Eliminar producto ${JSON.stringify(request.params)} del carrito`);
});

//Completar compra (crear pedido)
app.post("/usuario/:userId/carrito/comprar", (request, response) => {
  response.send(`Completar compra del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Historial de compras
app.get("/usuario/:userId/historial-compras", (request, response) => {
  response.send(`Historial de compras del usuario ${JSON.stringify(request.params)}`);
});

//Favoritos guardados del usuario
app.get("/usuario/:userId/wishlist", (request, response) => {
  response.send(`Lista de favoritos del usuario ${JSON.stringify(request.params)}`);
});

//Añadir producto a favoritos
app.post("/usuario/:userId/wishlist", (request, response) => {
  response.send(`Añadir producto a favoritos del usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

app.delete("/usuario/:userId/wishlist", (request, response) => {
  response.send(`Eliminar lista de deseos ${JSON.stringify(request.params)}`);
});
//Eliminar producto de favoritos
app.delete("/usuario/:userId/wishlist/:productoId", (request, response) => {
  response.send(`Eliminar producto ${JSON.stringify(request.params)} de favoritos`);
});

//Métodos de pago del usuario
app.get("/usuario/:userId/metodos-pago", (request, response) => {
  response.send(`Métodos de pago del usuario ${JSON.stringify(request.params)}`);
});

//Añadir método de pago
app.post("/usuario/:userId/metodos-pago", (request, response) => {
  response.send(`Añadir método de pago para usuario ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Actualizar método de pago
app.put("/usuario/:userId/metodos-pago/:metodoId", (request, response) => {
  response.send(`Actualizar método de pago ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar método de pago
app.delete("/usuario/:userId/metodos-pago/:metodoId", (request, response) => {
  response.send(`Eliminar método de pago ${JSON.stringify(request.params)}`);
});

//------------RUTAS PARA VIDEOJUEGOS--------------

app.get("/videojuegos/", (request, response) =>{
    response.send("Página principal de videojuegos");
});

//Mostrar información de un videojuego por nombre
app.get("/videojuegos/:nombre", (request, response) => {
  response.send(`Detalles del videojuego con el nombre ${JSON.stringify(request.params)}`);
});

//Buscar videojuegos por género
app.get("/videojuegos/genero/:genero", (request, response) => {
  response.send(`Videojuegos del género ${JSON.stringify(request.params)}`);
});

//Filtrar juegos por consola
app.get("/videojuegos/consola/:nombreConsola", (request, response) => {
  response.send(`Videojuegos disponibles para ${JSON.stringify(request.params)}`);
});

//Filtrar juegos por edad mínima
app.get("/videojuegos/edad/:edadMinima", (request, response) => {
  response.send(`Videojuegos con edad mínima ${JSON.stringify(request.params)}`);
});

//--------------RUTAS PARA MERCHANDISING---------------- 

app.get("/merchandising/", (request, response) => {
  response.send(`Lista de productos de merchandising ${JSON.stringify(request.params)}`);
});

//Filtrar merchandising por nombre del juego
app.get("/merchandising/juego/:nombre-juego", (request, response) => {
  response.send(`Merchandising filtrado por nombre del juego ${JSON.stringify(request.params)}`);
});

//Filtrar merchandising por categoría
app.get("/merchandising/categoria/:categoria", (request, response) => {
  response.send(`Merchandising de la categoría ${JSON.stringify(request.params)}`);
});

//--------------RUTAS PARA CONSOLAS---------------- 

//Lista de consolas
app.get("/consolas/", (request, response) => {
  response.send("Lista de consolas disponibles");
});

//Detalles de consola por ID
app.get("/consolas/:id", (request, response) => {
  response.send(`Detalles de la consola con ID ${JSON.stringify(request.params)}`);
});

//Filtrar consolas por plataforma
app.get("/consolas/plataforma/:plataformaId", (request, response) => {
  response.send(`Consolas de la plataforma ${JSON.stringify(request.params)}`);
});

//Filtrar consolas por fabricante
app.get("/consolas/fabricante/:fabricante", (request, response) => {
  response.send(`Consolas del fabricante ${JSON.stringify(request.params)}`);
});

//--------------RUTAS PARA PRODUCTOS GENERALES---------------- 

//Lista de todos los productos
app.get("/productos/", (request, response) => {
  response.send("Lista de todos los productos");
});

//Detalles de producto por ID
app.get("/productos/:id", (request, response) => {
  response.send(`Detalles del producto con ID ${JSON.stringify(request.params)}`);
});

//Filtrar productos por tipo
app.get("/productos/tipo/:tipo", (request, response) => {
  response.send(`Productos del tipo ${JSON.stringify(request.params)}`);
});

//Filtrar productos por rango de precio
app.get("/productos/precio", (request, response) => {
  const { min, max } = request.query;
  response.send(`Productos con precio entre ${min} y ${max}`);
});

//--------------RUTAS PARA PLATAFORMAS---------------- 

//Lista de plataformas
app.get("/plataformas/", (request, response) => {
  response.send("Lista de plataformas disponibles");
});

//Detalles de plataforma por ID
app.get("/plataformas/:id", (request, response) => {
  response.send(`Detalles de la plataforma con ID ${JSON.stringify(request.params)}`);
});

//--------------RUTAS DE BÚSQUEDA---------------- 

//Búsqueda general
app.get("/buscar", (request, response) => {
  const { q } = request.query;
  response.send(`Resultados de búsqueda para: ${q}`);
});

//--------------RUTAS ADMIN (GESTIÓN DE PRODUCTOS)---------------- 

//Crear producto
app.post("/productos/", (request, response) => {
  response.send(`Crear nuevo producto con datos ${JSON.stringify(request.body)}`);
});

//Actualizar producto
app.put("/productos/:id", (request, response) => {
  response.send(`Actualizar producto ${JSON.stringify(request.params)} con datos ${JSON.stringify(request.body)}`);
});

//Eliminar producto
app.delete("/productos/:id", (request, response) => {
  response.send(`Eliminar producto con ID ${JSON.stringify(request.params)}`);
});

//Crear juego
app.post("/juegos/", (request, response) => {
  response.send(`Crear nuevo juego con datos ${JSON.stringify(request.body)}`);
});

//Crear consola
app.post("/consolas/", (request, response) => {
  response.send(`Crear nueva consola con datos ${JSON.stringify(request.body)}`);
});

//Crear merchandising
app.post("/merchandising/", (request, response) => {
  response.send(`Crear nuevo producto de merchandising con datos ${JSON.stringify(request.body)}`);
});
