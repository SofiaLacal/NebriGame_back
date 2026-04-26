const express = require("express");
const cors = require("cors");
const { sequelize } = require("./models");

const app = express();

app.use(cors({
    origin: 'http://localhost:5173'
}));


//################################ TODO ######################################################################## 
//CAMBIAR ESTO PARA USAR EL .ENV CON LA RUTA DEL FRONT
/* app.use(cors({
    origin: process.env.FRONTEND_URL
})); */

app.use(express.json());

//Servimos desde BD archivos estáticos desde assets
app.use("/assets", express.static(__dirname + "/assets"));

const PORT = 4004;

////Para cuando usemos el .env con toda la configuración de la BD y el puerto :)
//const PORT = process.env.PORT || 4004;

//########################################## TODO ###########################################################################
//Poner esto en el package.json para usar el .env con toda la configuración de la BD y el puerto en los scripts, para poder 
//ejecutar el proyecto con npm start o npm run dev sin tener que poner el env-file cada vez
// ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡ Importante, back y front cargan con nom run dev !!!!!!!!!!!!!!!!!!!!!
/*     "start": "node --env-file=.env app.js",
    "dev": "node --env-file=.env --watch app.js" */




// -------- IMPORTAR RUTAS --------
const generalRoutes = require("./routes/general.routes");
const usuarioRoutes = require("./routes/usuarios.routes");
const videojuegosRoutes = require("./routes/videojuegos.routes");
const consolasRoutes = require("./routes/consolas.routes");
const merchandisingRoutes = require("./routes/merchandising.routes");
const plataformasRoutes = require("./routes/plataformas.routes");
const busquedaRoutes = require("./routes/busqueda.routes");
const adminRoutes = require("./routes/admin.routes");

// -------- USAR RUTAS --------
app.use("/", generalRoutes);
app.use("/usuarios", usuarioRoutes);
app.use("/videojuegos", videojuegosRoutes);
app.use("/consolas", consolasRoutes);
app.use("/merchandising", merchandisingRoutes);
app.use("/plataformas", plataformasRoutes);
app.use("/buscar", busquedaRoutes);
app.use("/admin", adminRoutes);


// -------- INICIAR SERVIDOR --------
sequelize.sync()
    .then(() => {
        app.listen(PORT, () => {
            console.log(`NebriGame corriendo en el puerto ${PORT}`);
        });
    })
    .catch(err => {
        console.error('Error al iniciar NebriGame', err);
    });