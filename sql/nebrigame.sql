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
    -- Constraint para asegurar que solo existe una relación especializada
    CONSTRAINT chk_tipo_producto CHECK (tipo IN ('merchandising', 'juego', 'consola')),
    INDEX idx_productos_tipo (tipo),
    INDEX idx_productos_precio (precio),
    INDEX idx_productos_nombre (nombre)
);

-- Tabla para productos de merchandising
CREATE TABLE merchandising (
    producto_id INT PRIMARY KEY,
    categoria VARCHAR(50),
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);

-- Tabla para juegos
CREATE TABLE juegos (
    producto_id INT PRIMARY KEY,
    genero VARCHAR(50),
    edad_minima INT,
    plataforma_id INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    FOREIGN KEY (plataforma_id) REFERENCES plataforma(id),
    INDEX idx_juegos_plataforma (plataforma_id),
    INDEX idx_juegos_genero (genero)
);

-- Tabla para consolas
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

-- Tabla para carrito de compras
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

-- Tabla para wishlist (lista de deseos)
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

-- Tabla para pedidos (órdenes de compra)
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    metodo_pago_id INT,
    total DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado') NOT NULL DEFAULT 'pendiente',
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

-- Tabla para productos de cada pedido (relación muchos a muchos)
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

-- Trigger para asegurar la exclusividad: un producto solo puede estar en una tabla especializada
DELIMITER $$

CREATE TRIGGER trg_check_merchandising_tipo
BEFORE INSERT ON merchandising
FOR EACH ROW
BEGIN
    IF (SELECT tipo FROM productos WHERE id = NEW.producto_id) != 'merchandising' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto debe ser de tipo merchandising';
    END IF;
    -- Verificar que no existe en otras tablas especializadas
    IF EXISTS (SELECT 1 FROM juegos WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe como juego';
    END IF;
    IF EXISTS (SELECT 1 FROM consolas WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe como consola';
    END IF;
END$$

CREATE TRIGGER trg_check_juego_tipo
BEFORE INSERT ON juegos
FOR EACH ROW
BEGIN
    IF (SELECT tipo FROM productos WHERE id = NEW.producto_id) != 'juego' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto debe ser de tipo juego';
    END IF;
    -- Verificar que no existe en otras tablas especializadas
    IF EXISTS (SELECT 1 FROM merchandising WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe como merchandising';
    END IF;
    IF EXISTS (SELECT 1 FROM consolas WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe como consola';
    END IF;
END$$

CREATE TRIGGER trg_check_consola_tipo
BEFORE INSERT ON consolas
FOR EACH ROW
BEGIN
    IF (SELECT tipo FROM productos WHERE id = NEW.producto_id) != 'consola' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto debe ser de tipo consola';
    END IF;
    -- Verificar que no existe en otras tablas especializadas
    IF EXISTS (SELECT 1 FROM merchandising WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe como merchandising';
    END IF;
    IF EXISTS (SELECT 1 FROM juegos WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe como juego';
    END IF;
END$$

DELIMITER ;