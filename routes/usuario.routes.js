/* const express = require("express");
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

module.exports = router; */

const express = require("express");
const router = express.Router();

// ---------------- IMPORTAR DATOS ----------------
const usuariosData = require("../data/usuarios-data.json");
const productosData = require("../data/productos.json");

let usuarios = usuariosData.usuarios;
let productos = productosData.productos;

// ---------------- LOGIN ----------------
router.post("/login", (req, res) => {
  console.log("POST /usuario/login");
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
  console.log("POST /usuario/registro");
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
  console.log(`GET /usuario/${userId}`);

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
  console.log(`PUT /usuario/${userId}`);
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
