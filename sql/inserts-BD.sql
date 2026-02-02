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
INSERT INTO productos (nombre, precio, descripcion, stock, tipo, imagen_url) VALUES
('The Legend of Zelda: Breath of the Wild', 59.99, 'Aventura épica en el vasto reino de Hyrule con un innovador sistema de mundo abierto. Explora paisajes impresionantes, resuelve enigmas en más de 120 santuarios, enfrenta enemigos desafiantes y descubre la historia de Link tras su despertar de un sueño de 100 años. Con física realista, escalada libre y un sistema de cocina detallado, este juego redefine el género de aventuras.', 25, 'juego', '/assets/imagenes/videojuegos/zelda.jpg'),
('Elden Ring', 69.99, 'RPG de acción de mundo abierto creado por FromSoftware en colaboración con George R.R. Martin. Sumérgete en las Tierras Intermedias, un vasto mundo lleno de mazmorras peligrosas, jefes épicos y secretos oscuros. Con un sistema de combate desafiante heredado de Dark Souls, personalización profunda de personajes y una narrativa críptica que te mantendrá explorando durante más de 100 horas. Incluye invocaciones de espíritus, magia poderosa y combate a caballo.', 30, 'juego', '/assets/imagenes/videojuegos/eldenring.jpg'),
('FIFA 24', 49.99, 'El simulador de fútbol más avanzado hasta la fecha con tecnología HyperMotion V que captura movimientos reales de jugadores profesionales. Disfruta de más de 700 equipos auténticos, 30 ligas oficiales y los modos Ultimate Team, Carrera y VOLTA Football. Gráficos fotorrealistas con iluminación dinámica, física del balón mejorada y comentarios en múltiples idiomas. Juega online contra jugadores de todo el mundo o disfruta de partidos locales con amigos.', 50, 'juego', '/assets/imagenes/videojuegos/fifa24.jpg'),
('Call of Duty: Modern Warfare III', 69.99, 'Shooter en primera persona trepidante con una campaña cinematográfica que continúa la historia de la Task Force 141. Enfrenta amenazas globales en misiones por todo el mundo con gráficos de última generación y efectos de sonido envolventes. El multijugador incluye más de 16 mapas al lanzamiento, nuevos modos de juego competitivos y el popular modo Zombies. Personaliza tus armas con el sistema Gunsmith más profundo de la serie y desbloquea operadores únicos.', 40, 'juego', '/assets/imagenes/videojuegos/codmw3.jpg'),
('Super Mario Odyssey', 59.99, 'Aventura de plataformas 3D revolucionaria donde Mario viaja por reinos extraordinarios a bordo del sombrero volador Odyssey. Utiliza a Cappy, tu compañero sombrero mágico, para capturar enemigos y objetos, ganando sus habilidades únicas. Explora desde la bulliciosa New Donk City hasta el misterioso Reino Sombrero, recolectando cientos de Power Moons. Con desafíos post-juego, modo fotografía y compatibilidad con amiibo, ofrece diversión para jugadores de todas las edades.', 20, 'juego', '/assets/imagenes/videojuegos/superMarioOdyssey.jpg'),
('Cyberpunk 2077', 39.99, 'RPG de ciencia ficción ambientado en Night City, una megalópolis obsesionada con el poder, el glamur y las modificaciones corporales. Crea tu propio personaje V y sumérgete en una historia ramificada con múltiples finales basados en tus decisiones. Explora seis distritos únicos, completa misiones secundarias complejas y personaliza tu arsenal con armas futuristas y implantes cibernéticos. La versión 2.0 incluye mejoras masivas en IA, combate vehicular y sistema de policía, además de la expansión Phantom Liberty.', 15, 'juego', '/assets/imagenes/videojuegos/cyberpunk2077.jpg'),
('Red Dead Redemption 2', 59.99, 'Épica aventura del salvaje oeste que narra la historia de Arthur Morgan y la banda de Dutch van der Linde. Explora un mundo abierto masivo que abarca estados americanos recreados meticulosamente, desde montañas nevadas hasta pantanos sureños. Con un sistema de honor dinámico que afecta la narrativa, mecánicas de supervivencia realistas como cazar, pescar y acampar, y decenas de actividades secundarias. El modo historia ofrece más de 60 horas de contenido con actuaciones galardonadas y una banda sonora épica. Incluye Red Dead Online para aventuras multijugador.', 22, 'juego', '/assets/imagenes/videojuegos/redDeadRedemption2.jpg'),
('Minecraft', 29.99, 'El juego sandbox definitivo que te permite construir, explorar y sobrevivir en mundos infinitos generados proceduralmente. Recolecta recursos, construye desde humildes cabañas hasta castillos masivos, explora cuevas peligrosas y enfrenta criaturas nocturnas. Con modos Supervivencia, Creativo y Aventura, además de soporte para mods y servidores multijugador. Las actualizaciones constantes añaden nuevos biomas, mobs y mecánicas. Perfecto para todas las edades, combina creatividad ilimitada con desafíos de supervivencia y exploración sin fin.', 100, 'juego', '/assets/imagenes/videojuegos/minecraft.jpg'),
('Grand Theft Auto V', 39.99, 'Acción y aventura en mundo abierto ambientada en Los Santos, una metrópolis inspirada en Los Ángeles. Juega como tres protagonistas únicos - Michael, Franklin y Trevor - cuyas historias se entrelazan en audaces atracos y misiones explosivas. Explora el condado de Blaine, practica deportes extremos, personaliza vehículos y propiedades, e invierte en el mercado de valores. GTA Online incluido, con cientos de horas de contenido multijugador actualizado constantemente, desde carreras y atracos hasta negocios criminales. Gráficos mejorados para nueva generación con trazado de rayos y 60 FPS.', 45, 'juego', '/assets/imagenes/videojuegos/gtaV.jpg'),
('The Witcher 3: Wild Hunt', 49.99, 'RPG de fantasía épico basado en las novelas de Andrzej Sapkowski. Controla a Geralt de Rivia, un cazador de monstruos profesional, en su búsqueda de su hija adoptiva Ciri. Explora un mundo abierto de más de 136 km² que incluye la ciudad de Novigrad, las Islas Skellige y el reino de Nilfgaard. Con un sistema de combate táctico que combina espadas, señales mágicas y alquimia, toma decisiones moralmente complejas que afectan el destino de naciones enteras. Incluye las expansiones Hearts of Stone y Blood and Wine, sumando 50 horas adicionales de contenido con nuevas regiones y tramas.', 30, 'juego', '/assets/imagenes/videojuegos/theWitcher3GOTY.jpg'),
('Hogwarts Legacy', 59.99, 'RPG de acción ambientado en el universo de Harry Potter del siglo XIX. Explora el castillo de Hogwarts completamente abierto, asiste a clases de magia, domina hechizos y pociones, y personaliza tu bruja o mago. Descubre una historia original llena de criaturas fantásticas, mazmorras antiguas y secretos olvidados. Con un sistema de combate mágico fluido, doma bestias mágicas en tu propio vivario, cultiva plantas en el invernadero y forja tu propio legado. Elige tu casa, forma amistades y enfrenta una rebelión de duendes que amenaza el mundo mágico. Mundo abierto que incluye Hogsmeade, el Bosque Prohibido y las Highlands escocesas.', 35, 'juego', 'placeholder'),
('Starfield', 69.99, 'RPG espacial de Bethesda Game Studios que te lanza a explorar la Vía Láctea en el año 2330. Crea tu personaje y únete a Constellation, la última organización de exploradores espaciales. Visita más de 1000 planetas procedurales, construye y personaliza tu nave espacial, recluta tripulación y participa en combates espaciales épicos. Con un sistema de construcción de bases en planetas alienígenas, investigación científica profunda y decisiones que moldean facciones galácticas. Combina exploración espacial, FPS táctico y diálogos ramificados en una aventura de ciencia ficción hard con más de 200 horas de contenido, misiones de facciones y descubrimientos cósmicos.', 28, 'juego', 'placeholder');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - CONSOLAS
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo, imagen_url) VALUES
('PlayStation 5 Standard', 549.99, 'Consola de nueva generación de Sony equipada con lector de discos Blu-ray 4K UHD. Ofrece gráficos en resolución 4K, tecnología de trazado de rayos (Ray Tracing), audio 3D envolvente y tiempos de carga ultrarrápidos gracias a su SSD de alta velocidad. Incluye el mando inalámbrico DualSense con retroalimentación háptica y gatillos adaptativos para una experiencia de juego más inmersiva.', 10, 'consola', 'placeholder'),
('Xbox Series X', 499.99, 'La consola más potente de Microsoft, diseñada para ofrecer un rendimiento excepcional con 12 teraflops de potencia gráfica. Compatible con resolución 4K real, hasta 120 FPS y tecnología Ray Tracing. Incorpora un SSD NVMe de alta velocidad para cargas casi instantáneas y es compatible con miles de juegos de generaciones anteriores gracias a su retrocompatibilidad.', 8, 'consola', 'placeholder'),
('Nintendo Switch OLED', 349.99, 'Versión mejorada de la Nintendo Switch que cuenta con una pantalla OLED de 7 pulgadas con colores más intensos y mejor contraste. Permite jugar en modo portátil, sobremesa o conectado al televisor. Incluye base con puerto LAN integrado, almacenamiento interno ampliado y sonido mejorado para una experiencia más versátil y familiar.', 12, 'consola', 'placeholder'),
('PlayStation 5 Digital', 449.99, 'Edición digital de la PlayStation 5 que prescinde del lector de discos, ideal para quienes prefieren comprar y descargar sus juegos en formato digital. Mantiene la misma potencia, SSD ultrarrápido, soporte para 4K, Ray Tracing y mando DualSense con funciones avanzadas de inmersión.', 5, 'consola', 'placeholder'),
('Xbox Series S', 299.99, 'Consola compacta y totalmente digital de Microsoft, diseñada para jugar a nueva generación en resolución hasta 1440p con soporte para 120 FPS. Incluye un SSD rápido para tiempos de carga reducidos y acceso a Xbox Game Pass, ofreciendo una excelente relación calidad-precio en un formato pequeño y moderno.', 15, 'consola', 'placeholder'),
('Steam Deck', 419.99, 'Consola portátil desarrollada por Valve que permite jugar a tu biblioteca de Steam en cualquier lugar. Equipada con un potente hardware personalizado, pantalla táctil de alta resolución y controles integrados completos. Funciona con SteamOS basado en Linux y permite instalar otros sistemas operativos, ofreciendo gran flexibilidad para jugadores avanzados.', 7, 'consola', 'placeholder');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - MERCHANDISING
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, stock, tipo, imagen_url) VALUES
('Camiseta Zelda Triforce', 24.99, 'Camiseta oficial de The Legend of Zelda fabricada en algodón 100% premium de alta calidad. Presenta el icónico símbolo de la Trifuerza en dorado metalizado sobre fondo negro, con licencia oficial de Nintendo. Diseño unisex disponible en todas las tallas desde XS hasta XXL. El estampado está realizado con tecnología de serigrafía duradera que resiste más de 50 lavados sin decolorarse. Cuello reforzado y costuras dobles para mayor durabilidad. Incluye etiqueta holográfica de autenticidad. Perfecta para convenciones, eventos gaming o uso diario.', 50, 'merchandising', 'placeholder'),
('Figura Funko Pop Mario', 14.99, 'Figura coleccionable oficial Funko Pop de Super Mario en su diseño icónico con overol rojo y gorra. Mide aproximadamente 9 cm de altura y viene en caja decorada con ventana transparente, perfecta para coleccionistas que prefieren mantenerlas sin abrir. Fabricada en vinilo de alta calidad con detalles pintados a mano. La cabeza tiene el característico mecanismo de balanceo de Funko. Parte de la línea Nintendo que incluye docenas de personajes del universo Mario. Ideal para exhibir en estanterías o escritorios. Recomendada para mayores de 3 años.', 30, 'merchandising', 'placeholder'),
('Mando DualSense PS5', 69.99, 'Mando inalámbrico oficial para PlayStation 5 con tecnología de retroalimentación háptica revolucionaria que te permite sentir texturas y efectos del juego. Los gatillos adaptativos ofrecen resistencia variable según la acción que realices en el juego. Incluye micrófono integrado, altavoz, touchpad mejorado y botón de creación para capturar y compartir momentos épicos. Batería recargable de larga duración con hasta 12 horas de juego. Conectividad USB-C para carga rápida. Compatible con PC y dispositivos móviles mediante Bluetooth. Disponible en múltiples colores: blanco cósmico, negro medianoche y ediciones especiales.', 25, 'merchandising', 'placeholder'),
('Poster Elden Ring', 9.99, 'Póster oficial de gran formato (60x90cm) del aclamado Elden Ring con arte conceptual exclusivo del Árbol Áureo y las Tierras Intermedias. Impreso en papel fotográfico de 200g/m² con acabado mate antirreflejos para exhibición óptima. Los colores son vibrantes y duraderos gracias a la impresión de alta definición con tintas resistentes a la luz UV. Incluye licencia oficial de Bandai Namco y FromSoftware. Viene enrollado en tubo protector para evitar dobleces durante el envío. Perfecto para enmarcar y decorar habitaciones gaming, oficinas o espacios de entretenimiento.', 100, 'merchandising', 'placeholder'),
('Funda Nintendo Switch', 19.99, 'Funda protectora rígida oficial para Nintendo Switch con compartimentos organizados para almacenar hasta 10 cartuchos de juego. Exterior de EVA resistente a golpes e impactos con cremallera doble reforzada. Interior forrado con material suave antimicrobias que protege la pantalla de rayones. Asa ergonómica para transporte cómodo. Diseño compacto que cabe perfectamente en mochilas. Incluye bolsillo de malla elástica para guardar cables, auriculares y accesorios pequeños. Disponible en varios diseños: negro clásico, edición Mario Rojo y Zelda Dorado. Perfecta para viajes, protección diaria o almacenamiento.', 40, 'merchandising', 'placeholder'),
('Llavero PlayStation', 7.99, 'Llavero oficial de PlayStation fabricado en metal de alta calidad con acabado cromado brillante. Presenta el icónico logo de PlayStation con los símbolos de botones (círculo, equis, cuadrado y triángulo) en relieve. Incluye anilla resistente de acero inoxidable de 3cm de diámetro. El diseño es compacto (4cm) y ligero, perfecto para llevar en llaves, mochilas o carteras sin añadir peso. Viene en empaque oficial con código QR de autenticidad. Ideal como regalo para fans de PlayStation o como accesorio coleccionable. Resistente a la corrosión y al uso diario.', 60, 'merchandising', 'placeholder'),
('Taza Minecraft', 12.99, 'Taza de cerámica premium de 350ml con diseño pixelado de bloques clásicos de Minecraft. Presenta gráficos impresos en 360 grados con colores vibrantes que incluyen tierra, césped, piedra y diamante. Apta para microondas y lavavajillas, manteniendo sus colores intactos tras múltiples lavados. El asa ergonómica proporciona agarre cómodo y seguro. Fabricada en cerámica de alta calidad libre de BPA con acabado brillante duradero. Perfecta para café, té, chocolate caliente o cualquier bebida. Viene en caja de regalo oficial de Mojang Studios. Un regalo perfecto para gamers y fans de Minecraft de todas las edades.', 35, 'merchandising', 'placeholder'),
('Mochila Gaming RGB', 79.99, 'Mochila de alta gama para portátiles gaming hasta 17.3 pulgadas con sistema de iluminación LED RGB personalizable mediante app móvil. Fabricada en nylon balístico 1680D resistente al agua con costuras reforzadas. Incluye compartimento acolchado para laptop, bolsillo para tablet, múltiples organizadores para cables, mouse y accesorios. El sistema RGB funciona con batería recargable USB-C con 8 horas de autonomía y 16 millones de colores. Panel posterior con sistema de ventilación y espuma de memoria para máximo confort. Correas ajustables acolchadas con distribución ergonómica del peso. Puerto USB integrado para cargar dispositivos. Capacidad de 30L.', 20, 'merchandising', 'placeholder'),
('Alfombrilla XXL Cyberpunk', 34.99, 'Alfombrilla de escritorio extra grande (90x40cm) con diseño exclusivo de Cyberpunk 2077 mostrando el skyline nocturno de Night City en neón brillante. Base de goma natural antideslizante de 3mm que se adhiere firmemente a cualquier superficie. Superficie de tela microfibra de alta densidad optimizada tanto para ratones ópticos como láser, proporcionando precisión extrema en movimientos. Los bordes están cosidos para prevenir deshilachado y garantizar durabilidad. Resistente al agua y fácil de limpiar con paño húmedo. Grosor uniforme que no crea desniveles. Incluye licencia oficial de CD Projekt Red. Perfecta para setup gaming completo.', 28, 'merchandising', 'placeholder'),
('Auriculares Gaming Pro', 89.99, 'Auriculares inalámbricos premium con sonido envolvente virtual 7.1 y drivers de 50mm para audio inmersivo en juegos. Micrófono retráctil con cancelación de ruido bidireccional para comunicaciones cristalinas. Batería de larga duración con hasta 30 horas de uso continuo y carga rápida USB-C (15 min = 6 horas). Conectividad dual: inalámbrica de baja latencia 2.4GHz y Bluetooth 5.2 para usar con consolas, PC y móviles simultáneamente. Almohadillas de espuma viscoelástica premium y diadema ajustable con suspensión automática. Controles táctiles en auricular para volumen, mute y EQ. Iluminación RGB sincronizable. Compatible con PS5, Xbox, Switch, PC y móviles. Incluye estuche de transporte rígido.', 18, 'merchandising', 'placeholder'),
('Lámpara LED Pac-Man', 29.99, 'Lámpara LED decorativa con forma del icónico Pac-Man de 25cm de diámetro. Funciona con 16 colores diferentes y 4 modos de iluminación (fijo, respiración, destello y arcoíris) controlables mediante mando a distancia incluido. Fabricada en acrílico resistente con base de madera natural. Iluminación LED de bajo consumo que dura más de 50,000 horas. Alimentación por USB o 3 pilas AA (no incluidas) para portabilidad. Perfecta para decorar habitaciones gaming, oficinas o como luz nocturna. El diseño retro nostálgico la convierte en un regalo ideal para gamers de todas las generaciones. Licencia oficial de Bandai Namco con certificado de autenticidad.', 45, 'merchandising', 'placeholder'),
('Set de Pins Coleccionables Retro Gaming', 16.99, 'Colección de 6 pins esmaltados de metal con personajes y símbolos icónicos de videojuegos clásicos: Mario, Sonic, Pac-Man, Space Invaders, Tetris y la Triforce de Zelda. Cada pin mide aproximadamente 2.5cm y está fabricado en aleación de zinc con esmalte de colores vibrantes y acabado brillante. Incluye cierre de mariposa doble para máxima seguridad. Vienen presentados en tarjeta coleccionable con ilustraciones retro y código QR de autenticidad. Perfectos para personalizar mochilas, chaquetas, gorras o para coleccionar. Edición limitada con numeración individual. Licencias oficiales de Nintendo, SEGA y Atari. Ideal para nostalgia gamer y regalo para coleccionistas.', 55, 'merchandising', 'placeholder');

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
(10, 'RPG', 16),         -- The Witcher 3
(11, 'RPG', 12),         -- Hogwarts Legacy
(12, 'RPG', 16);         -- Starfield

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
(10, 4, '2015-05-19'),

