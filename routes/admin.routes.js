const express = require("express");
const router = express.Router();
const { Producto, Juego, Consola, Merchandising } = require("../models");

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

        await producto.update(req.body);
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
        const { genero, edad_minima, plataforma_id, ...productoData } = req.body;

        // Crear producto base
        const nuevoProducto = await Producto.create({
            ...productoData,
            tipo: 'juego'
        });

        // Crear datos específicos del juego
        const nuevoJuego = await Juego.create({
            producto_id: nuevoProducto.id,
            genero,
            edad_minima,
            plataforma_id
        });

        res.status(201).json({
            success: true,
            mensaje: "Videojuego creado correctamente",
            producto: nuevoProducto,
            juego: nuevoJuego
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al crear videojuego",
            error: error.message
        });
    }
});

// ---------------- CREAR CONSOLA ----------------
router.post("/consolas", async (req, res) => {
    try {
        const { capacidad_almacenamiento, color, fabricante, plataforma_id, ...productoData } = req.body;

        // Crear producto base
        const nuevoProducto = await Producto.create({
            ...productoData,
            tipo: 'consola'
        });

        // Crear datos específicos de la consola
        const nuevaConsola = await Consola.create({
            producto_id: nuevoProducto.id,
            nombre: productoData.nombre,
            capacidad_almacenamiento,
            color,
            fabricante,
            plataforma_id
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
        const { categoria, ...productoData } = req.body;

        // Crear producto base
        const nuevoProducto = await Producto.create({
            ...productoData,
            tipo: 'merchandising'
        });

        // Crear datos específicos del merchandising
        const nuevoMerchandising = await Merchandising.create({
            producto_id: nuevoProducto.id,
            categoria
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

module.exports = router;