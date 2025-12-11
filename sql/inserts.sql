USE nebrigame;

-- ============================================
-- USUARIOS
-- ============================================
INSERT INTO usuarios (nombre, apellido1, apellido2, DNI, email, contrasenna) VALUES
('Juan', 'García', 'López', '12345678A', 'juan@mail.com', 'xxx'),
('María', 'Martínez', 'Sánchez', '23456789B', 'maria@mail.com', 'xxx'),
('Carlos', 'Rodríguez', NULL, '34567890C', 'carlos@mail.com', 'xxx'),
('Ana', 'Fernández', 'González', '45678901D', 'ana@mail.com', 'xxx'),
('Luis', 'Pérez', 'Torres', '56789012E', 'luis@mail.com', 'xxx');

-- ============================================
-- PLATAFORMAS
-- ============================================
INSERT INTO plataforma (nombre) VALUES
('PlayStation 5'),
('Xbox Series X'),
('Nintendo Switch'),
('PC'),
('PlayStation 4'),
('Xbox One');

-- ============================================
-- PRODUCTOS BASE (JUEGOS)
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('The Legend of Zelda: Breath of the Wild', 59.99, 'Aventura épica', 25, 'juego'),
('Elden Ring', 69.99, 'RPG mundo abierto', 30, 'juego'),
('FIFA 24', 49.99, 'Simulador de fútbol', 50, 'juego'),
('Call of Duty: Modern Warfare III', 69.99, 'Shooter FPS', 40, 'juego'),
('Super Mario Odyssey', 59.99, 'Plataformas', 20, 'juego'),
('Cyberpunk 2077', 39.99, 'RPG Sci-Fi', 15, 'juego');

-- ============================================
-- TABLA JUEGOS (sin plataforma_id)
-- ============================================
INSERT INTO juegos (producto_id, genero, edad_minima) VALUES
(1, 'Aventura', 7),
(2, 'RPG', 16),
(3, 'Deportes', 3),
(4, 'Shooter', 18),
(5, 'Plataformas', 3),
(6, 'RPG', 18);

-- ============================================
-- NUEVA TABLA N:M: juegos_plataformas
-- ============================================
INSERT INTO juegos_plataformas VALUES
(1, 3), -- Zelda → Switch
(2, 4), -- Elden Ring → PC
(3, 1), -- FIFA → PS5
(4, 1), -- COD → PS5
(5, 3), -- Mario → Switch
(6, 4); -- Cyberpunk → PC

-- Si quieres más plataformas por juego, añade aquí
-- por ejemplo Elden Ring también en PS5:
-- INSERT INTO juegos_plataformas VALUES (2, 1);

-- ============================================
-- CONSOLAS
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('PlayStation 5 Standard', 549.99, 'Consola PS5', 10, 'consola'),
('Xbox Series X', 499.99, 'Consola Xbox SX', 8, 'consola'),
('Nintendo Switch OLED', 349.99, 'Switch OLED', 12, 'consola'),
('PlayStation 5 Digital', 449.99, 'PS5 sin lector', 5, 'consola');

INSERT INTO consolas (producto_id, nombre, capacidad_almacenamiento, color, fabricante, plataforma_id) VALUES
(7, 'PlayStation 5 Standard', '825GB SSD', 'Blanco', 'Sony', 1),
(8, 'Xbox Series X', '1TB SSD', 'Negro', 'Microsoft', 2),
(9, 'Nintendo Switch OLED', '64GB', 'Blanco', 'Nintendo', 3),
(10, 'PlayStation 5 Digital', '825GB SSD', 'Blanco', 'Sony', 1);

-- ============================================
-- MERCHANDISING
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('Camiseta Zelda', 24.99, 'Camiseta temática Zelda', 50, 'merchandising'),
('Funko Pop Mario', 14.99, 'Figura Mario', 30, 'merchandising'),
('Mando DualSense PS5', 69.99, 'Mando PS5', 25, 'merchandising'),
('Poster Elden Ring', 9.99, 'Póster', 100, 'merchandising'),
('Funda Switch', 19.99, 'Funda protectora', 40, 'merchandising'),
('Llavero PlayStation', 7.99, 'Llavero', 60, 'merchandising');

INSERT INTO merchandising VALUES
(11,'Ropa'),
(12,'Figuras'),
(13,'Accesorios'),
(14,'Decoración'),
(15,'Accesorios'),
(16,'Accesorios');
