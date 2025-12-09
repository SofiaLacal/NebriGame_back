const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const videojuegosData = require("../data/videojuegos-data.json");
const consolasData = require("../data/consolas-data.json");
const merchandisingData = require("../data/merchandising-data.json");

const videojuegos = videojuegosData.videojuegos;
const consolas = consolasData.consolas;
const merchandising = merchandisingData.merchandising;

// Unificamos todos los productos para el panel admin
let productos = [
  ...videojuegos,
  ...consolas,
  ...merchandising
];

// ---------------- CREAR PRODUCTO (GENÉRICO) ----------------
router.post("/productos", (req, res) => {
  console.log("ADMIN → Crear producto");
  console.log(req.body);

  const nuevoProducto = {
    id: productos.length + 1,
    ...req.body
  };

  productos.push(nuevoProducto);

  console.log("Producto creado:", nuevoProducto);

  res.status(201).json({
    mensaje: "Producto creado correctamente",
    producto: nuevoProducto
  });
});

// ---------------- ACTUALIZAR PRODUCTO ----------------
router.put("/productos/:id", (req, res) => {
  const id = parseInt(req.params.id);
  console.log(`ADMIN → Actualizar producto ID ${id}`);
  console.log(req.body);

  const index = productos.findIndex(p => p.id === id);

  if (index === -1) {
    return res.status(404).json({
      error: "Producto no encontrado"
    });
  }

  productos[index] = {
    ...productos[index],
    ...req.body
  };

  console.log("Producto actualizado:", productos[index]);

  res.json({
    mensaje: "Producto actualizado correctamente",
    producto: productos[index]
  });
});

// ---------------- ELIMINAR PRODUCTO ----------------
router.delete("/productos/:id", (req, res) => {
  const id = parseInt(req.params.id);
  console.log(`ADMIN → Eliminar producto ID ${id}`);

  const index = productos.findIndex(p => p.id === id);

  if (index === -1) {
    return res.status(404).json({
      error: "Producto no encontrado"
    });
  }

  const eliminado = productos.splice(index, 1);

  console.log("Producto eliminado:", eliminado[0]);

  res.json({
    mensaje: "Producto eliminado correctamente",
    producto: eliminado[0]
  });
});

// ---------------- CREAR VIDEOJUEGO ----------------
router.post("/juegos", (req, res) => {
  console.log("ADMIN → Crear videojuego");
  console.log(req.body);

  const nuevoJuego = {
    id: productos.length + 1,
    tipo: "videojuego",
    ...req.body
  };

  productos.push(nuevoJuego);

  console.log("Videojuego creado:", nuevoJuego);

  res.status(201).json({
    mensaje: "Videojuego creado correctamente",
    videojuego: nuevoJuego
  });
});

// ---------------- CREAR CONSOLA ----------------
router.post("/consolas", (req, res) => {
  console.log("ADMIN → Crear consola");
  console.log(req.body);

  const nuevaConsola = {
    id: productos.length + 1,
    tipo: "consola",
    ...req.body
  };

  productos.push(nuevaConsola);

  console.log("Consola creada:", nuevaConsola);

  res.status(201).json({
    mensaje: "Consola creada correctamente",
    consola: nuevaConsola
  });
});

// ---------------- CREAR MERCHANDISING ----------------
router.post("/merchandising", (req, res) => {
  console.log("ADMIN → Crear merchandising");
  console.log(req.body);

  const nuevoMerchandising = {
    id: productos.length + 1,
    tipo: "merchandising",
    ...req.body
  };

  productos.push(nuevoMerchandising);

  console.log("Merchandising creado:", nuevoMerchandising);

  res.status(201).json({
    mensaje: "Producto de merchandising creado correctamente",
    merchandising: nuevoMerchandising
  });
});

module.exports = router;
