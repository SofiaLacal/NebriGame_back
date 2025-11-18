//Llamo al framework express
const express = require("express");

//Inicializo express creando la app
const app = express();

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

//La parte del registo la podríamos poner en una nueva ruta app.get("/registro/")
app.get("/login/registro/", (request, response) =>{
    response.send("Página para nuevos usuarios");
});

//Perfil del usuario
app.get("/usuario/:userId", (request, response) => {
  response.send(`Perfil del usuario con ID ${JSON.stringify(request.params)}`);
});

//Carrito del usuario
app.get("/usuario/:userId/carrito", (request, response) => {
  response.send(`Carrito de compras del usuario ${JSON.stringify(request.params)}`);
});

//Historial de compras
app.get("/usuario/:userId/historial-compras", (request, response) => {
  response.send(`Historial de compras del usuario ${JSON.stringify(request.params)}`);
});

//Favoritos guardados del usuario
app.get("/usuario/:userId/favoritos", (request, response) => {
  response.send(`Lista de favoritos del usuario ${JSON.stringify(request.params)}`);
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

//--------------RUTAS PARA PELÍCULAS---------------- 

app.get("/peliculas/", (request, response) => {
  response.send(`Lista de peliculas ${JSON.stringify(request.params)}`);
});

//Filtrar películas por género
app.get("/peliculas/genero/:genero", (request, response) => {
  response.send(`Películas filtradas por género ${JSON.stringify(request.params)}`);
});

//Filtrar películas por nombre
app.get("/peliculas/nombre/:nombre", (request, response) => {
  response.send(`Películas filtradas por nombre ${JSON.stringify(request.params)}`);
});

//--------------RUTAS PARA MERCHANDISING---------------- 

app.get("/merchandising/", (request, response) => {
  response.send(`Lista de productos de merchandising ${JSON.stringify(request.params)}`);
});

//Filtrar merchandising por nombre del juego
app.get("/merchandising/juego/:nombre-juego", (request, response) => {
  response.send(`Películas filtradas por nombre del juego ${JSON.stringify(request.params)}`);
});

