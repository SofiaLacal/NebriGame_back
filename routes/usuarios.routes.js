const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const { Usuario, Producto, Carrito, Wishlist, MetodoPago, Pedido, PedidoProducto, Direccion } = require("../models");

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
            }
        });

        const passwordMatch = await bcrypt.compare(contrasenna, usuario.contrasenna);
        if (!passwordMatch || !usuario) {
            return res.status(401).json({
                success: false,
                error: "Credenciales incorrectas"
            });
        } else {
            const usuarioData = {
                id: usuario.id,
                nombre: usuario.nombre,
                apellido1: usuario.apellido1,
                apellido2: usuario.apellido2,
                email: usuario.email,
                fecha_registro: usuario.fecha_registro
            }
            res.json({
                success: true,
                mensaje: "Login correcto",
                usuarioData
            });
        }
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
        const { nombre, apellido1, apellido2, email, contrasenna } = req.body;
        const hashedPassword = await bcrypt.hash(contrasenna, 10);
        const datosUsuario = { nombre, apellido1, apellido2, email, contrasenna: hashedPassword };
        const nuevoUsuario = await Usuario.create(datosUsuario);
        console.log(datosUsuario);

        const usuarioData = {
            id: nuevoUsuario.id,
            nombre: nuevoUsuario.nombre,
            apellido1: nuevoUsuario.apellido1,
            apellido2: nuevoUsuario.apellido2,
            email: nuevoUsuario.email,
            fecha_registro: nuevoUsuario.fecha_registro
        }
        res.status(201).json({
            success: true,
            mensaje: "Usuario registrado correctamente",
            usuario: usuarioData
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error en registro",
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
router.patch("/:userId", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const usuario = await Usuario.findByPk(userId);

        if (!usuario) {
            return res.status(404).json({
                success: false,
                error: "Usuario no encontrado"
            });
        }

        const { nombre, apellido1, apellido2, email, contrasenna, contrasennaActual } = req.body;

        const updateData = {};
        if (nombre) updateData.nombre = nombre;
        if (apellido1) updateData.apellido1 = apellido1;
        if (apellido2 !== undefined) updateData.apellido2 = apellido2;
        if (email) updateData.email = email;
        if (contrasennaActual && !contrasenna) {
            return res.status(400).json({
                success: false,
                error: "Debes indicar la contraseña nueva para cambiarla"
            });
        }
        if (contrasenna) {
            if (!contrasennaActual) {
                return res.status(400).json({
                    success: false,
                    error: "Debes indicar la contraseña actual para cambiarla"
                });
            }
            const passwordMatch = await bcrypt.compare(contrasennaActual, usuario.contrasenna);
            if (!passwordMatch) {
                return res.status(401).json({
                    success: false,
                    error: "Contraseña actual incorrecta"
                });
            }
            updateData.contrasenna = await bcrypt.hash(contrasenna, 10);
        }

        await usuario.update(updateData);

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

// Ver si un producto está en el carrito
router.get("/:userId/carrito/:productoId", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const productoId = parseInt(req.params.productoId);
        if (!userId || !productoId) {
            return res.status(400).json({
                success: false,
                error: "Usuario o producto no encontrado"
            });
        }
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
        return res.json({
            success: true,
            item: true
        });
    }
    catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al verificar si el producto está en el carrito",
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
            }],
            order: [['fecha_pedido', 'DESC']]
        });

        // Formatear para el frontend
        const pedidosFormateados = pedidos.map(pedido => ({
            id: pedido.id,
            fecha: pedido.fecha_pedido,
            total: parseFloat(pedido.total).toFixed(2),
            estado: pedido.estado,
            productos: pedido.detalles.map(detalle => ({
                nombre: detalle.producto.nombre,
                cantidad: detalle.cantidad,
                precio: parseFloat(detalle.precio_unitario).toFixed(2)
            }))
        }));

        res.json({
            success: true,
            total: pedidosFormateados.length,
            pedidos: pedidosFormateados
        });
    } catch (error) {
        console.error('Error al obtener historial:', error);
        res.status(500).json({
            success: false,
            message: "Error al obtener historial",
            error: error.message
        });
    }
});

