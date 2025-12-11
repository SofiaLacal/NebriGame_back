const express = require("express");
const router = express.Router();
const { Usuario, Producto, Carrito, Wishlist, MetodoPago } = require("../models");

// ---------------- TODOS LOS USUARIOS ----------------
router.get("/", async (req, res) => {
    try {
        const usuarios = await Usuario.findAll();

        res.json({
            success: true,
            total: usuarios.length,
            usuarios
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener usuarios",
            error: error.message
        });
    }
});

// ---------------- LOGIN ----------------
router.post("/login", async (req, res) => {
    try {
        const { email, contrasenna } = req.body;

        const usuario = await Usuario.findOne({
            where: { 
                email: email,
                contrasenna: contrasenna 
            }
        });

        if (!usuario) {
            return res.status(401).json({
                success: false,
                error: "Credenciales incorrectas"
            });
        }

        res.json({
            success: true,
            mensaje: "Login correcto",
            usuario
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error en login",
            error: error.message
        });
    }
});

// ---------------- REGISTRO ----------------
router.post("/registro", async (req, res) => {
    try {
        const nuevoUsuario = await Usuario.create(req.body);

        res.status(201).json({
            success: true,
            mensaje: "Usuario registrado correctamente",
            usuario: nuevoUsuario
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al registrar usuario",
            error: error.message
        });
    }
});

// ---------------- PERFIL ----------------
router.get("/:userId", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const usuario = await Usuario.findByPk(userId);

        if (!usuario) {
            return res.status(404).json({
                success: false,
                error: "Usuario no encontrado"
            });
        }

        res.json({
            success: true,
            usuario
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener usuario",
            error: error.message
        });
    }
});

// ---------------- ACTUALIZAR PERFIL ----------------
router.put("/:userId", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const usuario = await Usuario.findByPk(userId);

        if (!usuario) {
            return res.status(404).json({
                success: false,
                error: "Usuario no encontrado"
            });
        }

        await usuario.update(req.body);

        res.json({
            success: true,
            mensaje: "Perfil actualizado",
            usuario
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar perfil",
            error: error.message
        });
    }
});

// ---------------- ELIMINAR USUARIO ----------------
router.delete("/:userId", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const usuario = await Usuario.findByPk(userId);

        if (!usuario) {
            return res.status(404).json({
                success: false,
                error: "Usuario no encontrado"
            });
        }

        await usuario.destroy();

        res.json({
            success: true,
            mensaje: "Usuario eliminado correctamente"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar usuario",
            error: error.message
        });
    }
});

// ============================================
// CARRITO (necesitarás crear el modelo Carrito)
// ============================================

// Ver carrito
router.get("/:userId/carrito", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        
        // Nota: Necesitarás crear el modelo Carrito
        // Por ahora devuelvo mensaje
        res.json({
            success: true,
            mensaje: "Endpoint de carrito - necesita modelo Carrito",
            carrito: []
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener carrito",
            error: error.message
        });
    }
});

// Añadir al carrito
router.post("/:userId/carrito", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const { producto_id, cantidad } = req.body;

        // Aquí usarías el modelo Carrito cuando lo crees
        res.json({
            success: true,
            mensaje: "Producto añadido al carrito (requiere modelo Carrito)"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir al carrito",
            error: error.message
        });
    }
});

// Eliminar del carrito
router.delete("/:userId/carrito/:productoId", async (req, res) => {
    try {
        const { userId, productoId } = req.params;

        res.json({
            success: true,
            mensaje: "Producto eliminado del carrito (requiere modelo Carrito)"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar del carrito",
            error: error.message
        });
    }
});

// ============================================
// WISHLIST (necesitarás crear el modelo Wishlist)
// ============================================

router.get("/:userId/wishlist", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        res.json({
            success: true,
            mensaje: "Endpoint de wishlist - necesita modelo Wishlist",
            wishlist: []
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener wishlist",
            error: error.message
        });
    }
});

router.post("/:userId/wishlist", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        res.json({
            success: true,
            mensaje: "Añadido a wishlist (requiere modelo Wishlist)"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir a wishlist",
            error: error.message
        });
    }
});

router.delete("/:userId/wishlist/:productoId", async (req, res) => {
    try {
        res.json({
            success: true,
            mensaje: "Eliminado de wishlist (requiere modelo Wishlist)"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar de wishlist",
            error: error.message
        });
    }
});

// ============================================
// MÉTODOS DE PAGO (necesitarás crear el modelo MetodoPago)
// ============================================

router.get("/:userId/metodos-pago", async (req, res) => {
    try {
        res.json({
            success: true,
            mensaje: "Endpoint de métodos de pago - necesita modelo MetodoPago",
            metodosPago: []
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener métodos de pago",
            error: error.message
        });
    }
});

router.post("/:userId/metodos-pago", async (req, res) => {
    try {
        res.json({
            success: true,
            mensaje: "Método de pago añadido (requiere modelo MetodoPago)"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir método de pago",
            error: error.message
        });
    }
});

router.delete("/:userId/metodos-pago/:metodoId", async (req, res) => {
    try {
        res.json({
            success: true,
            mensaje: "Método de pago eliminado (requiere modelo MetodoPago)"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar método de pago",
            error: error.message
        });
    }
});

module.exports = router;