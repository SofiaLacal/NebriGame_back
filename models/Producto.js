const videojuegosData = require('../data/videojuegos-data');
const consolasData = require('../data/consolas-data.json');
const merchandisingData = require('../data/merchandising-data');

// Servicio para combinar todos los productos
class ProductoService {
    constructor() {
        this.productos = this.combinarProductos();
    }

    combinarProductos() {
        const productos = [];
        let idCounter = 1;

        // Agregar videojuegos (IDs 1-6)
        videojuegosData.forEach((juego, index) => {
            productos.push({
                id: idCounter++,
                nombre: juego.nombre,
                precio: juego.precio,
                descripcion: juego.descripcion,
                stock: juego.stock,
                tipo: 'juego',
                ...juego
            });
        });

        // Agregar consolas (IDs 7-10)
        consolasData.consolas.forEach((consola) => {
            // Buscar datos adicionales de consolas si existen
            productos.push({
                id: consola.id,
                nombre: consola.nombre,
                precio: this.getPrecioConsola(consola.nombre),
                descripcion: this.getDescripcionConsola(consola.nombre),
                stock: this.getStockConsola(consola.nombre),
                tipo: 'consola',
                almacenamiento: consola.almacenamiento,
                color: consola.color,
                marca: consola.marca,
                categoria_id: consola.categoria_id
            });
        });

        // Agregar merchandising (IDs 11-16)
        merchandisingData.forEach((merch) => {
            productos.push({
                id: merch.id,
                nombre: merch.nombre,
                precio: merch.precio,
                descripcion: merch.descripcion,
                stock: merch.stock,
                tipo: 'merchandising',
                categoria: merch.categoria,
                juegoAsociado: merch.juegoAsociado
            });
        });

        return productos;
    }

    getPrecioConsola(nombre) {
        const precios = {
            'PlayStation 5 Standard': 549.99,
            'Xbox Series X': 499.99,
            'Nintendo Switch OLED': 349.99,
            'PlayStation 5 Digital': 449.99
        };
        return precios[nombre] || 0;
    }

    getDescripcionConsola(nombre) {
        const descripciones = {
            'PlayStation 5 Standard': 'Consola de nueva generación con lector de discos',
            'Xbox Series X': 'Consola más potente de Microsoft',
            'Nintendo Switch OLED': 'Versión mejorada de la Switch con pantalla OLED',
            'PlayStation 5 Digital': 'Versión digital sin lector de discos'
        };
        return descripciones[nombre] || '';
    }

    getStockConsola(nombre) {
        const stocks = {
            'PlayStation 5 Standard': 10,
            'Xbox Series X': 8,
            'Nintendo Switch OLED': 12,
            'PlayStation 5 Digital': 5
        };
        return stocks[nombre] || 0;
    }

    // Métodos tipo Sequelize
    async findAll(options = {}) {
        let productos = [...this.productos];

        // Aplicar filtros
        if (options.where) {
            if (options.where.tipo) {
                productos = productos.filter(p => p.tipo === options.where.tipo);
            }
            if (options.where.id) {
                productos = productos.filter(p => p.id === parseInt(options.where.id));
            }
            if (options.where.precio) {
                const precioFilter = options.where.precio;
                // Manejar operadores de Sequelize (Op.gte, Op.lte, etc.)
                if (precioFilter.gte !== undefined) {
                    productos = productos.filter(p => p.precio >= precioFilter.gte);
                }
                if (precioFilter.lte !== undefined) {
                    productos = productos.filter(p => p.precio <= precioFilter.lte);
                }
                if (precioFilter.gt !== undefined) {
                    productos = productos.filter(p => p.precio > precioFilter.gt);
                }
                if (precioFilter.lt !== undefined) {
                    productos = productos.filter(p => p.precio < precioFilter.lt);
                }
            }
        }

        return productos;
    }

    async findByPk(id) {
        return this.productos.find(p => p.id === parseInt(id)) || null;
    }

    async findOne(options = {}) {
        const productos = await this.findAll(options);
        return productos.length > 0 ? productos[0] : null;
    }
}

// Crear instancia singleton
const productoService = new ProductoService();

module.exports = productoService;

