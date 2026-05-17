const express = require("express");
const router = express.Router();
const { Op } = require("sequelize");
const {
    sequelize,
    Producto,
    Juego,
    Consola,
    Merchandising,
    JuegoPlataforma,
    Pedido,
    PedidoProducto,
    Direccion,
    Usuario,
    MetodoPago,
    Plataforma,
} = require("../models");
const { authenticateAccessToken, requireAdmin } = require("../middleware/auth.middleware");

router.use(authenticateAccessToken, requireAdmin);

const ESTADOS_PEDIDO = ["pendiente", "procesando", "enviado", "entregado", "cancelado"];

// ---------------- CREAR PRODUCTO GENÉRICO ----------------
router.post("/productos", async (req, res) => {
    try {
        const nuevoProducto = await Producto.create(req.body);

        res.status(201).json({
            success: true,
            mensaje: "Producto creado correctamente",
            producto: nuevoProducto
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al crear producto",
            error: error.message
        });
    }
});

// ---------------- ACTUALIZAR PRODUCTO ----------------
router.put("/productos/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const producto = await Producto.findByPk(id);

        if (!producto) {
            return res.status(404).json({
                success: false,
                error: "Producto no encontrado"
            });
        }

        const allowed = ["nombre", "precio", "descripcion", "imagen_url"];
        const patch = {};
        for (const k of allowed) {
            if (req.body[k] !== undefined) patch[k] = req.body[k];
        }

        await producto.update(patch);
        await producto.reload();

        res.json({
            success: true,
            mensaje: "Producto actualizado correctamente",
            producto
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar producto",
            error: error.message
        });
    }
});

// ---------------- ELIMINAR PRODUCTO ----------------
router.delete("/productos/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const producto = await Producto.findByPk(id);

        if (!producto) {
            return res.status(404).json({
                success: false,
                error: "Producto no encontrado"
            });
        }

        await producto.destroy();

        res.json({
            success: true,
            mensaje: "Producto eliminado correctamente"
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al eliminar producto",
            error: error.message
        });
    }
});

// ---------------- CREAR VIDEOJUEGO ----------------
router.post("/juegos", async (req, res) => {
    try {
        const { genero, edad_minima, plataforma_id, control_stock, ...productoData } = req.body;

        const pid = parseInt(plataforma_id, 10);
        if (Number.isNaN(pid)) {
            return res.status(400).json({
                success: false,
                error: "plataforma_id es obligatorio para crear un juego",
            });
        }

        const t = await sequelize.transaction();
        try {
            const nuevoProducto = await Producto.create(
                {
                    ...productoData,
                    tipo: "juego",
                },
                { transaction: t }
            );

            const nuevoJuego = await Juego.create(
                {
                    producto_id: nuevoProducto.id,
                    genero,
                    edad_minima: edad_minima ?? 0,
                },
                { transaction: t }
            );

            await JuegoPlataforma.create(
                {
                    juego_id: nuevoProducto.id,
                    plataforma_id: pid,
                    control_stock: control_stock ?? 0,
                },
                { transaction: t }
            );

            await t.commit();

            res.status(201).json({
                success: true,
                mensaje: "Videojuego creado correctamente",
                producto: nuevoProducto,
                juego: nuevoJuego,
            });
        } catch (err) {
            await t.rollback();
            throw err;
        }
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al crear videojuego",
            error: error.message,
        });
    }
});

// ---------------- CREAR CONSOLA ----------------
router.post("/consolas", async (req, res) => {
    try {
        const {
            capacidad_almacenamiento,
            color,
            fabricante,
            plataforma_id,
            control_stock,
            ...productoData
        } = req.body;

        // Crear producto base
        const nuevoProducto = await Producto.create({
            ...productoData,
            tipo: 'consola'
        });

        // Crear datos específicos de la consola
        const nuevaConsola = await Consola.create({
            producto_id: nuevoProducto.id,
            capacidad_almacenamiento,
            color,
            fabricante,
            plataforma_id,
            control_stock: control_stock ?? 0,
        });

        res.status(201).json({
            success: true,
            mensaje: "Consola creada correctamente",
            producto: nuevoProducto,
            consola: nuevaConsola
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al crear consola",
            error: error.message
        });
    }
});

