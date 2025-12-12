const express = require("express");
const router = express.Router();
const { Usuario, Producto, Carrito, Wishlist, MetodoPago, Pedido, PedidoProducto } = require("../models");

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
// CARRITO
// ============================================

// Ver carrito
router.get("/:userId/carrito", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        
        const carrito = await Carrito.findAll({
            where: { usuario_id: userId },
            include: [{
                model: Producto,
                as: 'producto'
            }]
        });

        res.json({
            success: true,
            total: carrito.length,
            carrito
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

        // Verificar si el producto ya está en el carrito
        const itemExistente = await Carrito.findOne({
            where: {
                usuario_id: userId,
                producto_id: producto_id
            }
        });

        if (itemExistente) {
            // Actualizar cantidad
            itemExistente.cantidad += cantidad || 1;
            await itemExistente.save();

            return res.json({
                success: true,
                mensaje: "Cantidad actualizada en el carrito",
                carrito: itemExistente
            });
        }

        // Crear nuevo item en carrito
        const nuevoItem = await Carrito.create({
            usuario_id: userId,
            producto_id,
            cantidad: cantidad || 1
        });

        res.status(201).json({
            success: true,
            mensaje: "Producto añadido al carrito",
            carrito: nuevoItem
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir al carrito",
            error: error.message
        });
    }
});

// Actualizar cantidad en carrito
router.put("/:userId/carrito/:productoId", async (req, res) => {
    try {
        const { userId, productoId } = req.params;
        const { cantidad } = req.body;

        const item = await Carrito.findOne({
            where: {
                usuario_id: userId,
                producto_id: productoId
            }
        });

        if (!item) {
            return res.status(404).json({
                success: false,
                error: "Producto no encontrado en el carrito"
            });
        }

        item.cantidad = cantidad;
        await item.save();

        res.json({
            success: true,
            mensaje: "Cantidad actualizada",
            carrito: item
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar carrito",
            error: error.message
        });
    }
});

// Eliminar del carrito
router.delete("/:userId/carrito/:productoId", async (req, res) => {
    try {
        const { userId, productoId } = req.params;

        const resultado = await Carrito.destroy({
            where: {
                usuario_id: userId,
                producto_id: productoId
            }
        });

        if (resultado === 0) {
            return res.status(404).json({
                success: false,
                error: "Producto no encontrado en el carrito"
            });
        }

        res.json({
            success: true,
            mensaje: "Producto eliminado del carrito"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar del carrito",
            error: error.message
        });
    }
});

// Completar compra (crear pedido)
router.post("/:userId/carrito/comprar", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const { metodo_pago_id, direccion_envio, telefono_contacto, notas } = req.body;

        // Obtener items del carrito
        const itemsCarrito = await Carrito.findAll({
            where: { usuario_id: userId },
            include: [{
                model: Producto,
                as: 'producto'
            }]
        });

        if (itemsCarrito.length === 0) {
            return res.status(400).json({
                success: false,
                error: "El carrito está vacío"
            });
        }

        // Calcular total
        let total = 0;
        itemsCarrito.forEach(item => {
            total += parseFloat(item.producto.precio) * item.cantidad;
        });

        // Crear pedido
        const nuevoPedido = await Pedido.create({
            usuario_id: userId,
            metodo_pago_id,
            total,
            direccion_envio,
            telefono_contacto,
            notas,
            estado: 'pendiente'
        });

        // Crear pedido_productos
        for (const item of itemsCarrito) {
            const precioUnitario = parseFloat(item.producto.precio);
            const subtotal = precioUnitario * item.cantidad;

            await PedidoProducto.create({
                pedido_id: nuevoPedido.id,
                producto_id: item.producto_id,
                cantidad: item.cantidad,
                precio_unitario: precioUnitario,
                subtotal: subtotal
            });
        }

        // Vaciar carrito
        await Carrito.destroy({
            where: { usuario_id: userId }
        });

        res.status(201).json({
            success: true,
            mensaje: "Compra realizada correctamente",
            pedido: nuevoPedido
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al completar la compra",
            error: error.message
        });
    }
});

