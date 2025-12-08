USE nebrigame;

-- ============================================
-- INSERTS PARA USUARIOS
-- ============================================
INSERT INTO usuarios (nombre, apellido1, apellido2, DNI, email, contrasenna) VALUES
('Juan', 'García', 'López', '12345678A', 'juan.garcia@email.com', '$2b$10$ejemploHashPassword123'),
('María', 'Martínez', 'Sánchez', '23456789B', 'maria.martinez@email.com', '$2b$10$ejemploHashPassword456'),
('Carlos', 'Rodríguez', NULL, '34567890C', 'carlos.rodriguez@email.com', '$2b$10$ejemploHashPassword789'),
('Ana', 'Fernández', 'González', '45678901D', 'ana.fernandez@email.com', '$2b$10$ejemploHashPassword012'),
('Luis', 'Pérez', 'Torres', '56789012E', 'luis.perez@email.com', '$2b$10$ejemploHashPassword345');

-- ============================================
-- INSERTS PARA PLATAFORMAS
-- ============================================
INSERT INTO plataforma (nombre) VALUES
('PlayStation 5'),
('Xbox Series X'),
('Nintendo Switch'),
('PC'),
('PlayStation 4'),
('Xbox One');

-- ============================================
-- INSERTS PARA PRODUCTOS (BASE)
-- ============================================
-- Juegos
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('The Legend of Zelda: Breath of the Wild', 59.99, 'Aventura épica en el reino de Hyrule', 25, 'juego'),
('Elden Ring', 69.99, 'RPG de acción de mundo abierto', 30, 'juego'),
('FIFA 24', 49.99, 'Simulador de fútbol más reciente', 50, 'juego'),
('Call of Duty: Modern Warfare III', 69.99, 'Shooter en primera persona', 40, 'juego'),
('Super Mario Odyssey', 59.99, 'Aventura de plataformas de Mario', 20, 'juego'),
('Cyberpunk 2077', 39.99, 'RPG de ciencia ficción', 15, 'juego');

-- Consolas
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('PlayStation 5 Standard', 549.99, 'Consola de nueva generación con lector de discos', 10, 'consola'),
('Xbox Series X', 499.99, 'Consola más potente de Microsoft', 8, 'consola'),
('Nintendo Switch OLED', 349.99, 'Versión mejorada de la Switch con pantalla OLED', 12, 'consola'),
('PlayStation 5 Digital', 449.99, 'Versión digital sin lector de discos', 5, 'consola');

-- Merchandising
INSERT INTO productos (nombre, precio, descripcion, stock, tipo) VALUES
('Camiseta Zelda', 24.99, 'Camiseta oficial de The Legend of Zelda', 50, 'merchandising'),
('Figura Funko Pop Mario', 14.99, 'Figura coleccionable de Super Mario', 30, 'merchandising'),
('Mando DualSense PS5', 69.99, 'Mando inalámbrico para PlayStation 5', 25, 'merchandising'),
('Poster Elden Ring', 9.99, 'Póster oficial del juego Elden Ring', 100, 'merchandising'),
('Funda Nintendo Switch', 19.99, 'Funda protectora para Nintendo Switch', 40, 'merchandising'),
('Llavero PlayStation', 7.99, 'Llavero oficial de PlayStation', 60, 'merchandising');

-- ============================================
-- INSERTS PARA JUEGOS (Especialización)
-- ============================================
INSERT INTO juegos (producto_id, genero, edad_minima, plataforma_id) VALUES
(1, 'Aventura', 7, 3),  -- Zelda en Nintendo Switch
(2, 'RPG', 16, 4),      -- Elden Ring en PC
(3, 'Deportes', 3, 1),  -- FIFA en PS5
(4, 'Shooter', 18, 1),  -- Call of Duty en PS5
(5, 'Plataformas', 3, 3), -- Mario en Nintendo Switch
(6, 'RPG', 18, 4);      -- Cyberpunk en PC

-- ============================================
-- INSERTS PARA CONSOLAS (Especialización)
-- ============================================
INSERT INTO consolas (producto_id, nombre, capacidad_almacenamiento, color, fabricante, plataforma_id) VALUES
(7, 'PlayStation 5 Standard', '825GB SSD', 'Blanco y Negro', 'Sony', 1),
(8, 'Xbox Series X', '1TB SSD', 'Negro', 'Microsoft', 2),
(9, 'Nintendo Switch OLED', '64GB', 'Blanco', 'Nintendo', 3),
(10, 'PlayStation 5 Digital', '825GB SSD', 'Blanco y Negro', 'Sony', 1);

