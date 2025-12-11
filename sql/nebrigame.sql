DROP DATABASE IF EXISTS nebrigame;

CREATE DATABASE nebrigame;
USE nebrigame;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    DNI VARCHAR(9) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasenna VARCHAR(255) NOT NULL
);

CREATE TABLE metodo_pago(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    detalles VARCHAR(255) NOT NULL,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_metodo_pago_usuario (usuario_id)
);

CREATE TABLE plataforma(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla base de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    stock INT NOT NULL DEFAULT 0,
    tipo ENUM('merchandising', 'juego', 'consola') NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_tipo_producto CHECK (tipo IN ('merchandising', 'juego', 'consola')),
    INDEX idx_productos_tipo (tipo),
    INDEX idx_productos_precio (precio),
    INDEX idx_productos_nombre (nombre)
);

-- Tabla de merchandising
CREATE TABLE merchandising (
    producto_id INT PRIMARY KEY,
    categoria VARCHAR(50),
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

-- Tabla de juegos (SIN plataforma_id)
CREATE TABLE juegos (
    producto_id INT PRIMARY KEY,
    genero VARCHAR(50),
    edad_minima INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    INDEX idx_juegos_genero (genero)
);

-- Tabla de consolas
CREATE TABLE consolas (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(100),
    capacidad_almacenamiento VARCHAR(50),
    color VARCHAR(50),
    fabricante VARCHAR(100),
    plataforma_id INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    FOREIGN KEY (plataforma_id) REFERENCES plataforma(id),
    INDEX idx_consolas_plataforma (plataforma_id),
    INDEX idx_consolas_fabricante (fabricante)
);

-- Nueva tabla N:M para juegos-plataformas
CREATE TABLE juegos_plataformas (
    juego_id INT NOT NULL,
    plataforma_id INT NOT NULL,
    PRIMARY KEY (juego_id, plataforma_id),
    FOREIGN KEY (juego_id) REFERENCES juegos(producto_id) ON DELETE CASCADE,
    FOREIGN KEY (plataforma_id) REFERENCES plataforma(id) ON DELETE CASCADE
);

-- Carrito
CREATE TABLE carrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    UNIQUE KEY unique_carrito_usuario_producto (usuario_id, producto_id),
    INDEX idx_carrito_usuario (usuario_id),
    INDEX idx_carrito_producto (producto_id)
);

-- Wishlist
CREATE TABLE wishlist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    UNIQUE KEY unique_wishlist_usuario_producto (usuario_id, producto_id),
    INDEX idx_wishlist_usuario (usuario_id),
    INDEX idx_wishlist_producto (producto_id)
);

-- Pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    metodo_pago_id INT,
    total DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente','procesando','enviado','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    direccion_envio VARCHAR(255),
    telefono_contacto VARCHAR(20),
    notas TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
    FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(id) ON DELETE SET NULL,
    INDEX idx_pedidos_usuario (usuario_id),
    INDEX idx_pedidos_estado (estado),
    INDEX idx_pedidos_fecha (fecha_pedido)
);

-- Productos de pedidos
CREATE TABLE pedidos_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    INDEX idx_pedidos_productos_pedido (pedido_id),
    INDEX idx_pedidos_productos_producto (producto_id)
);