// ============================================
// HISTORIAL DE COMPRAS
// ============================================
router.get("/:userId/historial-compras", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        const pedidos = await Pedido.findAll({
            where: { usuario_id: userId },
            include: [{
                model: PedidoProducto,
                as: 'detalles',
                include: [{
                    model: Producto,
                    as: 'producto'
                }]
            }, {
                model: MetodoPago,
                as: 'metodoPago'
            }],
            order: [['fecha_pedido', 'DESC']]
        });

        res.json({
            success: true,
            total: pedidos.length,
            historial: pedidos
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener historial",
            error: error.message
        });
    }
});

// ============================================
// WISHLIST
// ============================================

// Ver wishlist
router.get("/:userId/wishlist", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        const wishlist = await Wishlist.findAll({
            where: { usuario_id: userId },
            include: [{
                model: Producto,
                as: 'producto'
            }]
        });

        res.json({
            success: true,
            total: wishlist.length,
            wishlist
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener wishlist",
            error: error.message
        });
    }
});

// Añadir a wishlist
router.post("/:userId/wishlist", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const { producto_id } = req.body;

        // Verificar si ya existe
        const existente = await Wishlist.findOne({
            where: {
                usuario_id: userId,
                producto_id: producto_id
            }
        });

        if (existente) {
            return res.status(400).json({
                success: false,
                error: "El producto ya está en la wishlist"
            });
        }

        const nuevoItem = await Wishlist.create({
            usuario_id: userId,
            producto_id
        });

        res.status(201).json({
            success: true,
            mensaje: "Añadido a favoritos",
            wishlist: nuevoItem
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir a wishlist",
            error: error.message
        });
    }
});

// Eliminar de wishlist
router.delete("/:userId/wishlist/:productoId", async (req, res) => {
    try {
        const { userId, productoId } = req.params;

        const resultado = await Wishlist.destroy({
            where: {
                usuario_id: userId,
                producto_id: productoId
            }
        });

        if (resultado === 0) {
            return res.status(404).json({
                success: false,
                error: "Producto no encontrado en favoritos"
            });
        }

        res.json({
            success: true,
            mensaje: "Eliminado de favoritos"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar de wishlist",
            error: error.message
        });
    }
});

// Eliminar wishlist completa
router.delete("/:userId/wishlist", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        await Wishlist.destroy({
            where: { usuario_id: userId }
        });

        res.json({
            success: true,
            mensaje: "Wishlist eliminada completamente"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar wishlist",
            error: error.message
        });
    }
});

// ============================================
// MÉTODOS DE PAGO
// ============================================

// Ver métodos de pago
router.get("/:userId/metodos-pago", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        const metodosPago = await MetodoPago.findAll({
            where: { usuario_id: userId }
        });

        res.json({
            success: true,
            total: metodosPago.length,
            metodosPago
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener métodos de pago",
            error: error.message
        });
    }
});

// Añadir método de pago
router.post("/:userId/metodos-pago", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const { tipo, detalles } = req.body;

        const nuevoMetodo = await MetodoPago.create({
            tipo,
            detalles,
            usuario_id: userId
        });

        res.status(201).json({
            success: true,
            mensaje: "Método de pago añadido",
            metodoPago: nuevoMetodo
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir método de pago",
            error: error.message
        });
    }
});

// Actualizar método de pago
router.put("/:userId/metodos-pago/:metodoId", async (req, res) => {
    try {
        const { userId, metodoId } = req.params;
        
        const metodo = await MetodoPago.findOne({
            where: {
                id: metodoId,
                usuario_id: userId
            }
        });

        if (!metodo) {
            return res.status(404).json({
                success: false,
                error: "Método de pago no encontrado"
            });
        }

        await metodo.update(req.body);

        res.json({
            success: true,
            mensaje: "Método de pago actualizado",
            metodoPago: metodo
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar método de pago",
            error: error.message
        });
    }
});

// Eliminar método de pago
router.delete("/:userId/metodos-pago/:metodoId", async (req, res) => {
    try {
        const { userId, metodoId } = req.params;

        const resultado = await MetodoPago.destroy({
            where: {
                id: metodoId,
                usuario_id: userId
            }
        });

        if (resultado === 0) {
            return res.status(404).json({
                success: false,
                error: "Método de pago no encontrado"
            });
        }

        res.json({
            success: true,
            mensaje: "Método de pago eliminado"
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