-- ============================================
-- INSERTS PARA MERCHANDISING (Especialización)
-- ============================================
INSERT INTO merchandising (producto_id, categoria) VALUES
(11, 'Ropa'),
(12, 'Figuras'),
(13, 'Accesorios'),
(14, 'Decoración'),
(15, 'Accesorios'),
(16, 'Accesorios');

-- ============================================
-- INSERTS PARA MÉTODOS DE PAGO
-- ============================================
INSERT INTO metodo_pago (tipo, detalles, usuario_id) VALUES
('Tarjeta de Crédito', '**** **** **** 1234', 1),
('PayPal', 'juan.garcia@email.com', 1),
('Tarjeta de Débito', '**** **** **** 5678', 2),
('Transferencia Bancaria', 'ES12 3456 7890 1234 5678', 3),
('Tarjeta de Crédito', '**** **** **** 9012', 4),
('PayPal', 'ana.fernandez@email.com', 4);

-- ============================================
-- INSERTS PARA CARRITO
-- ============================================
INSERT INTO carrito (usuario_id, producto_id, cantidad) VALUES
(1, 1, 1),  -- Juan tiene Zelda en el carrito
(1, 7, 1),  -- Juan tiene PS5 en el carrito
(2, 3, 2),  -- María tiene 2 copias de FIFA
(2, 11, 1), -- María tiene camiseta Zelda
(3, 2, 1),  -- Carlos tiene Elden Ring
(3, 13, 1), -- Carlos tiene mando DualSense
(4, 9, 1),  -- Ana tiene Nintendo Switch OLED
(4, 5, 1);  -- Ana tiene Super Mario Odyssey

-- ============================================
-- INSERTS PARA WISHLIST
-- ============================================
INSERT INTO wishlist (usuario_id, producto_id) VALUES
(1, 2),   -- Juan quiere Elden Ring
(1, 8),   -- Juan quiere Xbox Series X
(2, 7),   -- María quiere PS5
(2, 4),   -- María quiere Call of Duty
(3, 7),   -- Carlos quiere PS5
(3, 1),   -- Carlos quiere Zelda
(4, 2),   -- Ana quiere Elden Ring
(5, 7),   -- Luis quiere PS5
(5, 3);   -- Luis quiere FIFA

-- ============================================
-- INSERTS PARA PEDIDOS
-- ============================================
INSERT INTO pedidos (usuario_id, metodo_pago_id, total, estado, direccion_envio, telefono_contacto, notas) VALUES
(1, 1, 609.98, 'entregado', 'Calle Mayor 123, Madrid', '612345678', 'Entregar en horario de tarde'),
(2, 3, 99.98, 'enviado', 'Avenida Principal 45, Barcelona', '623456789', NULL),
(3, 4, 109.98, 'procesando', 'Plaza Central 7, Valencia', '634567890', 'Urgente'),
(4, 5, 409.98, 'pendiente', 'Calle Nueva 12, Sevilla', '645678901', NULL),
(1, 2, 24.99, 'entregado', 'Calle Mayor 123, Madrid', '612345678', NULL);

-- ============================================
-- INSERTS PARA PEDIDOS_PRODUCTOS
-- ============================================
-- Pedido 1: Juan compró PS5 + Zelda
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 7, 1, 549.99, 549.99),  -- PS5
(1, 1, 1, 59.99, 59.99);    -- Zelda

-- Pedido 2: María compró 2x FIFA
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(2, 3, 2, 49.99, 99.98);    -- 2x FIFA (49.99 * 2 = 99.98)

-- Pedido 3: Carlos compró Elden Ring + mando (mando en oferta)
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(3, 2, 1, 69.99, 69.99),    -- Elden Ring
(3, 13, 1, 39.99, 39.99);   -- Mando DualSense (precio en oferta al momento de la compra)

-- Pedido 4: Ana compró Switch + Mario
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(4, 9, 1, 349.99, 349.99),  -- Switch OLED
(4, 5, 1, 59.99, 59.99);    -- Mario Odyssey

-- Pedido 5: Juan compró camiseta
INSERT INTO pedidos_productos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(5, 11, 1, 24.99, 24.99);   -- Camiseta Zelda
