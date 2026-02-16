/*-------------------- INSERTS NEBRIGAME CORREGIDOS --------------------*/
USE nebrigame;

-- ============================================
-- INSERTS PARA USUARIOS
-- ============================================
INSERT INTO usuarios (nombre, apellido1, apellido2, email, contrasenna) VALUES
('Pablo', 'Herrero', NULL, 'pablohgb@gmail.com', '$2b$10$UxoeUu2VzE0XX5xbbIl59.wkSifHzYHaRhVSruEOGJSFd7vkPv9I6'),
('Javier', 'Monzon', NULL, 'javiermonzon@gmail.com', '$2b$10$sMUC7qYuUlzP8s7.CWltvOCR1Fw9divKdBY2p83yfWtMucMhpim3K'),
('Sofia', 'Lacal', NULL, 'sofialacal@gmail.com', '$2b$10$GPjQakuK6C710yiSCuQShuLErpS/C73mE66TbDOMUjCZMKmT8g9Cy'),
('Fran', 'Albiar', NULL, 'franalbiar@gmail.com', '$$2b$10$WqHT4.854T0Zv.23q5swXuOZUuPDSA7WaMDtJDwdrpoQOK9onMgzu'),
('Juan', 'Garcia', NULL, 'juangarcia@gmail.com', '$2b$10$7vqbSyxNxXKD./q58z0RZuvDWEKkSrZmWI.5Z2Pboo19ikB1pSi4G'),
('Pepito', 'Perez', NULL, 'pepitoperez@gmail.com', '$2b$10$juQg3PVD0aDd0u/NvpA/LO1itY/QADeX7NdHogt84q.7dw0Vy4Hny');

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
INSERT INTO productos (nombre, precio, descripcion, tipo, imagen_url) VALUES
('The Legend of Zelda: Breath of the Wild', 59.99, 'Aventura épica en el vasto reino de Hyrule con un innovador sistema de mundo abierto. Explora paisajes impresionantes, resuelve enigmas en más de 120 santuarios, enfrenta enemigos desafiantes y descubre la historia de Link tras su despertar de un sueño de 100 años. Con física realista, escalada libre y un sistema de cocina detallado, este juego redefine el género de aventuras.', 'juego', '/assets/imagenes/videojuegos/zelda.jpg'),
('Elden Ring', 69.99, 'RPG de acción de mundo abierto creado por FromSoftware en colaboración con George R.R. Martin. Sumérgete en las Tierras Intermedias, un vasto mundo lleno de mazmorras peligrosas, jefes épicos y secretos oscuros. Con un sistema de combate desafiante heredado de Dark Souls, personalización profunda de personajes y una narrativa críptica que te mantendrá explorando durante más de 100 horas. Incluye invocaciones de espíritus, magia poderosa y combate a caballo.', 'juego', '/assets/imagenes/videojuegos/eldenring.jpg'),
('FIFA 24', 49.99, 'El simulador de fútbol más avanzado hasta la fecha con tecnología HyperMotion V que captura movimientos reales de jugadores profesionales. Disfruta de más de 700 equipos auténticos, 30 ligas oficiales y los modos Ultimate Team, Carrera y VOLTA Football. Gráficos fotorrealistas con iluminación dinámica, física del balón mejorada y comentarios en múltiples idiomas. Juega online contra jugadores de todo el mundo o disfruta de partidos locales con amigos.', 'juego', '/assets/imagenes/videojuegos/fifa24.jpg'),
('Call of Duty: Modern Warfare III', 69.99, 'Shooter en primera persona trepidante con una campaña cinematográfica que continúa la historia de la Task Force 141. Enfrenta amenazas globales en misiones por todo el mundo con gráficos de última generación y efectos de sonido envolventes. El multijugador incluye más de 16 mapas al lanzamiento, nuevos modos de juego competitivos y el popular modo Zombies. Personaliza tus armas con el sistema Gunsmith más profundo de la serie y desbloquea operadores únicos.', 'juego', '/assets/imagenes/videojuegos/codmw3.jpg'),
('Super Mario Odyssey', 59.99, 'Aventura de plataformas 3D revolucionaria donde Mario viaja por reinos extraordinarios a bordo del sombrero volador Odyssey. Utiliza a Cappy, tu compañero sombrero mágico, para capturar enemigos y objetos, ganando sus habilidades únicas. Explora desde la bulliciosa New Donk City hasta el misterioso Reino Sombrero, recolectando cientos de Power Moons. Con desafíos post-juego, modo fotografía y compatibilidad con amiibo, ofrece diversión para jugadores de todas las edades.', 'juego', '/assets/imagenes/videojuegos/superMarioOdyssey.jpg'),
('Cyberpunk 2077', 39.99, 'RPG de ciencia ficción ambientado en Night City, una megalópolis obsesionada con el poder, el glamur y las modificaciones corporales. Crea tu propio personaje V y sumérgete en una historia ramificada con múltiples finales basados en tus decisiones. Explora seis distritos únicos, completa misiones secundarias complejas y personaliza tu arsenal con armas futuristas y implantes cibernéticos. La versión 2.0 incluye mejoras masivas en IA, combate vehicular y sistema de policía, además de la expansión Phantom Liberty.', 'juego', '/assets/imagenes/videojuegos/cyberpunk2077.jpg'),
('Red Dead Redemption 2', 59.99, 'Épica aventura del salvaje oeste que narra la historia de Arthur Morgan y la banda de Dutch van der Linde. Explora un mundo abierto masivo que abarca estados americanos recreados meticulosamente, desde montañas nevadas hasta pantanos sureños. Con un sistema de honor dinámico que afecta la narrativa, mecánicas de supervivencia realistas como cazar, pescar y acampar, y decenas de actividades secundarias. El modo historia ofrece más de 60 horas de contenido con actuaciones galardonadas y una banda sonora épica. Incluye Red Dead Online para aventuras multijugador.', 'juego', '/assets/imagenes/videojuegos/redDeadRedemption2.jpg'),
('Minecraft', 29.99, 'El juego sandbox definitivo que te permite construir, explorar y sobrevivir en mundos infinitos generados proceduralmente. Recolecta recursos, construye desde humildes cabañas hasta castillos masivos, explora cuevas peligrosas y enfrenta criaturas nocturnas. Con modos Supervivencia, Creativo y Aventura, además de soporte para mods y servidores multijugador. Las actualizaciones constantes añaden nuevos biomas, mobs y mecánicas. Perfecto para todas las edades, combina creatividad ilimitada con desafíos de supervivencia y exploración sin fin.', 'juego', '/assets/imagenes/videojuegos/minecraft.jpg'),
('Grand Theft Auto V', 39.99, 'Acción y aventura en mundo abierto ambientada en Los Santos, una metrópolis inspirada en Los Ángeles. Juega como tres protagonistas únicos - Michael, Franklin y Trevor - cuyas historias se entrelazan en audaces atracos y misiones explosivas. Explora el condado de Blaine, practica deportes extremos, personaliza vehículos y propiedades, e invierte en el mercado de valores. GTA Online incluido, con cientos de horas de contenido multijugador actualizado constantemente, desde carreras y atracos hasta negocios criminales. Gráficos mejorados para nueva generación con trazado de rayos y 60 FPS.', 'juego', '/assets/imagenes/videojuegos/gtaV.jpg'),
('The Witcher 3: Wild Hunt', 49.99, 'RPG de fantasía épico basado en las novelas de Andrzej Sapkowski. Controla a Geralt de Rivia, un cazador de monstruos profesional, en su búsqueda de su hija adoptiva Ciri. Explora un mundo abierto de más de 136 km² que incluye la ciudad de Novigrad, las Islas Skellige y el reino de Nilfgaard. Con un sistema de combate táctico que combina espadas, señales mágicas y alquimia, toma decisiones moralmente complejas que afectan el destino de naciones enteras. Incluye las expansiones Hearts of Stone y Blood and Wine, sumando 50 horas adicionales de contenido con nuevas regiones y tramas.', 'juego', '/assets/imagenes/videojuegos/theWitcher3GOTY.jpg'),
('Hogwarts Legacy', 59.99, 'RPG de acción ambientado en el universo de Harry Potter del siglo XIX. Explora el castillo de Hogwarts completamente abierto, asiste a clases de magia, domina hechizos y pociones, y personaliza tu bruja o mago. Descubre una historia original llena de criaturas fantásticas, mazmorras antiguas y secretos olvidados. Con un sistema de combate mágico fluido, doma bestias mágicas en tu propio vivario, cultiva plantas en el invernadero y forja tu propio legado. Elige tu casa, forma amistades y enfrenta una rebelión de duendes que amenaza el mundo mágico. Mundo abierto que incluye Hogsmeade, el Bosque Prohibido y las Highlands escocesas.', 'juego', '/assets/imagenes/videojuegos/hogwartsLegacy.jpg'),
('Starfield', 69.99, 'RPG espacial de Bethesda Game Studios que te lanza a explorar la Vía Láctea en el año 2330. Crea tu personaje y únete a Constellation, la última organización de exploradores espaciales. Visita más de 1000 planetas procedurales, construye y personaliza tu nave espacial, recluta tripulación y participa en combates espaciales épicos. Con un sistema de construcción de bases en planetas alienígenas, investigación científica profunda y decisiones que moldean facciones galácticas. Combina exploración espacial, FPS táctico y diálogos ramificados en una aventura de ciencia ficción hard con más de 200 horas de contenido, misiones de facciones y descubrimientos cósmicos.', 'juego', '/assets/imagenes/videojuegos/starfield.jpg');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - CONSOLAS
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, tipo, imagen_url) VALUES
('PlayStation 5 Standard', 549.99, 'Consola de nueva generación de Sony equipada con lector de discos Blu-ray 4K UHD. Ofrece gráficos en resolución 4K, tecnología de trazado de rayos (Ray Tracing), audio 3D envolvente y tiempos de carga ultrarrápidos gracias a su SSD de alta velocidad. Incluye el mando inalámbrico DualSense con retroalimentación háptica y gatillos adaptativos para una experiencia de juego más inmersiva.', 'consola', '/assets/imagenes/consolas/playStationStandar.jpg'),
('Xbox Series X', 499.99, 'La consola más potente de Microsoft, diseñada para ofrecer un rendimiento excepcional con 12 teraflops de potencia gráfica. Compatible con resolución 4K real, hasta 120 FPS y tecnología Ray Tracing. Incorpora un SSD NVMe de alta velocidad para cargas casi instantáneas y es compatible con miles de juegos de generaciones anteriores gracias a su retrocompatibilidad.', 'consola', '/assets/imagenes/consolas/xboxSeriesX.jpg'),
('Nintendo Switch OLED', 349.99, 'Versión mejorada de la Nintendo Switch que cuenta con una pantalla OLED de 7 pulgadas con colores más intensos y mejor contraste. Permite jugar en modo portátil, sobremesa o conectado al televisor. Incluye base con puerto LAN integrado, almacenamiento interno ampliado y sonido mejorado para una experiencia más versátil y familiar.', 'consola', '/assets/imagenes/consolas/nintendoSwitchOled.jpg'),
('PlayStation 5 Digital', 449.99, 'Edición digital de la PlayStation 5 que prescinde del lector de discos, ideal para quienes prefieren comprar y descargar sus juegos en formato digital. Mantiene la misma potencia, SSD ultrarrápido, soporte para 4K, Ray Tracing y mando DualSense con funciones avanzadas de inmersión.', 'consola', '/assets/imagenes/consolas/playStationDigital.jpg'),
('Xbox Series S', 299.99, 'Consola compacta y totalmente digital de Microsoft, diseñada para jugar a nueva generación en resolución hasta 1440p con soporte para 120 FPS. Incluye un SSD rápido para tiempos de carga reducidos y acceso a Xbox Game Pass, ofreciendo una excelente relación calidad-precio en un formato pequeño y moderno.', 'consola', '/assets/imagenes/consolas/xboxSeriesS.jpg'),
('Steam Deck', 419.99, 'Consola portátil desarrollada por Valve que permite jugar a tu biblioteca de Steam en cualquier lugar. Equipada con un potente hardware personalizado, pantalla táctil de alta resolución y controles integrados completos. Funciona con SteamOS basado en Linux y permite instalar otros sistemas operativos, ofreciendo gran flexibilidad para jugadores avanzados.', 'consola', '/assets/imagenes/consolas/steamDeck.jpg');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - MERCHANDISING
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, tipo, imagen_url) VALUES
('Camiseta Zelda Triforce', 24.99, 'Camiseta oficial de The Legend of Zelda fabricada en algodón 100% premium de alta calidad. Presenta el icónico símbolo de la Trifuerza en dorado metalizado sobre fondo negro, con licencia oficial de Nintendo. Diseño unisex disponible en todas las tallas desde XS hasta XXL. El estampado está realizado con tecnología de serigrafía duradera que resiste más de 50 lavados sin decolorarse. Cuello reforzado y costuras dobles para mayor durabilidad. Incluye etiqueta holográfica de autenticidad. Perfecta para convenciones, eventos gaming o uso diario.', 'merchandising', '/assets/imagenes/merchandising/camisetaZeldaTriforce.jpg'),
('Figura Funko Pop Mario', 14.99, 'Figura coleccionable oficial Funko Pop de Super Mario en su diseño icónico con overol rojo y gorra. Mide aproximadamente 9 cm de altura y viene en caja decorada con ventana transparente, perfecta para coleccionistas que prefieren mantenerlas sin abrir. Fabricada en vinilo de alta calidad con detalles pintados a mano. La cabeza tiene el característico mecanismo de balanceo de Funko. Parte de la línea Nintendo que incluye docenas de personajes del universo Mario. Ideal para exhibir en estanterías o escritorios. Recomendada para mayores de 3 años.', 'merchandising', '/assets/imagenes/merchandising/funkoMario.jpg'),
('Mando DualSense PS5', 69.99, 'Mando inalámbrico oficial para PlayStation 5 con tecnología de retroalimentación háptica revolucionaria que te permite sentir texturas y efectos del juego. Los gatillos adaptativos ofrecen resistencia variable según la acción que realices en el juego. Incluye micrófono integrado, altavoz, touchpad mejorado y botón de creación para capturar y compartir momentos épicos. Batería recargable de larga duración con hasta 12 horas de juego. Conectividad USB-C para carga rápida. Compatible con PC y dispositivos móviles mediante Bluetooth. Disponible en múltiples colores: blanco cósmico, negro medianoche y ediciones especiales.', 'merchandising', '/assets/imagenes/merchandising/mandoDualPlay.jpg'),
('Poster Elden Ring', 9.99, 'Póster oficial de gran formato (60x90cm) del aclamado Elden Ring con arte conceptual exclusivo del Árbol Áureo y las Tierras Intermedias. Impreso en papel fotográfico de 200g/m² con acabado mate antirreflejos para exhibición óptima. Los colores son vibrantes y duraderos gracias a la impresión de alta definición con tintas resistentes a la luz UV. Incluye licencia oficial de Bandai Namco y FromSoftware. Viene enrollado en tubo protector para evitar dobleces durante el envío. Perfecto para enmarcar y decorar habitaciones gaming, oficinas o espacios de entretenimiento.', 'merchandising', '/assets/imagenes/merchandising/posterEldenRing.jpg'),
('Funda Nintendo Switch', 19.99, 'Funda protectora rígida oficial para Nintendo Switch con compartimentos organizados para almacenar hasta 10 cartuchos de juego. Exterior de EVA resistente a golpes e impactos con cremallera doble reforzada. Interior forrado con material suave antimicrobias que protege la pantalla de rayones. Asa ergonómica para transporte cómodo. Diseño compacto que cabe perfectamente en mochilas. Incluye bolsillo de malla elástica para guardar cables, auriculares y accesorios pequeños. Disponible en varios diseños: negro clásico, edición Mario Rojo y Zelda Dorado. Perfecta para viajes, protección diaria o almacenamiento.', 'merchandising', '/assets/imagenes/merchandising/fundaSwitch.jpg'),
('Llavero PlayStation', 7.99, 'Llavero oficial de PlayStation fabricado en metal de alta calidad con acabado cromado brillante. Presenta el icónico logo de PlayStation con los símbolos de botones (círculo, equis, cuadrado y triángulo) en relieve. Incluye anilla resistente de acero inoxidable de 3cm de diámetro. El diseño es compacto (4cm) y ligero, perfecto para llevar en llaves, mochilas o carteras sin añadir peso. Viene en empaque oficial con código QR de autenticidad. Ideal como regalo para fans de PlayStation o como accesorio coleccionable. Resistente a la corrosión y al uso diario.', 'merchandising', '/assets/imagenes/merchandising/llaveroPlay.jpg'),
('Taza Minecraft', 12.99, 'Taza de cerámica premium de 350ml con diseño pixelado de bloques clásicos de Minecraft. Presenta gráficos impresos en 360 grados con colores vibrantes que incluyen tierra, césped, piedra y diamante. Apta para microondas y lavavajillas, manteniendo sus colores intactos tras múltiples lavados. El asa ergonómica proporciona agarre cómodo y seguro. Fabricada en cerámica de alta calidad libre de BPA con acabado brillante duradero. Perfecta para café, té, chocolate caliente o cualquier bebida. Viene en caja de regalo oficial de Mojang Studios. Un regalo perfecto para gamers y fans de Minecraft de todas las edades.', 'merchandising', '/assets/imagenes/merchandising/tazaMinecraft.jpg'),
('Mochila Gaming RGB', 79.99, 'Mochila de alta gama para portátiles gaming hasta 17.3 pulgadas con sistema de iluminación LED RGB personalizable mediante app móvil. Fabricada en nylon balístico 1680D resistente al agua con costuras reforzadas. Incluye compartimento acolchado para laptop, bolsillo para tablet, múltiples organizadores para cables, mouse y accesorios. El sistema RGB funciona con batería recargable USB-C con 8 horas de autonomía y 16 millones de colores. Panel posterior con sistema de ventilación y espuma de memoria para máximo confort. Correas ajustables acolchadas con distribución ergonómica del peso. Puerto USB integrado para cargar dispositivos. Capacidad de 30L.', 'merchandising', '/assets/imagenes/merchandising/mochilaGaming.jpg'),
('Alfombrilla XXL Cyberpunk', 34.99, 'Alfombrilla de escritorio extra grande (90x40cm) con diseño exclusivo de Cyberpunk 2077 mostrando el skyline nocturno de Night City en neón brillante. Base de goma natural antideslizante de 3mm que se adhiere firmemente a cualquier superficie. Superficie de tela microfibra de alta densidad optimizada tanto para ratones ópticos como láser, proporcionando precisión extrema en movimientos. Los bordes están cosidos para prevenir deshilachado y garantizar durabilidad. Resistente al agua y fácil de limpiar con paño húmedo. Grosor uniforme que no crea desniveles. Incluye licencia oficial de CD Projekt Red. Perfecta para setup gaming completo.', 'merchandising', '/assets/imagenes/merchandising/alfombrillaCyber.jpg'),
('Auriculares Gaming Pro', 89.99, 'Auriculares inalámbricos premium con sonido envolvente virtual 7.1 y drivers de 50mm para audio inmersivo en juegos. Micrófono retráctil con cancelación de ruido bidireccional para comunicaciones cristalinas. Batería de larga duración con hasta 30 horas de uso continuo y carga rápida USB-C (15 min = 6 horas). Conectividad dual: inalámbrica de baja latencia 2.4GHz y Bluetooth 5.2 para usar con consolas, PC y móviles simultáneamente. Almohadillas de espuma viscoelástica premium y diadema ajustable con suspensión automática. Controles táctiles en auricular para volumen, mute y EQ. Iluminación RGB sincronizable. Compatible con PS5, Xbox, Switch, PC y móviles. Incluye estuche de transporte rígido.', 'merchandising', '/assets/imagenes/merchandising/auricularesGaming.jpg'),
('Lámpara LED Pac-Man', 29.99, 'Lámpara LED decorativa con forma del icónico Pac-Man de 25cm de diámetro. Funciona con 16 colores diferentes y 4 modos de iluminación (fijo, respiración, destello y arcoíris) controlables mediante mando a distancia incluido. Fabricada en acrílico resistente con base de madera natural. Iluminación LED de bajo consumo que dura más de 50,000 horas. Alimentación por USB o 3 pilas AA (no incluidas) para portabilidad. Perfecta para decorar habitaciones gaming, oficinas o como luz nocturna. El diseño retro nostálgico la convierte en un regalo ideal para gamers de todas las generaciones. Licencia oficial de Bandai Namco con certificado de autenticidad.', 'merchandising', '/assets/imagenes/merchandising/lamparaPacMan.jpg'),
('Set de Pins Coleccionables Retro Gaming', 16.99, 'Colección de 6 pins esmaltados de metal con personajes y símbolos icónicos de videojuegos clásicos: Mario, Sonic, Pac-Man, Space Invaders, Tetris y la Triforce de Zelda. Cada pin mide aproximadamente 2.5cm y está fabricado en aleación de zinc con esmalte de colores vibrantes y acabado brillante. Incluye cierre de mariposa doble para máxima seguridad. Vienen presentados en tarjeta coleccionable con ilustraciones retro y código QR de autenticidad. Perfectos para personalizar mochilas, chaquetas, gorras o para coleccionar. Edición limitada con numeración individual. Licencias oficiales de Nintendo, SEGA y Atari. Ideal para nostalgia gamer y regalo para coleccionistas.', 'merchandising', '/assets/imagenes/merchandising/pins.jpg');

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
INSERT INTO juegos_plataformas (juego_id, plataforma_id, fecha_lanzamiento, control_stock) VALUES
-- Zelda (solo Switch) - stock 25
(1, 3, '2017-03-03', 25),