-- Hogwarts Legacy (multiplataforma)
(11, 1, '2023-02-10'),
(11, 2, '2023-02-10'),
(11, 3, '2023-11-14'),
(11, 4, '2023-02-10'),
(11, 5, '2023-04-04'),

-- Starfield (Xbox y PC exclusivo)
(12, 2, '2023-09-06'),
(12, 4, '2023-09-06');

-- ============================================
-- INSERTS PARA CONSOLAS (Especialización)
-- ============================================

INSERT INTO consolas (producto_id, capacidad_almacenamiento, color, fabricante, plataforma_id) VALUES
(13, '825GB SSD', 'Blanco y Negro', 'Sony', 1),
(14, '1TB SSD', 'Negro', 'Microsoft', 2),
(15, '64GB', 'Blanco', 'Nintendo', 3),
(16, '825GB SSD', 'Blanco y Negro', 'Sony', 1),
(17, '512GB SSD', 'Negro', 'Microsoft', 2),
(18, '256GB SSD', 'Negro', 'Valve', 7);

-- ============================================
-- INSERTS PARA MERCHANDISING (Especialización)
-- ============================================
INSERT INTO merchandising (producto_id, categoria) VALUES
(19, 'Ropa'),           -- Camiseta Zelda
(20, 'Figuras'),        -- Funko Mario
(21, 'Accesorios'),     -- Mando DualSense
(22, 'Decoración'),     -- Poster Elden Ring
(23, 'Accesorios'),     -- Funda Switch
(24, 'Accesorios'),     -- Llavero PS
(25, 'Decoración'),     -- Taza Minecraft
(26, 'Accesorios'),     -- Mochila Gaming
(27, 'Accesorios'),     -- Alfombrilla Cyberpunk
(28, 'Accesorios'),     -- Auriculares Gaming
(29, 'Decoración'),     -- Lámpara Pac-Man
(30, 'Accesorios');     -- Set Pins

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