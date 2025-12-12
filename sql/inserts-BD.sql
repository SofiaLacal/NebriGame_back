/*-------------------- INSERTS NEBRIGAME CORREGIDOS --------------------*/
USE nebrigame;

-- ============================================
-- INSERTS PARA USUARIOS
-- ============================================
INSERT INTO usuarios (nombre, apellido1, apellido2, DNI, email, contrasenna) VALUES
('Juan', 'García', 'López', '12345678A', 'juan.garcia@email.com', '$2b$10$ejemploHashPassword123'),
('María', 'Martínez', 'Sánchez', '23456789B', 'maria.martinez@email.com', '$2b$10$ejemploHashPassword456'),
('Carlos', 'Rodríguez', NULL, '34567890C', 'carlos.rodriguez@email.com', '$2b$10$ejemploHashPassword789'),
('Ana', 'Fernández', 'González', '45678901D', 'ana.fernandez@email.com', '$2b$10$ejemploHashPassword012'),
('Luis', 'Pérez', 'Torres', '56789012E', 'luis.perez@email.com', '$2b$10$ejemploHashPassword345'),
('Sara', 'López', 'Ruiz', '67890123F', 'sara.lopez@email.com', '$2b$10$ejemploHashPassword678');

-- ============================================
-- INSERTS PARA PLATAFORMAS
-- ============================================
INSERT INTO plataforma (nombre) VALUES
('PlayStation 5'),
('Xbox Series X'),
('Nintendo Switch'),
('PC'),
('PlayStation 4'),
('Xbox One'),
('Steam Deck'),
('Meta Quest');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - JUEGOS
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('The Legend of Zelda: Breath of the Wild', 59.99, 'Aventura épica en el reino de Hyrule con mundo abierto', 25, 'juego'),
('Elden Ring', 69.99, 'RPG de acción de mundo abierto creado por FromSoftware y George R.R. Martin', 30, 'juego'),
('FIFA 24', 49.99, 'Simulador de fútbol más reciente con tecnología HyperMotion', 50, 'juego'),
('Call of Duty: Modern Warfare III', 69.99, 'Shooter en primera persona con modo campaña y multijugador', 40, 'juego'),
('Super Mario Odyssey', 59.99, 'Aventura de plataformas 3D de Mario explorando diferentes reinos', 20, 'juego'),
('Cyberpunk 2077', 39.99, 'RPG de ciencia ficción en Night City con múltiples finales', 15, 'juego'),
('Red Dead Redemption 2', 59.99, 'Aventura del salvaje oeste con narrativa inmersiva', 22, 'juego'),
('Minecraft', 29.99, 'Juego sandbox de construcción y supervivencia', 100, 'juego'),
('Grand Theft Auto V', 39.99, 'Acción y aventura en mundo abierto en Los Santos', 45, 'juego'),
('The Witcher 3: Wild Hunt', 49.99, 'RPG de fantasía épico basado en las novelas de Andrzej Sapkowski', 30, 'juego');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - CONSOLAS
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('PlayStation 5 Standard', 549.99, 'Consola de nueva generación con lector de discos 4K UHD', 10, 'consola'),
('Xbox Series X', 499.99, 'Consola más potente de Microsoft con 12 teraflops', 8, 'consola'),
('Nintendo Switch OLED', 349.99, 'Versión mejorada de la Switch con pantalla OLED de 7 pulgadas', 12, 'consola'),
('PlayStation 5 Digital', 449.99, 'Versión digital sin lector de discos', 5, 'consola'),
('Xbox Series S', 299.99, 'Versión digital y compacta de la Xbox Series', 15, 'consola'),
('Steam Deck', 419.99, 'Consola portátil gaming de Valve con Steam OS', 7, 'consola');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - MERCHANDISING
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('Camiseta Zelda Triforce', 24.99, 'Camiseta oficial de The Legend of Zelda con logo Triforce', 50, 'merchandising'),
('Figura Funko Pop Mario', 14.99, 'Figura coleccionable de Super Mario en su diseño clásico', 30, 'merchandising'),
('Mando DualSense PS5', 69.99, 'Mando inalámbrico para PlayStation 5 con feedback háptico', 25, 'merchandising'),
('Poster Elden Ring', 9.99, 'Póster oficial del juego Elden Ring (60x90cm)', 100, 'merchandising'),
('Funda Nintendo Switch', 19.99, 'Funda protectora rígida para Nintendo Switch', 40, 'merchandising'),
('Llavero PlayStation', 7.99, 'Llavero oficial de PlayStation con logo metálico', 60, 'merchandising'),
('Taza Minecraft', 12.99, 'Taza de cerámica con diseño de bloques de Minecraft', 35, 'merchandising'),
('Mochila Gaming RGB', 79.99, 'Mochila para portátil gaming con iluminación LED RGB', 20, 'merchandising'),
('Alfombrilla XXL Cyberpunk', 34.99, 'Alfombrilla extra grande con diseño de Cyberpunk 2077', 28, 'merchandising'),
('Auriculares Gaming Pro', 89.99, 'Auriculares inalámbricos con sonido surround 7.1', 18, 'merchandising');