-- Elden Ring (multiplataforma) - stock 30 repartido
(2, 1, '2022-02-25', 8),
(2, 2, '2022-02-25', 8),
(2, 4, '2022-02-25', 7),
(2, 5, '2022-02-25', 7),

-- FIFA 24 (multiplataforma) - stock 50 repartido
(3, 1, '2023-09-29', 13),
(3, 2, '2023-09-29', 12),
(3, 3, '2023-09-29', 13),
(3, 4, '2023-09-29', 12),

-- Call of Duty (multiplataforma) - stock 40 repartido
(4, 1, '2023-11-10', 14),
(4, 2, '2023-11-10', 13),
(4, 4, '2023-11-10', 13),

-- Mario (solo Switch) - stock 20
(5, 3, '2017-10-27', 20),

-- Cyberpunk (multiplataforma) - stock 15 repartido
(6, 1, '2020-12-10', 4),
(6, 2, '2020-12-10', 4),
(6, 4, '2020-12-10', 4),
(6, 5, '2021-09-28', 3),

-- Red Dead 2 (multiplataforma) - stock 22 repartido
(7, 1, '2018-10-26', 8),
(7, 2, '2018-10-26', 7),
(7, 4, '2019-11-05', 7),

-- Minecraft (todas las plataformas) - stock 100 repartido
(8, 1, '2014-09-04', 25),
(8, 2, '2014-09-05', 25),
(8, 3, '2017-05-11', 25),
(8, 4, '2009-05-17', 25),

