/*-------------------- CREACIÓN BASE DE DATOS CORREGIDA --------------------*/
DROP DATABASE IF EXISTS nebrigame;
CREATE DATABASE IF NOT EXISTS nebrigame;
USE nebrigame;

-- ============================================
-- TABLA USUARIOS
-- ============================================
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    contrasenna VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_usuarios_email (email),
);

-- ============================================
-- TABLA MÉTODO DE PAGO
-- ============================================
CREATE TABLE metodo_pago(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    detalles VARCHAR(255) NOT NULL,
    usuario_id INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_metodo_pago_usuario (usuario_id)
);

-- ============================================
-- TABLA PLATAFORMA
-- ============================================
CREATE TABLE plataforma(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    INDEX idx_plataforma_nombre (nombre)
);

-- ============================================
-- TABLA BASE DE PRODUCTOS
-- ============================================
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    stock INT NOT NULL DEFAULT 0,
    tipo ENUM('merchandising', 'juego', 'consola') NOT NULL,
    imagen_url VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Constraints
    CONSTRAINT chk_tipo_producto CHECK (tipo IN ('merchandising', 'juego', 'consola')),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0),
    CONSTRAINT chk_precio_positivo CHECK (precio >= 0),
    -- Índices
    INDEX idx_productos_tipo (tipo),
    INDEX idx_productos_precio (precio),
    INDEX idx_productos_nombre (nombre),
    INDEX idx_productos_stock (stock)
);

-- ============================================
-- TABLA MERCHANDISING (Especialización)
-- ============================================
CREATE TABLE merchandising (
    producto_id INT PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    INDEX idx_merchandising_categoria (categoria)
);

-- ============================================
-- TABLA JUEGOS (Especialización)
-- ============================================
CREATE TABLE juegos (
    producto_id INT PRIMARY KEY,
    genero VARCHAR(50) NOT NULL,
    edad_minima INT NOT NULL DEFAULT 0,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    CONSTRAINT chk_edad_minima CHECK (edad_minima >= 0 AND edad_minima <= 18),
    INDEX idx_juegos_genero (genero),
    INDEX idx_juegos_edad (edad_minima)
);

-- ============================================
-- TABLA INTERMEDIA JUEGOS-PLATAFORMAS (N:N)
-- ============================================
CREATE TABLE juegos_plataformas (
    juego_id INT NOT NULL,
    plataforma_id INT NOT NULL,
    fecha_lanzamiento DATE,
    PRIMARY KEY (juego_id, plataforma_id),
    FOREIGN KEY (juego_id) REFERENCES juegos(producto_id) ON DELETE CASCADE,
    FOREIGN KEY (plataforma_id) REFERENCES plataforma(id) ON DELETE CASCADE,
    INDEX idx_juegos_plataformas_juego (juego_id),
    INDEX idx_juegos_plataformas_plataforma (plataforma_id)
);

-- ============================================
-- TABLA CONSOLAS (Especialización)
-- ============================================
CREATE TABLE consolas (
    producto_id INT PRIMARY KEY,
    capacidad_almacenamiento VARCHAR(50) NOT NULL,
    color VARCHAR(50),
    fabricante VARCHAR(100) NOT NULL,
    plataforma_id INT NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    FOREIGN KEY (plataforma_id) REFERENCES plataforma(id) ON DELETE RESTRICT,
    INDEX idx_consolas_plataforma (plataforma_id),
    INDEX idx_consolas_fabricante (fabricante)
);

-- ============================================
-- TABLA CARRITO DE COMPRAS
-- ============================================
CREATE TABLE carrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    fecha_agregado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE,
    UNIQUE KEY unique_carrito_usuario_producto (usuario_id, producto_id),
    CONSTRAINT chk_carrito_cantidad CHECK (cantidad > 0),
    INDEX idx_carrito_usuario (usuario_id),
    INDEX idx_carrito_producto (producto_id)
);

-- ============================================
-- TABLA WISHLIST (Lista de deseos)
-- ============================================
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

-- ============================================
-- TABLA PEDIDOS
-- ============================================
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    metodo_pago_id INT,
    total DECIMAL(10, 2) NOT NULL,
    estado ENUM('pendiente', 'procesando', 'enviado', 'entregado', 'cancelado') NOT NULL DEFAULT 'pendiente',
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    direccion_envio VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(10),
    ciudad VARCHAR(100),
    telefono_contacto VARCHAR(20) NOT NULL,
    notas TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
    FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(id) ON DELETE SET NULL,
    CONSTRAINT chk_total_positivo CHECK (total >= 0),
    INDEX idx_pedidos_usuario (usuario_id),
    INDEX idx_pedidos_estado (estado),
    INDEX idx_pedidos_fecha (fecha_pedido)
);

-- ============================================
-- TABLA PEDIDOS_PRODUCTOS (Relación N:N)
-- ============================================
CREATE TABLE pedidos_productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE RESTRICT,
    CONSTRAINT chk_pp_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_pp_precio CHECK (precio_unitario >= 0),
    CONSTRAINT chk_pp_subtotal CHECK (subtotal >= 0),
    INDEX idx_pedidos_productos_pedido (pedido_id),
    INDEX idx_pedidos_productos_producto (producto_id)
);