// ---------------- CREAR MERCHANDISING ----------------
router.post("/merchandising", async (req, res) => {
    try {
        const { categoria, control_stock, ...productoData } = req.body;

        // Crear producto base
        const nuevoProducto = await Producto.create({
            ...productoData,
            tipo: 'merchandising'
        });

        // Crear datos específicos del merchandising
        const nuevoMerchandising = await Merchandising.create({
            producto_id: nuevoProducto.id,
            categoria,
            control_stock: control_stock ?? 0,
        });

        res.status(201).json({
            success: true,
            mensaje: "Producto de merchandising creado correctamente",
            producto: nuevoProducto,
            merchandising: nuevoMerchandising
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al crear merchandising",
            error: error.message
        });
    }
});

// ---------------- ACTUALIZAR VIDEOJUEGO ----------------
router.put("/juegos/:productoId", async (req, res) => {
    try {
        const productoId = parseInt(req.params.productoId, 10);
        if (Number.isNaN(productoId)) {
            return res.status(400).json({ success: false, error: "ID inválido" });
        }

        const producto = await Producto.findByPk(productoId);
        if (!producto || producto.tipo !== "juego") {
            return res.status(404).json({ success: false, error: "Videojuego no encontrado" });
        }

        const {
            nombre,
            precio,
            descripcion,
            imagen_url,
            genero,
            edad_minima,
            plataforma_id,
            control_stock,
        } = req.body;

        const pid = parseInt(plataforma_id, 10);
        if (Number.isNaN(pid)) {
            return res.status(400).json({
                success: false,
                error: "plataforma_id obligatorio",
            });
        }

        const t = await sequelize.transaction();
        try {
            await producto.update(
                {
                    nombre: nombre ?? producto.nombre,
                    precio: precio ?? producto.precio,
                    descripcion: descripcion !== undefined ? descripcion : producto.descripcion,
                    imagen_url: imagen_url !== undefined ? imagen_url : producto.imagen_url,
                },
                { transaction: t }
            );

            const juegoPatch = {};
            if (genero !== undefined) juegoPatch.genero = genero;
            if (edad_minima !== undefined) juegoPatch.edad_minima = edad_minima;
            if (Object.keys(juegoPatch).length > 0) {
                await Juego.update(juegoPatch, {
                    where: { producto_id: productoId },
                    transaction: t,
                });
            }

            await JuegoPlataforma.destroy({
                where: { juego_id: productoId },
                transaction: t,
            });
            await JuegoPlataforma.create(
                {
                    juego_id: productoId,
                    plataforma_id: pid,
                    control_stock: control_stock ?? 0,
                },
                { transaction: t }
            );

            await t.commit();

            const actualizado = await Producto.findByPk(productoId, {
                include: [
                    {
                        model: Juego,
                        as: "juego",
                        include: [{ model: Plataforma, as: "plataformas" }],
                    },
                ],
            });

            res.json({
                success: true,
                mensaje: "Videojuego actualizado",
                producto: actualizado,
            });
        } catch (err) {
            await t.rollback();
            throw err;
        }
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar videojuego",
            error: error.message,
        });
    }
});