-- GTA V (multiplataforma) - stock 45 repartido
(9, 1, '2022-03-15', 12),
(9, 2, '2021-11-11', 11),
(9, 4, '2015-04-14', 11),
(9, 5, '2013-09-17', 11),

-- The Witcher 3 (multiplataforma) - stock 30 repartido
(10, 1, '2015-05-19', 8),
(10, 2, '2015-05-19', 8),
(10, 3, '2019-10-15', 7),
(10, 4, '2015-05-19', 7),

-- Hogwarts Legacy (multiplataforma) - stock 35 repartido
(11, 1, '2023-02-10', 7),
(11, 2, '2023-02-10', 7),
(11, 3, '2023-11-14', 7),
(11, 4, '2023-02-10', 7),
(11, 5, '2023-04-04', 7),

-- Starfield (Xbox y PC exclusivo) - stock 28 repartido
(12, 2, '2023-09-06', 14),
(12, 4, '2023-09-06', 14);

-- ============================================
-- INSERTS PARA CONSOLAS (Especialización)
-- ============================================

INSERT INTO consolas (producto_id, capacidad_almacenamiento, color, fabricante, plataforma_id, control_stock) VALUES
(13, '825GB SSD', 'Blanco y Negro', 'Sony', 1, 10),
(14, '1TB SSD', 'Negro', 'Microsoft', 2, 8),
(15, '64GB', 'Blanco', 'Nintendo', 3, 12),
(16, '825GB SSD', 'Blanco y Negro', 'Sony', 1, 5),
(17, '512GB SSD', 'Negro', 'Microsoft', 2, 15),
(18, '256GB SSD', 'Negro', 'Valve', 7, 7);