-- ============================================
-- TRIGGERS DE VALIDACIÓN
-- ============================================
DELIMITER $$

-- Trigger para merchandising
CREATE TRIGGER trg_check_merchandising_tipo
BEFORE INSERT ON merchandising
FOR EACH ROW
BEGIN
    DECLARE producto_tipo VARCHAR(20);
    
    SELECT tipo INTO producto_tipo FROM productos WHERE id = NEW.producto_id;
    
    IF producto_tipo != 'merchandising' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto debe ser de tipo merchandising';
    END IF;
    
    IF EXISTS (SELECT 1 FROM juegos WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto ya existe como juego';
    END IF;
    
    IF EXISTS (SELECT 1 FROM consolas WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto ya existe como consola';
    END IF;
END$$

-- Trigger para juegos
CREATE TRIGGER trg_check_juego_tipo
BEFORE INSERT ON juegos
FOR EACH ROW
BEGIN
    DECLARE producto_tipo VARCHAR(20);
    
    SELECT tipo INTO producto_tipo FROM productos WHERE id = NEW.producto_id;
    
    IF producto_tipo != 'juego' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto debe ser de tipo juego';
    END IF;
    
    IF EXISTS (SELECT 1 FROM merchandising WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto ya existe como merchandising';
    END IF;
    
    IF EXISTS (SELECT 1 FROM consolas WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto ya existe como consola';
    END IF;
END$$

-- Trigger para consolas
CREATE TRIGGER trg_check_consola_tipo
BEFORE INSERT ON consolas
FOR EACH ROW
BEGIN
    DECLARE producto_tipo VARCHAR(20);
    
    SELECT tipo INTO producto_tipo FROM productos WHERE id = NEW.producto_id;
    
    IF producto_tipo != 'consola' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto debe ser de tipo consola';
    END IF;
    
    IF EXISTS (SELECT 1 FROM merchandising WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto ya existe como merchandising';
    END IF;
    
    IF EXISTS (SELECT 1 FROM juegos WHERE producto_id = NEW.producto_id) THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto ya existe como juego';
    END IF;
END$$

-- Trigger para validar stock antes de agregar al carrito
CREATE TRIGGER trg_validar_stock_carrito
BEFORE INSERT ON carrito
FOR EACH ROW
BEGIN
    DECLARE stock_actual INT;
    
    SELECT stock INTO stock_actual FROM productos WHERE id = NEW.producto_id;
    
    IF stock_actual < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Stock insuficiente para agregar al carrito';
    END IF;
END$$

-- Trigger para calcular subtotal automáticamente
CREATE TRIGGER trg_calcular_subtotal
BEFORE INSERT ON pedidos_productos
FOR EACH ROW
BEGIN
    SET NEW.subtotal = NEW.cantidad * NEW.precio_unitario;
END$$

-- Trigger para actualizar subtotal en UPDATE
CREATE TRIGGER trg_actualizar_subtotal
BEFORE UPDATE ON pedidos_productos
FOR EACH ROW
BEGIN
    SET NEW.subtotal = NEW.cantidad * NEW.precio_unitario;
END$$

DELIMITER ;

-- ============================================
-- ÍNDICES ADICIONALES PARA OPTIMIZACIÓN
-- ============================================
CREATE INDEX idx_productos_tipo_stock ON productos(tipo, stock);
CREATE INDEX idx_pedidos_usuario_estado ON pedidos(usuario_id, estado);
CREATE INDEX idx_pedidos_fecha_estado ON pedidos(fecha_pedido, estado);



-- ============================================
-- VISTAS ÚTILES
-- ============================================

-- Vista de resumen de pedidos
CREATE VIEW vista_resumen_pedidos AS
SELECT 
    ped.id AS pedido_id,
    u.nombre AS usuario_nombre,
    u.email AS usuario_email,
    ped.total,
    ped.estado,
    ped.fecha_pedido,
    COUNT(pp.id) AS total_productos,
    SUM(pp.cantidad) AS total_items
FROM pedidos ped
JOIN usuarios u ON ped.usuario_id = u.id
LEFT JOIN pedidos_productos pp ON ped.id = pp.pedido_id
GROUP BY ped.id; 

/*
-- Vista de productos con información completa
CREATE VIEW vista_productos_completa AS
SELECT 
    p.id,
    p.nombre,
    p.precio,
    p.descripcion,
    p.stock,
    p.tipo,
    p.imagen_url,
    -- Datos específicos de juegos
    j.genero AS juego_genero,
    j.edad_minima AS juego_edad_minima,
    GROUP_CONCAT(DISTINCT pl.nombre SEPARATOR ', ') AS plataformas,
    -- Datos específicos de consolas
    c.capacidad_almacenamiento,
    c.color,
    c.fabricante,
    plc.nombre AS consola_plataforma,
    -- Datos específicos de merchandising
    m.categoria
FROM productos p
LEFT JOIN juegos j ON p.id = j.producto_id
LEFT JOIN juegos_plataformas jp ON j.producto_id = jp.juego_id
LEFT JOIN plataforma pl ON jp.plataforma_id = pl.id
LEFT JOIN consolas c ON p.id = c.producto_id
LEFT JOIN plataforma plc ON c.plataforma_id = plc.id
LEFT JOIN merchandising m ON p.id = m.producto_id
GROUP BY p.id;
*/