// ---------------- ACTUALIZAR CONSOLA ----------------
router.put("/consolas/:productoId", async (req, res) => {
    try {
        const productoId = parseInt(req.params.productoId, 10);
        if (Number.isNaN(productoId)) {
            return res.status(400).json({ success: false, error: "ID inválido" });
        }

        const producto = await Producto.findByPk(productoId);
        if (!producto || producto.tipo !== "consola") {
            return res.status(404).json({ success: false, error: "Consola no encontrada" });
        }

        const {
            nombre,
            precio,
            descripcion,
            imagen_url,
            capacidad_almacenamiento,
            color,
            fabricante,
            plataforma_id,
            control_stock,
        } = req.body;

        await producto.update({
            nombre: nombre ?? producto.nombre,
            precio: precio ?? producto.precio,
            descripcion: descripcion !== undefined ? descripcion : producto.descripcion,
            imagen_url: imagen_url !== undefined ? imagen_url : producto.imagen_url,
        });

        const consola = await Consola.findByPk(productoId);
        if (!consola) {
            return res.status(404).json({ success: false, error: "Fila consola no encontrada" });
        }

        await consola.update({
            capacidad_almacenamiento:
                capacidad_almacenamiento ?? consola.capacidad_almacenamiento,
            color: color !== undefined ? color : consola.color,
            fabricante: fabricante ?? consola.fabricante,
            plataforma_id: plataforma_id != null ? plataforma_id : consola.plataforma_id,
            control_stock: control_stock !== undefined ? control_stock : consola.control_stock,
        });

        const actualizado = await Producto.findByPk(productoId, {
            include: [
                {
                    model: Consola,
                    as: "consola",
                    include: [{ model: Plataforma, as: "plataforma" }],
                },
            ],
        });

        res.json({
            success: true,
            mensaje: "Consola actualizada",
            producto: actualizado,
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar consola",
            error: error.message,
        });
    }
});

// ---------------- ACTUALIZAR MERCHANDISING ----------------
router.put("/merchandising/:productoId", async (req, res) => {
    try {
        const productoId = parseInt(req.params.productoId, 10);
        if (Number.isNaN(productoId)) {
            return res.status(400).json({ success: false, error: "ID inválido" });
        }

        const producto = await Producto.findByPk(productoId);
        if (!producto || producto.tipo !== "merchandising") {
            return res.status(404).json({ success: false, error: "Merchandising no encontrado" });
        }

        const { nombre, precio, descripcion, imagen_url, categoria, control_stock } = req.body;

        await producto.update({
            nombre: nombre ?? producto.nombre,
            precio: precio ?? producto.precio,
            descripcion: descripcion !== undefined ? descripcion : producto.descripcion,
            imagen_url: imagen_url !== undefined ? imagen_url : producto.imagen_url,
        });

        const merch = await Merchandising.findByPk(productoId);
        if (!merch) {
            return res.status(404).json({ success: false, error: "Fila merchandising no encontrada" });
        }

        await merch.update({
            categoria: categoria ?? merch.categoria,
            control_stock: control_stock !== undefined ? control_stock : merch.control_stock,
        });

        const actualizado = await Producto.findByPk(productoId, {
            include: [{ model: Merchandising, as: "merchandising" }],
        });

        res.json({
            success: true,
            mensaje: "Merchandising actualizado",
            producto: actualizado,
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar merchandising",
            error: error.message,
        });
    }
});

// ---------------- LISTAR PEDIDOS (admin) ----------------
router.get("/pedidos", async (req, res) => {
    try {
        const qRaw = req.query.q != null ? String(req.query.q).trim() : "";
        const filtro = req.query.filtro === "cliente" ? "cliente" : "id";

        const wherePedido = {};
        const usuarioInclude = {
            model: Usuario,
            as: "usuario",
            required: false,
            attributes: ["id", "nombre", "apellido1", "email"],
        };

        if (qRaw) {
            if (filtro === "id") {
                const nid = parseInt(qRaw, 10);
                if (Number.isNaN(nid)) {
                    return res.json({ success: true, total: 0, pedidos: [] });
                }
                wherePedido.id = nid;
            } else {
                usuarioInclude.required = true;
                usuarioInclude.where = {
                    [Op.or]: [
                        { email: { [Op.like]: `%${qRaw}%` } },
                        { nombre: { [Op.like]: `%${qRaw}%` } },
                    ],
                };
            }
        }

        const pedidos = await Pedido.findAll({
            where: wherePedido,
            include: [
                usuarioInclude,
                { model: Direccion, as: "direccion" },
                {
                    model: PedidoProducto,
                    as: "detalles",
                    include: [
                        {
                            model: Producto,
                            as: "producto",
                            attributes: ["id", "nombre", "tipo"],
                        },
                        { model: Plataforma, as: "plataforma", required: false },
                    ],
                },
                { model: MetodoPago, as: "metodoPago", required: false },
            ],
            order: [["fecha_pedido", "DESC"]],
        });

        res.json({
            success: true,
            total: pedidos.length,
            pedidos,
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al listar pedidos",
            error: error.message,
        });
    }
});