// ============================================
// CREAR PEDIDO DIRECTO
// ============================================
router.post("/:userId/pedidos", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const { productos, total, direccion, estado, fecha } = req.body;

        if (!productos || productos.length === 0) {
            return res.status(400).json({
                success: false,
                error: "No hay productos en el pedido"
            });
        }

        // Obtener teléfono de la dirección o usar uno por defecto
        const telefono = direccion?.telefono || direccion?.telefonoContacto || '000000000';
        
        // Obtener o crear direccion_id
        let direccionId = direccion?.id;
        
        // Si no hay ID de dirección, crear una nueva (temporal)
        if (!direccionId && direccion) {
            const nuevaDireccion = await Direccion.create({
                usuario_id: userId,
                calle: direccion.calle || 'Sin especificar',
                numero_casa: direccion.numeroCasa || 'S/N',
                ciudad: direccion.ciudad || 'Sin especificar',
                codigo_postal: direccion.codigoPostal || '00000',
                region: direccion.region || 'peninsula',
                telefono_contacto: telefono
            });
            direccionId = nuevaDireccion.id;
        }
        
        // Si aún no hay direccion_id, usar una por defecto o fallar
        if (!direccionId) {
            return res.status(400).json({
                success: false,
                error: "Se requiere una dirección de envío"
            });
        }

        // Crear el pedido
        const nuevoPedido = await Pedido.create({
            usuario_id: userId,
            total: parseFloat(total),
            direccion_id: direccionId,
            telefono_contacto: telefono,
            metodo_pago_id: null,
            estado: estado || 'pendiente',
            fecha_pedido: fecha || new Date()
        });

        // Crear los detalles del pedido
        for (const prod of productos) {
            await PedidoProducto.create({
                pedido_id: nuevoPedido.id,
                producto_id: prod.producto_id,
                cantidad: prod.cantidad,
                precio_unitario: parseFloat(prod.precio),
                subtotal: parseFloat(prod.precio) * prod.cantidad
            });
        }

        // Vaciar el carrito
        await Carrito.destroy({
            where: { usuario_id: userId }
        });

        res.status(201).json({
            success: true,
            mensaje: "Pedido creado correctamente",
            pedido: nuevoPedido
        });
    } catch (error) {
        console.error('Error al crear pedido:', error);
        res.status(500).json({
            success: false,
            message: "Error al crear pedido",
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
// DIRECCIONES
// ============================================

// Ver direcciones
router.get("/:userId/direcciones", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);

        const direcciones = await Direccion.findAll({
            where: { usuario_id: userId }
        });

        const direccionesFormateadas = direcciones.map((d) => ({
            id: d.id,
            calle: d.calle,
            numeroCasa: d.numero_casa,
            ciudad: d.ciudad,
            codigoPostal: d.codigo_postal,
            region: d.region,
            telefonoContacto: d.telefono_contacto
        }));

        res.json({
            success: true,
            total: direccionesFormateadas.length,
            direcciones: direccionesFormateadas
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener direcciones",
            error: error.message
        });
    }
});

// Añadir dirección
router.post("/:userId/direcciones", async (req, res) => {
    try {
        const userId = parseInt(req.params.userId);
        const { region, ciudad, codigoPostal, calle, numeroCasa, telefono } = req.body;

        if (!ciudad || !codigoPostal || !calle || !numeroCasa || !telefono) {
            return res.status(400).json({
                success: false,
                error: "Faltan campos obligatorios (ciudad, codigoPostal, calle, numeroCasa, telefono)"
            });
        }

        const nuevaDireccion = await Direccion.create({
            usuario_id: userId,
            calle,
            numero_casa: numeroCasa,
            ciudad,
            codigo_postal: codigoPostal,
            region: region || 'peninsula',
            telefono_contacto: telefono
        });

        res.status(201).json({
            success: true,
            mensaje: "Dirección añadida",
            direccion: nuevaDireccion
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al añadir dirección",
            error: error.message
        });
    }
});

// Eliminar dirección
router.delete("/:userId/direcciones/:direccionId", async (req, res) => {
    try {
        const { userId, direccionId } = req.params;

        const resultado = await Direccion.destroy({
            where: {
                id: direccionId,
                usuario_id: userId
            }
        });

        if (resultado === 0) {
            return res.status(404).json({
                success: false,
                error: "Dirección no encontrada"
            });
        }

        res.json({
            success: true,
            mensaje: "Dirección eliminada"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar dirección",
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