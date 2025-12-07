
const productos = [
  { id: 1, 
    tipo: 'videojuego', 
    nombre: 'Elden Ring', 
    descripcion: 'Action RPG épico', 
    precio: 59.99, 
    stock: 25, 
    categoria: 'RPG', 
    plataforma: 'PC', 
    edadMinima: 16 },
  {
    id: 2,
    tipo: 'videojuego',
    nombre: 'FIFA 25',
    descripcion: 'Simulador de fútbol',
    precio: 49.99,
    stock: 40,
    categoria: 'Deportes',
    plataforma: 'PS5',
    edadMinima: 3
  },
  {
    id: 3,
    tipo: 'videojuego',
    nombre: 'Resident Evil 4 Remake',
    descripcion: 'Survival horror',
    precio: 39.99,
    stock: 12,
    categoria: 'Terror',
    plataforma: 'PS5',
    edadMinima: 18
  },

  // -------- MERCHANDISING --------
  {
    id: 10,
    tipo: 'merchandising',
    nombre: 'Figura Elden Ring',
    descripcion: 'Figura coleccionable del personaje',
    precio: 29.99,
    stock: 10,
    categoria: 'Figuras',
    juegoAsociado: 'Elden Ring'
  },

  // -------- CONSOLAS --------
  {
    id: 20,
    tipo: 'consola',
    nombre: 'PlayStation 5',
    descripcion: 'Consola Sony de última generación',
    precio: 499.99,
    stock: 8,
    plataforma: 'PlayStation',
    fabricante: 'Sony'
  }
];

// -------- USUARIOS --------
const usuarios = [
  { id: 1, nombreUsuario: 'ana', email: 'ana@example.com' },
  { id: 2, nombreUsuario: 'juan', email: 'juan@example.com' }
];

// -------- PEDIDOS --------
let pedidos = [];

// -------- CARRITOS --------
// formato: { userId: [ { productoId, cantidad } ] }
let carritos = {};

module.exports = {
  productos,
  usuarios,
  pedidos,
  carritos
};
