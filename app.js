const express = require("express");
const { sequelize } = require("./models"); // Importar sequelize

const app = express();
app.use(express.json());

const PORT = 4004;

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
sequelize.sync().then(() => {
    app.listen(PORT, () => {
        console.log(`✅ NebriGame API corriendo en el puerto ${PORT}`);
    });
});