-- ============================================
-- INSERTS PARA JUEGOS (Especialización)
-- ============================================
INSERT INTO juegos (producto_id, genero, edad_minima) VALUES
(1, 'Aventura', 7),      -- Zelda
(2, 'RPG', 16),          -- Elden Ring
(3, 'Deportes', 3),      -- FIFA
(4, 'Shooter', 18),      -- Call of Duty
(5, 'Plataformas', 3),   -- Mario
(6, 'RPG', 18),          -- Cyberpunk
(7, 'Aventura', 18),     -- Red Dead
(8, 'Sandbox', 7),       -- Minecraft
(9, 'Acción', 18),       -- GTA V
(10, 'RPG', 16);         -- The Witcher 3

-- ============================================
-- INSERTS PARA JUEGOS_PLATAFORMAS (N:N)
-- ============================================
INSERT INTO juegos_plataformas (juego_id, plataforma_id, fecha_lanzamiento) VALUES
-- Zelda (solo Switch)
(1, 3, '2017-03-03'),

-- Elden Ring (multiplataforma)
(2, 1, '2022-02-25'),
(2, 2, '2022-02-25'),
(2, 4, '2022-02-25'),
(2, 5, '2022-02-25'),

-- FIFA 24 (multiplataforma)
(3, 1, '2023-09-29'),
(3, 2, '2023-09-29'),
(3, 3, '2023-09-29'),
(3, 4, '2023-09-29'),

-- Call of Duty (multiplataforma)
(4, 1, '2023-11-10'),
(4, 2, '2023-11-10'),
(4, 4, '2023-11-10'),

-- Mario (solo Switch)
(5, 3, '2017-10-27'),

-- Cyberpunk (multiplataforma)
(6, 1, '2020-12-10'),
(6, 2, '2020-12-10'),
(6, 4, '2020-12-10'),
(6, 5, '2021-09-28'),

-- Red Dead 2 (multiplataforma)
(7, 1, '2018-10-26'),
(7, 2, '2018-10-26'),
(7, 4, '2019-11-05'),

-- Minecraft (todas las plataformas)
(8, 1, '2014-09-04'),
(8, 2, '2014-09-05'),
(8, 3, '2017-05-11'),
(8, 4, '2009-05-17'),

-- GTA V (multiplataforma)
(9, 1, '2022-03-15'),
(9, 2, '2021-11-11'),
(9, 4, '2015-04-14'),
(9, 5, '2013-09-17'),

-- The Witcher 3 (multiplataforma)
(10, 1, '2015-05-19'),
(10, 2, '2015-05-19'),
(10, 3, '2019-10-15'),
(10, 4, '2015-05-19');

-- ============================================
-- INSERTS PARA CONSOLAS (Especialización)
-- ============================================

INSERT INTO consolas (producto_id, capacidad_almacenamiento, color, fabricante, plataforma_id) VALUES
(11, '825GB SSD', 'Blanco y Negro', 'Sony', 1),
(12, '1TB SSD', 'Negro', 'Microsoft', 2),
(13, '64GB', 'Blanco', 'Nintendo', 3),
(14, '825GB SSD', 'Blanco y Negro', 'Sony', 1),
(15, '512GB SSD', 'Negro', 'Microsoft', 2),
(16, '256GB SSD', 'Negro', 'Valve', 7);

-- ============================================
-- INSERTS PARA MERCHANDISING (Especialización)
-- ============================================
INSERT INTO merchandising (producto_id, categoria) VALUES
(17, 'Ropa'),
(18, 'Figuras'),
(19, 'Accesorios'),
(20, 'Decoración'),
(21, 'Accesorios'),
(22, 'Accesorios'),
(23, 'Decoración'),
(24, 'Accesorios'),
(25, 'Accesorios'),
(26, 'Accesorios');

-- ============================================
-- INSERTS PARA MÉTODOS DE PAGO
-- ============================================
INSERT INTO metodo_pago (tipo, detalles, usuario_id) VALUES
('Tarjeta de Crédito', '**** **** **** 1234 - VISA', 1),
('PayPal', 'juan.garcia@email.com', 1),
('Tarjeta de Débito', '**** **** **** 5678 - Mastercard', 2),
('Transferencia Bancaria', 'ES12 3456 7890 1234 5678', 3),
('Tarjeta de Crédito', '**** **** **** 9012 - VISA', 4),
('PayPal', 'ana.fernandez@email.com', 4),
('Tarjeta de Crédito', '**** **** **** 3456 - Mastercard', 5),
('Bizum', '612345678', 6);

