const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const usuariosData = require("../data/usuarios-data.json");
const videojuegosData = require("../data/videojuegos-data.json");
const consolasData = require("../data/consolas-data.json");
const merchandisingData = require("../data/merchandising-data.json");

let usuarios = usuariosData.usuarios;

// Unificamos todos los productos (videojuegos + consolas + merchandising)
const productos = [
  ...videojuegosData.videojuegos,
  ...consolasData.consolas,
  ...merchandisingData.merchandising
];

// ---------------- TODOS LOS USUARIOS ----------------
router.get("/", (req, res) => {
  res.json(usuarios);
});

// ---------------- LOGIN ----------------
router.post("/login", (req, res) => {
  console.log("POST /usuarios/login");
  console.log(req.body);

  const { email, password } = req.body;

  const usuario = usuarios.find(
    u => u.email === email && u.password === password
  );

  if (!usuario) {
    return res.status(401).json({
      error: "Credenciales incorrectas"
    });
  }

  res.json({
    mensaje: "Login correcto",
    usuario
  });
});

// ---------------- REGISTRO ----------------
router.post("/registro", (req, res) => {
  console.log("POST /usuarios/registro");
  console.log(req.body);

  const nuevoUsuario = {
    id: usuarios.length + 1,
    carrito: [],
    wishlist: [],
    metodosPago: [],
    historialCompras: [],
    ...req.body
  };

  usuarios.push(nuevoUsuario);

  console.log("Usuario registrado:", nuevoUsuario);

  res.status(201).json({
    mensaje: "Usuario registrado correctamente",
    usuario: nuevoUsuario
  });
});

// ---------------- PERFIL ----------------
router.get("/:userId", (req, res) => {
  const userId = parseInt(req.params.userId);
  console.log(`GET /usuarios/${userId}`);

  const usuario = usuarios.find(u => u.id === userId);

  if (!usuario) {
    return res.status(404).json({
      error: "Usuario no encontrado"
    });
  }

  res.json(usuario);
});

// ---------------- ACTUALIZAR PERFIL ----------------
router.put("/:userId", (req, res) => {
  const userId = parseInt(req.params.userId);
  console.log(`PUT /usuarios/${userId}`);
  console.log(req.body);

  const index = usuarios.findIndex(u => u.id === userId);

  if (index === -1) {
    return res.status(404).json({ error: "Usuario no encontrado" });
  }

  usuarios[index] = {
    ...usuarios[index],
    ...req.body
  };

  res.json({
    mensaje: "Perfil actualizado",
    usuario: usuarios[index]
  });
});

// ---------------- ELIMINAR USUARIO ----------------
router.delete("/:userId", (req, res) => {
  const userId = parseInt(req.params.userId);
  console.log(`DELETE /usuario/${userId}`);

  usuarios = usuarios.filter(u => u.id !== userId);

  res.json({ mensaje: "Usuario eliminado correctamente" });
});

// ---------------- CARRITO ----------------
router.get("/:userId/carrito", (req, res) => {
  const userId = parseInt(req.params.userId);
  const usuario = usuarios.find(u => u.id === userId);

  res.json(usuario?.carrito || []);
});

router.post("/:userId/carrito", (req, res) => {
  const userId = parseInt(req.params.userId);
  const { productoId, cantidad } = req.body;

  const usuario = usuarios.find(u => u.id === userId);
  const producto = productos.find(p => p.id === productoId);

  if (!usuario || !producto) {
    return res.status(404).json({ error: "Usuario o producto no encontrado" });
  }

  usuario.carrito.push({ productoId, cantidad });

  res.json({ mensaje: "Producto añadido al carrito", carrito: usuario.carrito });
});

router.delete("/:userId/carrito/:productoId", (req, res) => {
  const { userId, productoId } = req.params;
  const usuario = usuarios.find(u => u.id == userId);

  usuario.carrito = usuario.carrito.filter(p => p.productoId != productoId);

  res.json({ mensaje: "Producto eliminado del carrito" });
});

// ---------------- WISHLIST ----------------
router.get("/:userId/wishlist", (req, res) => {
  const usuario = usuarios.find(u => u.id == req.params.userId);
  res.json(usuario?.wishlist || []);
});

router.post("/:userId/wishlist", (req, res) => {
  const usuario = usuarios.find(u => u.id == req.params.userId);
  usuario.wishlist.push(req.body);

  res.json({ mensaje: "Añadido a favoritos", wishlist: usuario.wishlist });
});

router.delete("/:userId/wishlist/:productoId", (req, res) => {
  const usuario = usuarios.find(u => u.id == req.params.userId);
  usuario.wishlist = usuario.wishlist.filter(p => p.productoId != req.params.productoId);

  res.json({ mensaje: "Eliminado de favoritos" });
});

// ---------------- MÉTODOS DE PAGO ----------------
router.get("/:userId/metodos-pago", (req, res) => {
  const usuario = usuarios.find(u => u.id == req.params.userId);
  res.json(usuario?.metodosPago || []);
});

router.post("/:userId/metodos-pago", (req, res) => {
  const usuario = usuarios.find(u => u.id == req.params.userId);
  usuario.metodosPago.push(req.body);

  res.json({ mensaje: "Método de pago añadido", metodosPago: usuario.metodosPago });
});

router.delete("/:userId/metodos-pago/:metodoId", (req, res) => {
  const usuario = usuarios.find(u => u.id == req.params.userId);
  usuario.metodosPago = usuario.metodosPago.filter(m => m.id != req.params.metodoId);

  res.json({ mensaje: "Método de pago eliminado" });
});

module.exports = router;
