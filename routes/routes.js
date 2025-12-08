//Llamo al framework express
const express = require("express");

//Inicializo express creando la app
const app = express();

//Middleware para parsear JSON
app.use(express.json());

//Dejo el puerto 4004 para pruebas con nodemon
var PORT = 4004;

//Importar rutas
const generalRoutes = require("./general.rutas");
const usuarioRoutes = require("./usuario.rutas");
const videojuegosRoutes = require("./videojuegos.rutas");
const consolasRoutes = require("./consolas.rutas");
const merchandisingRoutes = require("./merchandising.rutas");
const productosRoutes = require("./productos.rutas");
const plataformasRoutes = require("./plataformas.rutas");
const busquedaRoutes = require("./busqueda.rutas");
const adminRoutes = require("./admin.rutas");

//Usar las rutas
app.use("/", generalRoutes);
app.use("/", usuarioRoutes);
app.use("/videojuegos", videojuegosRoutes);
app.use("/consolas", consolasRoutes);
app.use("/merchandising", merchandisingRoutes);
app.use("/productos", productosRoutes);
app.use("/plataformas", plataformasRoutes);
app.use("/buscar", busquedaRoutes);
app.use("/admin", adminRoutes);

//Abro el servidor y empiezo a escuchar peticiones.
app.listen(PORT, () => {
    console.log(`App corriendo el puerto ${PORT}...`);
});