-- ============================================
-- INSERTS PARA CARRITO
-- ============================================
INSERT INTO carrito (usuario_id, producto_id, cantidad) VALUES
(1, 1, 1),   -- Juan: Zelda
(1, 11, 1),  -- Juan: PS5 Standard
(2, 3, 2),   -- María: 2x FIFA
(2, 17, 1),  -- María: Camiseta Zelda
(3, 2, 1),   -- Carlos: Elden Ring
(3, 19, 2),  -- Carlos: 2x Mando DualSense
(4, 13, 1),  -- Ana: Switch OLED
(4, 5, 1),   -- Ana: Mario Odyssey
(5, 8, 1),   -- Luis: Minecraft
(5, 23, 1),  -- Luis: Taza Minecraft
(6, 6, 1),   -- Sara: Cyberpunk
(6, 25, 1);  -- Sara: Alfombrilla Cyberpunk

-- ============================================
-- INSERTS PARA WISHLIST
-- ============================================
INSERT INTO wishlist (usuario_id, producto_id) VALUES
(1, 2),   -- Juan quiere Elden Ring
(1, 12),  -- Juan quiere Xbox Series X
(1, 24),  -- Juan quiere Mochila Gaming
(2, 11),  -- María quiere PS5
(2, 4),   -- María quiere Call of Duty
(2, 26),  -- María quiere Auriculares Gaming
(3, 11),  -- Carlos quiere PS5
(3, 1),   -- Carlos quiere Zelda
(3, 13),  -- Carlos quiere Switch
(4, 2),   -- Ana quiere Elden Ring
(4, 7),   -- Ana quiere Red Dead 2
(5, 11),  -- Luis quiere PS5
(5, 3),   -- Luis quiere FIFA
(5, 16),  -- Luis quiere Steam Deck
(6, 12),  -- Sara quiere Xbox Series X
(6, 10);  -- Sara quiere The Witcher 3

-- ============================================
-- INSERTS PARA PEDIDOS
-- ============================================
INSERT INTO pedidos (usuario_id, metodo_pago_id, total, estado, direccion_envio, codigo_postal, ciudad, telefono_contacto, notas) VALUES
(1, 1, 609.98, 'entregado', 'Calle Mayor 123', '28013', 'Madrid', '612345678', 'Entregar en horario de tarde'),
(2, 3, 99.98, 'enviado', 'Avenida Principal 45', '08015', 'Barcelona', '623456789', NULL),
(3, 4, 109.98, 'procesando', 'Plaza Central 7', '46003', 'Valencia', '634567890', 'Urgente'),
(4, 5, 409.98, 'pendiente', 'Calle Nueva 12', '41004', 'Sevilla', '645678901', NULL),
(1, 2, 24.99, 'entregado', 'Calle Mayor 123', '28013', 'Madrid', '612345678', NULL),
(5, 7, 129.97, 'enviado', 'Paseo de la Castellana 89', '28046', 'Madrid', '656789012', 'Llamar antes de entregar'),
(6, 8, 449.98, 'procesando', 'Calle Gran Vía 55', '28013', 'Madrid', '667890123', NULL);

-- ============================================
-- INSERTS PARA PEDIDOS_PRODUCTOS
-- ============================================
-- Pedido 1: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 11, 1, 549.99, 549.99),  -- PS5 Standard
(1, 1, 1, 59.99, 59.99);     -- Zelda

-- Pedido 2: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(2, 3, 2, 49.99, 99.98);     -- 2x FIFA

-- Pedido 3: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(3, 2, 1, 69.99, 69.99),     -- Elden Ring
(3, 19, 2, 19.99, 39.98);    -- 2x Mando DualSense (precio oferta)

-- Pedido 4: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(4, 13, 1, 349.99, 349.99),  -- Switch OLED
(4, 5, 1, 59.99, 59.99);     -- Mario Odyssey

-- Pedido 5: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(5, 17, 1, 24.99, 24.99);    -- Camiseta Zelda

-- Pedido 6: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(6, 8, 1, 29.99, 29.99),     -- Minecraft
(6, 23, 1, 12.99, 12.99),    -- Taza Minecraft
(6, 20, 1, 9.99, 9.99);      -- Poster Elden Ring

-- Pedido 7: 
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(7, 14, 1, 449.99, 449.99),  -- PS5 Digital
(7, 6, 1, 39.99, 39.99);     -- Cyberpunk 2077