// ---------------- DETALLE PEDIDO (admin) ----------------
router.get("/pedidos/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10);
        if (Number.isNaN(id)) {
            return res.status(400).json({ success: false, error: "ID inválido" });
        }

        const pedido = await Pedido.findByPk(id, {
            include: [
                {
                    model: Usuario,
                    as: "usuario",
                    required: false,
                    attributes: ["id", "nombre", "apellido1", "apellido2", "email"],
                },
                { model: Direccion, as: "direccion" },
                {
                    model: PedidoProducto,
                    as: "detalles",
                    include: [
                        {
                            model: Producto,
                            as: "producto",
                            attributes: ["id", "nombre", "tipo"],
                        },
                        { model: Plataforma, as: "plataforma", required: false },
                    ],
                },
                { model: MetodoPago, as: "metodoPago", required: false },
            ],
        });

        if (!pedido) {
            return res.status(404).json({ success: false, error: "Pedido no encontrado" });
        }

        res.json({ success: true, pedido });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al obtener pedido",
            error: error.message,
        });
    }
});

// ---------------- ACTUALIZAR PEDIDO (admin) ----------------
// Campos habituales: estado, telefono_contacto, direccion{…}, notas.
// Ampliaciones futuras posibles: total, metodo_pago_id, líneas del pedido, etc.
router.patch("/pedidos/:id", async (req, res) => {
    try {
        const id = parseInt(req.params.id, 10);
        if (Number.isNaN(id)) {
            return res.status(400).json({ success: false, error: "ID inválido" });
        }

        const pedido = await Pedido.findByPk(id);
        if (!pedido) {
            return res.status(404).json({ success: false, error: "Pedido no encontrado" });
        }

        const {
            estado,
            telefono_contacto,
            direccion: direccionBody,
            notas,
        } = req.body;

        const updates = { fecha_actualizacion: new Date() };

        if (estado !== undefined) {
            if (!ESTADOS_PEDIDO.includes(estado)) {
                return res.status(400).json({
                    success: false,
                    error: `estado debe ser uno de: ${ESTADOS_PEDIDO.join(", ")}`,
                });
            }
            updates.estado = estado;
        }
        if (telefono_contacto !== undefined) {
            updates.telefono_contacto = telefono_contacto;
        }
        if (notas !== undefined) {
            updates.notas = notas;
        }

        await pedido.update(updates);

        if (pedido.direccion_id && direccionBody && typeof direccionBody === "object") {
            const dirRow = await Direccion.findByPk(pedido.direccion_id);
            if (dirRow) {
                const dirPatch = {};
                const campos = ["calle", "numero_casa", "ciudad", "codigo_postal", "region"];
                for (const k of campos) {
                    if (direccionBody[k] !== undefined) dirPatch[k] = direccionBody[k];
                }
                if (telefono_contacto !== undefined) {
                    dirPatch.telefono_contacto = telefono_contacto;
                }
                if (Object.keys(dirPatch).length > 0) {
                    await dirRow.update(dirPatch);
                }
            }
        }
        await pedido.reload({
            include: [
                {
                    model: Usuario,
                    as: "usuario",
                    required: false,
                    attributes: ["id", "nombre", "apellido1", "email"],
                },
                { model: Direccion, as: "direccion" },
                {
                    model: PedidoProducto,
                    as: "detalles",
                    include: [
                        {
                            model: Producto,
                            as: "producto",
                            attributes: ["id", "nombre", "tipo"],
                        },
                        { model: Plataforma, as: "plataforma", required: false },
                    ],
                },
                { model: MetodoPago, as: "metodoPago", required: false },
            ],
        });

        res.json({
            success: true,
            mensaje: "Pedido actualizado",
            pedido,
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al actualizar pedido",
            error: error.message,
        });
    }
});

module.exports = router;