-- ============================================
-- INSERTS PARA MERCHANDISING (Especialización)
-- ============================================
INSERT INTO merchandising (producto_id, categoria, control_stock) VALUES
(19, 'Ropa', 50),           -- Camiseta Zelda
(20, 'Figuras', 30),        -- Funko Mario
(21, 'Accesorios', 25),     -- Mando DualSense
(22, 'Decoración', 100),    -- Poster Elden Ring
(23, 'Accesorios', 40),     -- Funda Switch
(24, 'Accesorios', 60),     -- Llavero PS
(25, 'Decoración', 35),     -- Taza Minecraft
(26, 'Accesorios', 20),     -- Mochila Gaming
(27, 'Accesorios', 28),     -- Alfombrilla Cyberpunk
(28, 'Accesorios', 18),     -- Auriculares Gaming
(29, 'Decoración', 45),     -- Lámpara Pac-Man
(30, 'Accesorios', 55);     -- Set Pins

-- ============================================
-- INSERTS PARA DIRECCIONES
-- ============================================
INSERT INTO direcciones (usuario_id, calle, numero_casa, ciudad, codigo_postal, region, telefono_contacto) VALUES
(1, 'Calle Gran Vía', '45', 'Madrid', '28013', 'peninsula', '612345678'),
(1, 'Paseo de Gracia', '92', 'Barcelona', '08008', 'peninsula', '623456789'),
(2, 'Avenida del Puerto', '12', 'Valencia', '46021', 'peninsula', '634567890'),
(3, 'Calle Sierpes', '28', 'Sevilla', '41004', 'peninsula', '645678901'),
(4, 'Gran Vía de Don Diego López de Haro', '66', 'Bilbao', '48011', 'peninsula', '656789012'),
(5, 'Calle Mayor', '15', 'Zaragoza', '50001', 'peninsula', '667890123'),
(6, 'Calle León y Castillo', '234', 'Las Palmas de Gran Canaria', '35005', 'canarias', '678901234'),
(2, 'Calle Colón', '8', 'Valencia', '46004', 'peninsula', '689012345');

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
-- plataforma_id: 0 para no-juegos; id de plataforma para juegos
INSERT INTO carrito (usuario_id, producto_id, plataforma_id, cantidad) VALUES
(1, 1, 3, 1),   -- Juan: Zelda (Switch)
(1, 13, 0, 1),  -- Juan: PS5 Standard (consola: plataforma_id=0)
(2, 3, 1, 2),   -- María: 2x FIFA (PS5)
(2, 19, 0, 1),  -- María: Camiseta Zelda (merchandising: plataforma_id=0)
(3, 2, 1, 1),   -- Carlos: Elden Ring (PS5)
(3, 21, 0, 2),  -- Carlos: 2x Mando DualSense (merchandising)
(4, 15, 0, 1),  -- Ana: Switch OLED (consola)
(4, 5, 3, 1),   -- Ana: Mario Odyssey (Switch)
(5, 8, 1, 1),   -- Luis: Minecraft (PS5)
(5, 25, 0, 1),  -- Luis: Taza Minecraft (merchandising)
(6, 6, 1, 1),   -- Sara: Cyberpunk (PS5)
(6, 27, 0, 1);  -- Sara: Alfombrilla Cyberpunk (merchandising)

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
-- (direccion_id referencia direcciones: 1=Madrid, 3=Valencia, 4=Sevilla, 5=Bilbao, 6=Zaragoza, 7=Las Palmas)
INSERT INTO pedidos (usuario_id, metodo_pago_id, total, estado, direccion_id, telefono_contacto, notas) VALUES
(1, 1, 609.98, 'entregado', 1, '612345678', 'Entregar en horario de tarde'),
(2, 3, 99.98, 'enviado', 3, '623456789', NULL),
(3, 4, 109.98, 'procesando', 4, '634567890', 'Urgente'),
(4, 5, 409.98, 'pendiente', 5, '645678901', NULL),
(1, 2, 24.99, 'entregado', 1, '612345678', NULL),
(5, 7, 129.97, 'enviado', 6, '656789012', 'Llamar antes de entregar'),
(6, 8, 449.98, 'procesando', 7, '667890123', NULL);

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