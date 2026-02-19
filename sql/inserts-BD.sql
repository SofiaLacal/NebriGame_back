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
('Starfield', 69.99, 'RPG espacial de Bethesda Game Studios que te lanza a explorar la Vía Láctea en el año 2330. Crea tu personaje y únete a Constellation, la última organización de exploradores espaciales. Visita más de 1000 planetas procedurales, construye y personaliza tu nave espacial, recluta tripulación y participa en combates espaciales épicos. Con un sistema de construcción de bases en planetas alienígenas, investigación científica profunda y decisiones que moldean facciones galácticas. Combina exploración espacial, FPS táctico y diálogos ramificados en una aventura de ciencia ficción hard con más de 200 horas de contenido, misiones de facciones y descubrimientos cósmicos.', 'juego', '/assets/imagenes/videojuegos/starfield.jpg'),
('Spider-Man 2', 69.99, 'Secuela exclusiva de PlayStation que te permite controlar tanto a Peter Parker como a Miles Morales en una Nueva York de mundo abierto expandida. Balancea por los rascacielos con mecánicas de web-swinging mejoradas, enfrenta a villanos icónicos como Venom y Kraven el Cazador, y alterna entre ambos Spider-Men con habilidades únicas. Con gráficos fotorrealistas potenciados por PS5, trazado de rayos en tiempo real, combate fluido mejorado con nuevos trajes y poderes, y una historia emocionante de 20+ horas. Incluye desafíos secundarios, coleccionables y actividades por toda la ciudad.', 'juego', '/assets/imagenes/videojuegos/spiderman2.jpg'),
('Forza Horizon 5', 59.99, 'Simulador de carreras arcade ambientado en México con más de 500 coches licenciados de las mejores marcas. Explora un mapa masivo con biomas diversos: desiertos, junglas, playas y ciudades coloniales. Personaliza cada aspecto de tus vehículos, desde pintura hasta ajustes mecánicos. Modo campaña con cientos de eventos, multijugador online cooperativo y competitivo, y eventos en vivo semanales. Gráficos impresionantes con 4K nativo, 60 FPS y clima dinámico que afecta las condiciones de conducción. Incluye Hot Wheels y Rally Adventure expansions con nuevos mundos.', 'juego', '/assets/imagenes/videojuegos/forzaHorizon5.jpg'),
('Baldur\'s Gate 3', 69.99, 'RPG por turnos basado en Dungeons & Dragons 5ª edición. Crea tu personaje desde 12 clases y 11 razas, cada una con habilidades únicas. Explora la Costa de la Espada en una aventura épica con decisiones que realmente importan. Sistema de combate táctico profundo, diálogos con miles de opciones, compañeros con historias complejas y romance. Más de 170 horas de contenido con rejugabilidad infinita gracias a las diferentes builds y decisiones. Soporte para hasta 4 jugadores en cooperativo online. Galardonado con más de 100 premios incluido GOTY 2023.', 'juego', '/assets/imagenes/videojuegos/baldursGate3.jpg'),
('God of War Ragnarök', 69.99, 'Continuación de la saga nórdica de Kratos y Atreus enfrentando el Ragnarök. Viaja por los Nueve Reinos, incluyendo Asgard y Vanaheim, con nuevas mecánicas de exploración y combate. Sistema de combate expandido con armas legendarias: Hachas del Leviatán, Espadas del Caos y nuevas armas místicas. Enfrenta dioses nórdicos como Thor y Odín en batallas épicas. Puzzles ambientales, exploración de mazmorras y jefes colosales. Gráficos deslumbrantes exclusivos de PS5 con modos rendimiento y calidad. Banda sonora orquestada y actuaciones galardonadas. 30+ horas de historia principal más contenido secundario.', 'juego', '/assets/imagenes/videojuegos/godOfWarRagnarok.jpg'),
('The Last of Us Part II', 59.99, 'Secuela aclamada de la aventura post-apocalíptica con Ellie como protagonista principal en una historia de venganza y redención. Explora Seattle infestada de infectados y humanos hostiles en entornos semi-abiertos detallados. Combate sigiloso mejorado, crafting expandido y mecánicas de supervivencia brutales. Narrativa madura dividida en múltiples perspectivas que desafía moralmente al jugador. Remasterizada para PS5 con modo roguelike permadeath, modo guitarra libre y gráficos mejorados. Más de 25 horas de campaña emocional con actuaciones premiadas y banda sonora inolvidable.', 'juego', '/assets/imagenes/videojuegos/theLastOfUs2Remake.jpg'),
('Resident Evil 4 Remake', 59.99, 'Remake completo del clásico survival horror con gráficos fotorrealistas del motor RE Engine. Leon S. Kennedy investiga en un pueblo europeo rural buscando a la hija del presidente. Combate modernizado en tercera persona con nuevo sistema de crafteo y sigilo. Enemigos renovados con IA mejorada, nuevas áreas explorables y rompecabezas rediseñados. Modo Mercenarios incluido con desafíos contrarreloj. Gráficos impresionantes con Ray Tracing, animaciones capturadas con actores reales y sonido 3D. 15-20 horas de campaña trepidante más rejugabilidad con diferentes dificultades y armas desbloqueables.', 'juego', '/assets/imagenes/videojuegos/residentEvil4.jpg'),
('Hades', 24.99, 'Roguelike de acción donde encarnas a Zagreo, hijo de Hades, intentando escapar del inframundo. Combate frenético con builds únicos en cada partida gracias a bendiciones de dioses olímpicos. Narrativa dinámica con diálogos totalmente doblados que evolucionan con cada muerte. Arte dibujado a mano impresionante y banda sonora nominada a premios. Más de 100 horas de contenido con desbloqueos permanentes, relaciones con personajes y múltiples finales. Modo cooperativo local para 2 jugadores. Dificultad ajustable mediante el Pacto de Castigo con 63 modificadores.', 'juego', '/assets/imagenes/videojuegos/hades.jpg'),
('Animal Crossing: New Horizons', 59.99, 'Simulador de vida en una isla desierta donde construyes tu paraíso personal. Personaliza tu personaje, casa y toda la isla con miles de objetos y diseños. Recolecta insectos, peces y fósiles para donar al museo. Cultiva flores híbridas, diseña ropa personalizada y decora exteriores e interiores. Calendario con eventos estacionales reales, visitas de personajes especiales y actualizaciones gratuitas constantes. Multijugador local y online para visitar islas de amigos. Más de 400 vecinos animales coleccionables con personalidades únicas. Juego relajante perfecto para todas las edades con cientos de horas de contenido.', 'juego', '/assets/imagenes/videojuegos/animalCrossing.jpg'),
('Sekiro: Shadows Die Twice', 59.99, 'Action-adventure de FromSoftware ambientado en el Japón feudal con shinobi como protagonista. Combate centrado en paradas perfectas y contadores precisos en lugar de esquivas. Explora Ashina durante la guerra Sengoku con mecánicas de gancho que permiten movilidad vertical. Jefes desafiantes que requieren dominar patrones de ataque y postura. Sistema de resurrección limitado que añade estrategia al morir. Múltiples finales basados en decisiones clave. Gráficos atmosféricos con diseño de niveles interconectado. Ganador del GOTY 2019. Incluye modo jefe rush y modificadores de dificultad en actualizaciones gratuitas.', 'juego', '/assets/imagenes/videojuegos/sekiro.jpg'),
('Milton\'s Quest', 24.99, 'LO QUE NOS DIGA FRAN', 'juego', '/assets/imagenes/videojuegos/miltonsQuest.jpg'),
('Splatoon 3', 59.99, 'Shooter multijugador colorido de Nintendo donde disparas tinta en lugar de balas. Modo campaña single-player con Return of the Mammalians enfrentando al ejercito Octariano. Turf War 4v4 donde cubres territorio con tinta de tu equipo. Más de 20 armas principales con variantes, sub-armas y especiales estratégicos. Salmon Run cooperativo contra hordas de salmónidos. Customiza tu Inkling/Octoling con ropa que ofrece bonificaciones. Eventos Splatfest regulares con temas votados por la comunidad. Nuevo modo ranked series con Anarchy Battles. Gráficos vibrantes a 60 FPS con soporte para controles de movimiento.', 'juego', '/assets/imagenes/videojuegos/splatoon3.jpg'),
('Diablo IV', 69.99, 'Action RPG hack and slash que regresa a las raíces oscuras de la franquicia. Explora el vasto mundo abierto de Santuario con 5 regiones distintas sin pantallas de carga. Elige entre 5 clases: Bárbaro, Hechicera, Pícaro, Druida y Nigromante, cada una con árboles de habilidades profundos. Mazmorras procedurales infinitas, eventos mundiales dinámicos y campos de pesadilla en endgame. Modo campaña de 35+ horas con cinematics in-engine impresionantes. PvP en zonas Fields of Hatred. Sistema de loot adictivo con items legendarios y aspectos codex. Temporadas con contenido y mecánicas nuevas cada 3 meses. Cooperativo para 4 jugadores.', 'juego', '/assets/imagenes/videojuegos/diablo4.jpg'),
('Horizon Forbidden West', 69.99, 'Secuela de mundo abierto donde Aloy explora el oeste post-apocalíptico de Estados Unidos. Descubre nuevas tribus, máquinas mejoradas y ruinas del viejo mundo. Sistema de combate mejorado con nuevo equipamiento, habilidades de planeo y buceo subacuático. Más de 40 tipos de máquinas para cazar con debilidades tácticas específicas. Historia épica sobre la salvación de la biosfera terrestre. Gráficos de última generación exclusivos de PS5 con modos rendimiento/calidad. Minijuegos como Machine Strike (juego de mesa estratégico), carreras de máquinas y arenas de combate. 30+ horas de historia más exploración exhaustiva.', 'juego', '/assets/imagenes/videojuegos/horizonForbiddenWest.jpg'),
('Metroid Dread', 59.99, 'Metroidvania 2D que concluye el arco de 35 años de la saga Metroid. Samus Aran investiga el planeta ZDR perseguida por robots E.M.M.I invencibles. Combate fluido con nuevas habilidades como contraataque cuerpo a cuerpo y sliding. Exploración no lineal con power-ups que desbloquean nuevas áreas. Jefes desafiantes que requieren dominar patrones. Gráficos 2.5D impresionantes a 60 FPS con animaciones detalladas. Modo Boss Rush y filtros retro desbloqueables. Banda sonora épica y diseño de niveles meticuloso. 8-12 horas en primera partida con rejugabilidad gracias a speedrun y logros.', 'juego', '/assets/imagenes/videojuegos/metroidDread.jpg'),
('Assassin\'s Creed Valhalla', 59.99, 'RPG de mundo abierto ambientado en la invasión vikinga de Inglaterra en el siglo IX. Crea tu propio vikingo Eivor (masculino/femenino) y lidera incursiones a monasterios sajones. Explora 4 reinos anglosajones más Noruega con decenas de horas de contenido. Sistema de combate visceral con hachas, espadas y escudos. Construye y mejora tu asentamiento reclutando NPCs especializados. Política dinámica formando alianzas con reyes locales. Incluye DLC Wrath of the Druids (Irlanda) e The Siege of Paris (Francia). Modo foto avanzado y eventos en vivo. Más de 60 horas de campaña principal.', 'juego', '/assets/imagenes/videojuegos/assassinsCreedValhalla.jpg'),
('Hollow Knight', 14.99, 'Metroidvania indie dibujado a mano ambientado en Hallownest, un reino de insectos subterráneo olvidado. Explora cavernas interconectadas, ciudades en ruinas y jardines fúngicos con más de 40 jefes únicos. Combate preciso basado en patrones con mecánicas de nail combat y magia. Personaliza tu build con 40+ charms intercambiables que modifican habilidades. Narrativa ambiental críptica con lore profundo descubierto mediante exploración. Más de 30 horas de contenido base con 4 DLC gratuitos incluidos. Banda sonora orquestada emotiva y diseño artístico impresionante. Speedrun friendly con múltiples finales desbloqueables.', 'juego', '/assets/imagenes/videojuegos/hollowKnight.jpg'),
('Pokémon Scarlet', 59.99, 'La última generación de Pokémon en un mundo abierto completamente explorable ambientado en la región de Paldea inspirada en España. Captura, entrena y combate con más de 400 Pokémon incluyendo nuevas especies y formas regionales. Tres historias entrelazadas: Camino del Campeón, Leyendas Estelares y Operación Estrella. Nuevas mecánicas de Teracristalización que cambian tipos en batalla. Modo cooperativo para 4 jugadores explorando juntos. Batallas de Incursión Teracristal contra Pokémon gigantes. Personaliza tu personaje con cientos de opciones de ropa. Legendarios únicos: Koraidon. Incluye actualización gratuita con contenido post-juego.', 'juego', '/assets/imagenes/videojuegos/pokemonScarlet.jpg'),
('Pokémon Violet', 59.99, 'La última generación de Pokémon en un mundo abierto completamente explorable ambientado en la región de Paldea inspirada en España. Captura, entrena y combate con más de 400 Pokémon incluyendo nuevas especies y formas regionales. Tres historias entrelazadas: Camino del Campeón, Leyendas Estelares y Operación Estrella. Nuevas mecánicas de Teracristalización que cambian tipos en batalla. Modo cooperativo para 4 jugadores explorando juntos. Batallas de Incursión Teracristal contra Pokémon gigantes. Personaliza tu personaje con cientos de opciones de ropa. Legendarios únicos: Miraidon. Incluye actualización gratuita con contenido post-juego.', 'juego', '/assets/imagenes/videojuegos/pokemonViolet.jpg'),
('Pokémon Legends: Arceus', 54.99, 'Reimaginación del RPG de Pokémon ambientada en la región de Hisui (antiguo Sinnoh) en una época feudal. Explora vastas áreas abiertas capturando Pokémon en tiempo real sin transiciones de batalla. Investiga y completa la primera Pokédex de la historia con mecánicas de sigilo y observación. Sistema de combate renovado con turnos ágiles y poderosos. Personaliza tu base en Villa Jubileo y completa misiones para la Brigada Galaxia. Enfrenta Pokémon nobles enloquecidos en batallas jefe de acción. Nuevas evoluciones regionales de Hisui. Crafting de Poké Balls y objetos. Ride Pokémon para explorar tierra, mar y aire. Historia épica sobre el origen de la región y Arceus.', 'juego', '/assets/imagenes/videojuegos/pokemonLegendsArceus.jpg'),
('Pokémon Brilliant Diamond', 59.99, 'Remake fiel de Pokémon Diamante con gráficos renovados estilo chibi 3D. Explora la región de Sinnoh capturando más de 490 Pokémon de las primeras cuatro generaciones. Desafía a gimnasios, la Liga Pokémon y completa la Pokédex Nacional. Mejoras de calidad de vida: EXP Share mejorado, TMs reutilizables, acceso al PC portátil. Grand Underground expandido con estatuas coleccionables que aumentan spawns. Compatibilidad con Pokémon HOME. Contest Shows renovados con ritmo musical. Batalla contra entrenadores del Team Galactic liderados por Helio. Captura a Dialga y explora el Mundo Distorsión. Incluye Parque Compi actualizado. Multijugador local y online.', 'juego', '/assets/imagenes/videojuegos/pokemonBrilliantDiamond.jpg'),
('Pokémon Shining Pearl', 59.99, 'Remake fiel de Pokémon Perla con gráficos renovados estilo chibi 3D. Explora la región de Sinnoh capturando más de 490 Pokémon de las primeras cuatro generaciones. Desafía a gimnasios, la Liga Pokémon y completa la Pokédex Nacional. Mejoras de calidad de vida: EXP Share mejorado, TMs reutilizables, acceso al PC portátil. Grand Underground expandido con estatuas coleccionables que aumentan spawns. Compatibilidad con Pokémon HOME. Contest Shows renovados con ritmo musical. Batalla contra entrenadores del Team Galactic liderados por Helio. Captura a Palkia y explora el Mundo Distorsión. Incluye Parque Compi actualizado. Multijugador local y online.', 'juego', '/assets/imagenes/videojuegos/pokemonShiningPearl.jpg'),
('Kirby and the Forgotten Land', 59.99, 'Primera aventura 3D completa de Kirby en un mundo misterioso post-apocalíptico. Explora la Tierra Olvidada, un lugar lleno de estructuras abandonadas de una civilización pasada. Utiliza el nuevo poder de Metamorfosis de Mouthful Mode para poseer objetos grandes como coches, máquinas expendedoras y conos de tráfico. Copia más de 12 habilidades clásicas mejoradas con evoluciones únicas. Modo cooperativo local para 2 jugadores donde el segundo controla a Bandana Waddle Dee con lanza. Recolecta Waddle Dees perdidos para reconstruir tu pueblo. Jefes épicos, minijuegos variados y desafíos post-juego. Niveles diseñados con secretos y objetivos opcionales. La aventura más ambiciosa de Kirby con 12-15 horas de contenido principal.', 'juego', '/assets/imagenes/videojuegos/kirbyForgottenLand.jpg'),
('Kirby\'s Return to Dream Land Deluxe', 59.99, 'Remake mejorado del clásico de Wii con gráficos renovados y nuevo contenido. Aventura de plataformas cooperativa para hasta 4 jugadores locales. Ayuda a Magolor a reparar su nave espacial Lor Starcutter explorando Dream Land. Copia más de 25 habilidades diferentes, cada una con movimientos únicos y devastadores. Nuevas habilidades Mecha y Sand exclusivas del remake. Modo Magolor\'s Epilogue añade una historia post-juego jugable completamente nueva. Minijuegos competitivos actualizados con nuevos desafíos. Recolecta Energy Spheres para desbloquear habilidades Super con ataques espectaculares. Diseño de niveles clásico de plataformas con secretos en cada etapa. Perfecto para jugar en familia con dificultad accesible y rejugabilidad infinita. 15-20 horas de contenido con todos los coleccionables.', 'juego', '/assets/imagenes/videojuegos/kirbyReturnDreamLand.jpg'),
('Kirby Star Allies', 59.99, 'Aventura cooperativa de plataformas para hasta 4 jugadores donde Kirby puede convertir enemigos en aliados. Lanza corazones para hacer amigos y formar un equipo poderoso con habilidades combinables. Más de 28 habilidades de copia con variantes elementales: fuego, hielo, agua y electricidad. Combina poderes con aliados para crear Friend Abilities devastadoras y resolver puzzles. Historia principal que enfrenta a Kirby contra la oscuridad que amenaza Dream Land. Modo Guest Star con personajes jugables desbloqueables de toda la saga. The Ultimate Choice: modo jefe rush con dificultades extremas. Heroes in Another Dimension: modo historia adicional post-juego. Constantes actualizaciones gratuitas añadieron 20+ personajes jugables famosos de la serie. Gráficos coloridos y vibrantes con música orquestada. Perfecto para toda la familia con 15+ horas de contenido.', 'juego', '/assets/imagenes/videojuegos/kirbyStarAllies.jpg');

-- ============================================
-- INSERTS PARA PRODUCTOS BASE - CONSOLAS
-- ============================================
INSERT INTO productos (nombre, precio, descripcion, tipo, imagen_url) VALUES
('PlayStation 5 Standard', 549.99, 'Consola de nueva generación de Sony equipada con lector de discos Blu-ray 4K UHD. Ofrece gráficos en resolución 4K, tecnología de trazado de rayos (Ray Tracing), audio 3D envolvente y tiempos de carga ultrarrápidos gracias a su SSD de alta velocidad. Incluye el mando inalámbrico DualSense con retroalimentación háptica y gatillos adaptativos para una experiencia de juego más inmersiva.', 'consola', '/assets/imagenes/consolas/playStationStandar.jpg'),
('Xbox Series X', 499.99, 'La consola más potente de Microsoft, diseñada para ofrecer un rendimiento excepcional con 12 teraflops de potencia gráfica. Compatible con resolución 4K real, hasta 120 FPS y tecnología Ray Tracing. Incorpora un SSD NVMe de alta velocidad para cargas casi instantáneas y es compatible con miles de juegos de generaciones anteriores gracias a su retrocompatibilidad.', 'consola', '/assets/imagenes/consolas/xboxSeriesX.jpg'),
('Nintendo Switch OLED', 349.99, 'Versión mejorada de la Nintendo Switch que cuenta con una pantalla OLED de 7 pulgadas con colores más intensos y mejor contraste. Permite jugar en modo portátil, sobremesa o conectado al televisor. Incluye base con puerto LAN integrado, almacenamiento interno ampliado y sonido mejorado para una experiencia más versátil y familiar.', 'consola', '/assets/imagenes/consolas/nintendoSwitchOled.jpg'),
('PlayStation 5 Digital', 449.99, 'Edición digital de la PlayStation 5 que prescinde del lector de discos, ideal para quienes prefieren comprar y descargar sus juegos en formato digital. Mantiene la misma potencia, SSD ultrarrápido, soporte para 4K, Ray Tracing y mando DualSense con funciones avanzadas de inmersión.', 'consola', '/assets/imagenes/consolas/playStationDigital.jpg'),
('Xbox Series S', 299.99, 'Consola compacta y totalmente digital de Microsoft, diseñada para jugar a nueva generación en resolución hasta 1440p con soporte para 120 FPS. Incluye un SSD rápido para tiempos de carga reducidos y acceso a Xbox Game Pass, ofreciendo una excelente relación calidad-precio en un formato pequeño y moderno.', 'consola', '/assets/imagenes/consolas/xboxSeriesS.jpg'),
('Steam Deck', 419.99, 'Consola portátil desarrollada por Valve que permite jugar a tu biblioteca de Steam en cualquier lugar. Equipada con un potente hardware personalizado, pantalla táctil de alta resolución y controles integrados completos. Funciona con SteamOS basado en Linux y permite instalar otros sistemas operativos, ofreciendo gran flexibilidad para jugadores avanzados.', 'consola', '/assets/imagenes/consolas/steamDeck.jpg'),
('Meta Quest 3', 549.99, 'Headset de realidad virtual y mixta de última generación con procesador Snapdragon XR2 Gen 2. Resolución 4K+ (2064x2208 por ojo) con lentes pancake que reducen el grosor. Tecnología de realidad mixta con cámaras passthrough a color en alta definición para ver tu entorno. Biblioteca de más de 500 juegos y apps de VR. Controles Touch Plus sin sensores externos. Audio espacial 3D integrado. Almacenamiento de 128GB o 512GB. Sin necesidad de PC - sistema todo en uno. Compatible con juegos de Quest, Quest 2 y PCVR mediante cable o wireless. Perfecta para gaming, fitness, productividad y socialización en mundos virtuales.', 'consola', '/assets/imagenes/consolas/metaQuest3.jpg'),
('Nintendo Switch Lite', 199.99, 'Versión compacta y portátil de Nintendo Switch diseñada exclusivamente para juego en modo portátil. Pantalla táctil de 5.5 pulgadas más ligera que el modelo estándar. Controles integrados con cruceta d-pad tradicional. Disponible en múltiples colores vibrantes: turquesa, amarillo, gris, coral y azul. Batería de larga duración con 3-7 horas de juego dependiendo del título. Compatible con todos los juegos de Switch que soportan modo portátil. Perfecta para viajes y gaming on-the-go. Incluye WiFi para multijugador online y descarga de juegos digitales. Ideal para jugadores que priorizan portabilidad sobre juego en TV.', 'consola', '/assets/imagenes/consolas/switchLite.jpg'),
('PlayStation 4 Pro', 399.99, 'Consola de generación anterior potenciada con soporte para resolución 4K y HDR. Hardware mejorado con GPU más potente para mejor framerate y gráficos. Biblioteca masiva de más de 4000 juegos retrocompatibles de PS4. Incluye disco duro de 1TB para almacenar decenas de juegos. Compatible con PlayStation VR para experiencias de realidad virtual. Streaming de juegos en 1080p via Share Play. Acceso a PlayStation Plus para multijugador online y juegos gratuitos mensuales. Perfecta como consola secundaria o para jugadores con presupuesto ajustado que quieren calidad AAA.', 'consola', '/assets/imagenes/consolas/ps4Pro.jpg'),
('Xbox One X', 499.99, 'La consola Xbox más potente de la generación anterior con soporte 4K nativo real. Potencia de procesamiento de 6 teraflops que ejecuta juegos enhanced a resoluciones superiores. Disco duro de 1TB con acceso a toda la biblioteca de Xbox One, 360 y juegos originales compatibles. 4K Blu-ray player integrado para películas en máxima calidad. Retrocompatibilidad mejorada con auto-HDR para juegos antiguos. Xbox Game Pass Ultimate incluye acceso a cientos de juegos por suscripción. Diseño compacto en color negro mate con enfriamiento silencioso avanzado. Ideal para gaming 4K sin saltar a nueva generación.', 'consola', '/assets/imagenes/consolas/xboxOneX.jpg'),
('Steam Deck OLED', 549.99, 'Versión mejorada de Steam Deck con pantalla OLED HDR de 7.4 pulgadas y 90Hz. Mayor duración de batería (30-50% más autonomía que el modelo base). WiFi 6E para descargas más rápidas. Almacenamiento de 512GB o 1TB NVMe SSD. Mismo procesador AMD custom con gráficos RDNA 2. Juega a miles de títulos de tu biblioteca Steam verificados para Deck. Dock opcional para conectar a TV y periféricos. Soporte para modificaciones de sistema operativo incluyendo Windows. Controles ergonómicos con trackpads precisos y giroscopios. Audio mejorado con DSP dedicado. Perfecta para juego AAA portátil con calidad PC.', 'consola', '/assets/imagenes/consolas/steamDeckOled.jpg'),
('Nintendo Switch V2', 299.99, 'Modelo revisado de Nintendo Switch con batería mejorada (4.5-9 horas vs 2.5-6.5 del original). Procesador Tegra optimizado que consume menos energía. Juega en TV, modo sobremesa o portátil con transición instantánea. Joy-Cons desmontables con motion controls y HD rumble. Pantalla táctil capacitiva de 6.2 pulgadas. 32GB de almacenamiento expandible con microSD hasta 2TB. Biblioteca de exclusivos Nintendo: Mario, Zelda, Pokemon, Smash Bros. Multijugador local para hasta 8 consolas sin WiFi. Compatible con amiibo y Nintendo Switch Online. La consola híbrida perfecta para familias y gaming flexible.', 'consola', '/assets/imagenes/consolas/switchV2.jpg');

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
('Set de Pins Coleccionables Retro Gaming', 16.99, 'Colección de 6 pins esmaltados de metal con personajes y símbolos icónicos de videojuegos clásicos: Mario, Sonic, Pac-Man, Space Invaders, Tetris y la Triforce de Zelda. Cada pin mide aproximadamente 2.5cm y está fabricado en aleación de zinc con esmalte de colores vibrantes y acabado brillante. Incluye cierre de mariposa doble para máxima seguridad. Vienen presentados en tarjeta coleccionable con ilustraciones retro y código QR de autenticidad. Perfectos para personalizar mochilas, chaquetas, gorras o para coleccionar. Edición limitada con numeración individual. Licencias oficiales de Nintendo, SEGA y Atari. Ideal para nostalgia gamer y regalo para coleccionistas.', 'merchandising', '/assets/imagenes/merchandising/pins.jpg'),
('Tarjeta Regalo PlayStation Network 50€', 50.00, 'Tarjeta regalo digital de PlayStation Network con saldo de 50€ para gastar en PlayStation Store. Válida para comprar juegos digitales, DLC, expansiones, suscripciones PS Plus y contenido multimedia en PS5 y PS4. Código de canje que se activa instantáneamente en tu cuenta PSN. No caduca y el saldo se añade directamente a tu monedero de PlayStation. Perfecta como regalo para cualquier jugador de PlayStation. Instrucciones de canje incluidas. Compatible con todas las cuentas de la región europea. No requiere tarjeta de crédito para usar el saldo.', 'merchandising', '/assets/imagenes/merchandising/psn50.jpg'),
('Tarjeta Regalo Xbox Live 25€', 25.00, 'Tarjeta regalo de Xbox con 25€ de saldo para Microsoft Store. Úsala para comprar juegos digitales de Xbox Series X|S, Xbox One, contenido descargable, suscripciones a Xbox Game Pass Ultimate y aplicaciones. Código digital de activación inmediata que se añade a tu cuenta Microsoft. Compatible con Xbox Series X|S, Xbox One y PC con Windows. El saldo no caduca. Ideal como regalo para jugadores de Xbox. Incluye instrucciones de canje. Región europea. Perfecta para aprovechar ofertas y rebajas de la tienda digital.', 'merchandising', '/assets/imagenes/merchandising/xbox25.jpg'),
('Tarjeta Nintendo eShop 35€', 35.00, 'Tarjeta prepago de Nintendo eShop con 35€ de crédito para comprar juegos digitales, DLC y suscripciones a Nintendo Switch Online. Código de descarga digital que se activa instantáneamente. Válida para Nintendo Switch y familia de consolas 3DS. El saldo se añade a tu cuenta Nintendo y no caduca. Accede a miles de juegos indie, títulos AAA y exclusivos de Nintendo. Perfecta como regalo para fans de Nintendo. Compatible con cuentas europeas. Incluye instrucciones de canje en español. Sin necesidad de tarjeta de crédito para usar el crédito.', 'merchandising', '/assets/imagenes/merchandising/eshop35.jpg'),
('Tarjeta Steam 20€', 20.00, 'Tarjeta regalo de Steam Wallet con 20€ para comprar juegos, DLC, software y contenido en la plataforma Steam. Código digital de activación inmediata que se añade a tu monedero de Steam. Compatible con PC, Mac y Steam Deck. Accede a la biblioteca más grande de juegos de PC con miles de títulos disponibles. El saldo no caduca y se puede usar en rebajas y ofertas especiales. Perfecta para regalar a gamers de PC. Incluye instrucciones de canje. Región europea. También válida para comprar contenido del mercado comunitario de Steam.', 'merchandising', '/assets/imagenes/merchandising/steam20.jpg'),
('Cable HDMI 2.1 Premium 2 metros', 12.99, 'Cable HDMI de alta velocidad certificado HDMI 2.1 con soporte para resolución 8K@60Hz y 4K@120Hz. Perfecto para conectar PlayStation 5, Xbox Series X, PC gaming y dispositivos multimedia a TV o monitor. Soporte completo para tecnologías HDR10+, Dolby Vision, eARC para audio sin pérdida y VRR (Variable Refresh Rate). Construcción premium con conectores chapados en oro 24K resistentes a la corrosión. Cable trenzado de nylon duradero con protección EMI/RFI. Longitud de 2 metros ideal para sala de estar o gaming. Compatible con todas las versiones anteriores de HDMI. Garantía de 3 años.', 'merchandising', '/assets/imagenes/merchandising/hdmi21.jpg'),
('Soporte Vertical para Consolas', 16.99, 'Soporte vertical universal con ventilación activa para consolas PlayStation 5, Xbox Series X/S. Diseño de torre que ahorra espacio con base antideslizante estable. Sistema de ventilación con 2 ventiladores silenciosos que mejoran el flujo de aire y mantienen la consola refrigerada durante sesiones largas. Incluye 2 puertos de carga USB adicionales para mandos. Compartimentos para almacenar hasta 12 juegos físicos. LED indicador de encendido. Construcción en ABS de alta calidad. Alimentación por USB con cable incluido. Fácil instalación sin herramientas. Protege tu consola del polvo y sobrecalentamiento.', 'merchandising', '/assets/imagenes/merchandising/soporteConsola.jpg'),
('Base de Carga Dual para Mandos PS5', 24.99, 'Estación de carga oficial para dos mandos DualSense de PlayStation 5. Diseño elegante que combina con la estética de PS5. Carga rápida simultánea de 2 mandos en 3 horas. Indicadores LED que muestran el estado de carga (naranja cargando, blanco completado). Protección contra sobrecarga y cortocircuito. Conexión mediante puerto USB-C con cable de alimentación incluido. Los mandos se acoplan magnéticamente con click satisfactorio. Base antideslizante con peso balanceado. Acabado en blanco mate a juego con la consola. Compatible con todos los colores de DualSense. Mantén tus mandos siempre listos para jugar.', 'merchandising', '/assets/imagenes/merchandising/cargadorDual.jpg'),
('Pegatinas Gamer Pack 50 unidades', 8.99, 'Pack de 50 pegatinas adhesivas de vinilo resistente con diseños de videojuegos populares: logos de consolas, personajes icónicos, memes gaming y símbolos retro. Incluye stickers de PlayStation, Xbox, Nintendo, Steam, Minecraft, Among Us, Fortnite y más. Pegatinas impermeables y resistentes a rayones, perfectas para personalizar laptops, consolas, mandos, botellas de agua y mochilas. Tamaños variados entre 5-10cm. Fáciles de pegar y remover sin dejar residuos. Colores vibrantes con acabado brillante. Impresas con tintas de alta calidad resistentes a la decoloración. Perfectas para gamers que quieren personalizar su setup.', 'merchandising', '/assets/imagenes/merchandising/pegatinasGamer.jpg'),
('Artbook The Legend of Zelda: Tears of the Kingdom', 39.99, 'Libro de arte oficial de tapa dura con más de 400 páginas de ilustraciones exclusivas de The Legend of Zelda: Tears of the Kingdom. Incluye bocetos conceptuales, diseños de personajes, paisajes de Hyrule, criaturas, armas y mazmorras. Comentarios de los desarrolladores sobre el proceso creativo. Sección de arte final en alta calidad. Encuadernación premium de 24x32cm con sobrecubierta protectora. Papel couché de 170g/m² para reproducción óptima de colores. Texto en español con licencia oficial de Nintendo. Perfecto para coleccionistas y fans de la saga Zelda. Incluye póster desplegable a doble página.', 'merchandising', '/assets/imagenes/merchandising/artbookZelda.jpg'),
('Guía Oficial Elden Ring - Edición Coleccionista', 34.99, 'Guía estratégica completa de Elden Ring en tapa dura de 512 páginas. Incluye walkthrough paso a paso de la historia principal y misiones secundarias, mapas detallados de todas las regiones, localización de objetos coleccionables, builds optimizados para cada clase, estrategias para los 120+ jefes, guía de crafteo y mejoras. Sección de PvP y cooperativo multijugador. Ilustraciones exclusivas y arte conceptual. Marcador de páginas integrado. Papel de alta calidad con impresión a color. Formato grande 21x28cm para consulta fácil mientras juegas. Texto en español. Licencia oficial de Bandai Namco y FromSoftware. Edición coleccionista con sobrecubierta metálica.', 'merchandising', '/assets/imagenes/merchandising/guiaEldenRing.jpg'),
('Figura amiibo Link - Tears of the Kingdom', 16.99, 'Figura amiibo oficial de Nintendo de Link del juego Tears of the Kingdom. Diseño detallado de alta calidad con Link en pose dinámica usando la Maestro Master Sword. Mide aproximadamente 14cm de altura con base con logo de Zelda. Funcionalidad NFC integrada que desbloquea contenido exclusivo en juegos compatibles de Switch: armas especiales, trajes, objetos raros y paraglider personalizado en TOTK. Compatible con más de 30 juegos de Switch incluyendo toda la saga Zelda. Base de exhibición incluida. Empaque de ventana para coleccionistas. Licencia oficial Nintendo. Recomendado para mayores de 6 años.', 'merchandising', '/assets/imagenes/merchandising/amiiboLink.jpg'),
('Figura amiibo Mario', 15.99, 'Figura amiibo oficial de Nintendo de Super Mario en su pose icónica de salto. Escultura detallada de 11cm de altura con colores vibrantes y acabados de calidad. Base con logo de Super Mario Bros. Chip NFC integrado que desbloquea contenido especial en docenas de juegos de Nintendo Switch: trajes, power-ups, objetos y funciones exclusivas en Super Mario Odyssey, Mario Kart 8 Deluxe, Super Smash Bros Ultimate y más. También funciona como figura coleccionable de display. Compatible con todos los juegos que soportan amiibo. Empaque de ventana premium. Licencia oficial de Nintendo. Perfecto para fans de Mario de todas las edades.', 'merchandising', '/assets/imagenes/merchandising/amiiboMario.jpg'),
('Mando Pro Controller para Nintendo Switch', 69.99, 'Mando profesional inalámbrico oficial de Nintendo para Switch con diseño ergonómico tradicional. Incluye giroscopio y acelerómetro para motion controls precisos, vibración HD, botón de captura y comunicación NFC para amiibo. Batería recargable de larga duración con hasta 40 horas de juego continuo. Carga mediante USB-C (cable incluido). D-pad tradicional de alta precisión perfecto para juegos 2D y fighting. Grips texturizados antideslizantes. Compatible con PC mediante cable o Bluetooth. Firmware actualizable. Soporte para control por cable con latencia mínima. Color negro clásico. Garantía oficial de Nintendo. El mejor mando para sesiones largas de juego.', 'merchandising', '/assets/imagenes/merchandising/proController.jpg'),
('Kit de Limpieza para Consolas y Mandos', 14.99, 'Kit completo de limpieza profesional para mantener consolas y mandos en perfecto estado. Incluye: líquido limpiador especial libre de alcohol (100ml), 10 bastoncillos de espuma, 5 paños de microfibra anti-estática, cepillo suave de cerdas, herramientas de plástico para ranuras, guantes sin pelusa. Fórmula segura para todas las superficies: plástico, metal, goma. Elimina grasa, polvo, suciedad y marcas de dedos sin dañar componentes electrónicos. Perfecto para limpiar mandos, consolas, cartuchos, pantallas y accesorios. Estuche de transporte incluido. Instructivo con mejores prácticas de limpieza. Mantén tu equipo gaming como nuevo.', 'merchandising', '/assets/imagenes/merchandising/kitLimpieza.jpg'),
('Peluche Psyduck Gigante', 39.99, 'Peluche oficial de Pokémon del adorable Psyduck en tamaño gigante de 50cm de altura. Fabricado en poliéster ultra suave de alta calidad con relleno hipoalergénico. Detalles bordados en rostro: ojos confundidos característicos, pico amarillo y expresión perpetuamente desconcertada que lo hace irresistible. Brazos y patas posicionables. Lavable a máquina en agua fría en ciclo delicado. Certificado de seguridad CE para niños de todas las edades. Licencia oficial The Pokémon Company con etiqueta holográfica de autenticidad. Perfecto para abrazar, decorar habitación o regalo para fans de Pokémon. Presentado en bolsa transparente reutilizable con diseño de Psyduck.', 'merchandising', '/assets/imagenes/merchandising/peluchePsyduck.jpg'),
('Figura Coleccionable Psyduck Deluxe', 29.99, 'Figura premium de Psyduck en pose clásica sujetándose la cabeza con expresión confundida. Mide 18cm de altura con detalles esculpidos meticulosos. Pintado a mano con colores vibrantes: amarillo brillante, pico naranja y ojos negros expresivos. Incluye base de display con logo Pokémon con efecto de agua translúcido simulando una piscina. Fabricada en PVC y ABS de alta calidad con 8 puntos de articulación para diferentes poses. Empaque de ventana premium perfecto para coleccionistas. Licencia oficial The Pokémon Company. Compatible con otras figuras de la línea Pokémon Select. Recomendada para mayores de 6 años. Edición limitada numerada con certificado de autenticidad.', 'merchandising', '/assets/imagenes/merchandising/figuraPsyduck.jpg'),
('Taza 3D Psyduck con Tapa', 18.99, 'Taza de cerámica premium de 400ml con diseño 3D de la cabeza de Psyduck como tapa removible. El cuerpo de la taza presenta ilustraciones de Psyduck en diferentes expresiones confundidas y usando movimientos tipo Agua. Tapa de silicona con forma de cabeza de Psyduck que actúa como sello hermético para mantener bebidas calientes. Asa ergonómica lateral con forma de ala. Apta para microondas (sin la tapa) y lavavajillas (rack superior). Colores amarillo vibrante y detalles pintados. Fabricada en cerámica de alta calidad libre de BPA. Licencia oficial The Pokémon Company. Perfecta para fans de Psyduck que quieren llevar a su Pokémon favorito a la oficina. Viene en caja de regalo decorada.', 'merchandising', '/assets/imagenes/merchandising/tazaPsyduck.jpg'),
('Llavero Psyduck de Goma', 9.99, 'Llavero adorable de Psyduck fabricado en goma de silicona suave y flexible de alta calidad. Diseño chibi kawaii de 6cm con Psyduck en pose icónica sujetándose la cabeza. Colores amarillo brillante y detalles pintados a mano. Anilla metálica resistente de acero inoxidable de 3cm. Material duradero resistente a golpes y caídas. No se decolora con el uso. Perfecto para llaves, mochilas, estuches o como charm decorativo. Ligero y compacto. Empaque con diseño de Psyduck y código QR de autenticidad. Licencia oficial The Pokémon Company. Ideal como regalo económico para fans de Pokémon. Parte de la colección de llaveros Pokémon con más de 50 especies disponibles.', 'merchandising', '/assets/imagenes/merchandising/llaveroPsyduck.jpg');

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
(12, 'RPG', 16),         -- Starfield
(13, 'Acción', 12),      -- Spider-Man 2
(14, 'Carreras', 3),     -- Forza Horizon 5
(15, 'RPG', 18),         -- Baldur's Gate 3
(16, 'Acción', 18),      -- God of War Ragnarök
(17, 'Aventura', 18),    -- The Last of Us Part II
(18, 'Survival Horror', 18), -- Resident Evil 4 Remake
(19, 'Roguelike', 12),   -- Hades
(20, 'Simulación', 3),   -- Animal Crossing
(21, 'Acción', 16),      -- Sekiro
(22, 'Plataformas', 3),  -- Milton's Quest
(23, 'Shooter', 7),      -- Splatoon 3
(24, 'RPG', 18),         -- Diablo IV
(25, 'Aventura', 12),    -- Horizon Forbidden West
(26, 'Acción', 12),      -- Metroid Dread
(27, 'Acción', 18),      -- Assassin's Creed Valhalla
(28, 'Metroidvania', 7), -- Hollow Knight
(29, 'RPG', 7),          -- Pokémon Scarlet
(30, 'RPG', 7),          -- Pokémon Violet
(31, 'RPG', 7),          -- Pokémon Legends Arceus
(32, 'RPG', 7),          -- Pokémon Brilliant Diamond
(33, 'RPG', 7),          -- Pokémon Shining Pearl
(34, 'Plataformas', 3),  -- Kirby Forgotten Land
(35, 'Plataformas', 3),  -- Kirby Return to Dream Land
(36, 'Plataformas', 3);  -- Kirby Star Allies

-- ============================================
-- INSERTS PARA JUEGOS_PLATAFORMAS (N:N)
-- ============================================
INSERT INTO juegos_plataformas (juego_id, plataforma_id, control_stock) VALUES
-- Zelda (solo Switch) - stock 25
(1, 3, 25),

-- Elden Ring (multiplataforma) - stock 30 repartido
(2, 1, 8),
(2, 2, 8),
(2, 4, 7),
(2, 5, 7),

-- FIFA 24 (multiplataforma) - stock 50 repartido
(3, 1, 13),
(3, 2, 12),
(3, 3, 13),
(3, 4, 12),

-- Call of Duty (multiplataforma) - stock 40 repartido
(4, 1, 14),
(4, 2, 13),
(4, 4, 13),

-- Mario (solo Switch) - stock 20
(5, 3, 20),

-- Cyberpunk (multiplataforma) - stock 15 repartido
(6, 1, 4),
(6, 2, 4),
(6, 4, 4),
(6, 5, 3),

-- Red Dead 2 (multiplataforma) - stock 22 repartido
(7, 1, 8),
(7, 2, 7),
(7, 4, 7),

-- Minecraft (todas las plataformas) - stock 100 repartido
(8, 1, 25),
(8, 2, 25),
(8, 3, 25),
(8, 4, 25),

-- GTA V (multiplataforma) - stock 45 repartido
(9, 1, 12),
(9, 2, 11),
(9, 4, 11),
(9, 5, 11),

-- The Witcher 3 (multiplataforma) - stock 30 repartido
(10, 1, 8),
(10, 2, 8),
(10, 3, 7),
(10, 4, 7),

-- Hogwarts Legacy (multiplataforma) - stock 35 repartido
(11, 1, 7),
(11, 2, 7),
(11, 3, 7),
(11, 4, 7),
(11, 5, 7),

-- Starfield (Xbox y PC exclusivo) - stock 28 repartido
(12, 2, 14),
(12, 4, 14),

-- Spider-Man 2 (solo PS5) - stock 20
(13, 1, 20),

-- Forza Horizon 5 (Xbox y PC) - stock 35
(14, 2, 18),
(14, 4, 17),

-- Baldur's Gate 3 (multiplataforma) - stock 30
(15, 1, 10),
(15, 2, 10),
(15, 4, 10),

-- God of War Ragnarök (solo PS5) - stock 18
(16, 1, 18),

-- The Last of Us Part II (solo PS) - stock 25
(17, 1, 13),
(17, 5, 12),

-- RE4 Remake (multiplataforma) - stock 32
(18, 1, 11),
(18, 2, 11),
(18, 4, 10),

-- Hades (multiplataforma) - stock 40
(19, 1, 10),
(19, 2, 10),
(19, 3, 10),
(19, 4, 10),

-- Animal Crossing (solo Switch) - stock 30
(20, 3, 30),

-- Sekiro (multiplataforma) - stock 28
(21, 1, 9),
(21, 2, 10),
(21, 4, 9),

-- Milton's Quest (Switch y PC) - stock 24
(22, 3, 11),
(22, 4, 13),

-- Splatoon 3 (solo Switch) - stock 22
(23, 3, 22),

-- Diablo IV (multiplataforma) - stock 36
(24, 1, 12),
(24, 2, 12),
(24, 4, 12),

-- Horizon Forbidden West (solo PS) - stock 24
(25, 1, 12),
(25, 5, 12),

-- Metroid Dread (solo Switch) - stock 19
(26, 3, 19),

-- AC Valhalla (multiplataforma) - stock 38
(27, 1, 13),
(27, 2, 13),
(27, 4, 12),

-- Hollow Knight (todas las plataformas) - stock 50
(28, 1, 13),
(28, 2, 12),
(28, 3, 13),
(28, 4, 12),

-- Pokémon Scarlet (solo Switch) - stock 35
(29, 3, 35),

-- Pokémon Violet (solo Switch) - stock 35
(30, 3, 35),

-- Pokémon Legends Arceus (solo Switch) - stock 28
(31, 3, 28),

-- Pokémon Brilliant Diamond (solo Switch) - stock 24
(32, 3, 24),

-- Pokémon Shining Pearl (solo Switch) - stock 24
(33, 3, 24),

-- Kirby Forgotten Land (solo Switch) - stock 26
(34, 3, 26),

-- Kirby Return to Dream Land (solo Switch) - stock 22
(35, 3, 22),

-- Kirby Star Allies (solo Switch) - stock 20
(36, 3, 20);

-- ============================================
-- INSERTS PARA CONSOLAS (Especialización)
-- ============================================
INSERT INTO consolas (producto_id, capacidad_almacenamiento, color, fabricante, plataforma_id, control_stock) VALUES
(37, '825GB SSD', 'Blanco y Negro', 'Sony', 1, 10),
(38, '1TB SSD', 'Negro', 'Microsoft', 2, 8),
(39, '64GB', 'Blanco', 'Nintendo', 3, 12),
(40, '825GB SSD', 'Blanco y Negro', 'Sony', 1, 5),
(41, '512GB SSD', 'Negro', 'Microsoft', 2, 15),
(42, '256GB SSD', 'Negro', 'Valve', 7, 7),
(43, '128GB', 'Blanco', 'Meta', 8, 6),
(44, '32GB', 'Turquesa', 'Nintendo', 3, 18),
(45, '1TB HDD', 'Negro', 'Sony', 5, 12),
(46, '1TB HDD', 'Negro', 'Microsoft', 6, 9),
(47, '512GB SSD', 'Negro', 'Valve', 7, 5),
(48, '32GB', 'Rojo y Azul', 'Nintendo', 3, 14);

-- ============================================
-- INSERTS PARA MERCHANDISING (Especialización)
-- ============================================
INSERT INTO merchandising (producto_id, categoria, control_stock) VALUES
(49, 'Ropa', 50),                 -- Camiseta Zelda
(50, 'Figuras', 30),              -- Funko Mario
(51, 'Accesorios', 25),           -- Mando DualSense
(52, 'Decoración', 100),          -- Poster Elden Ring
(53, 'Accesorios', 40),           -- Funda Switch
(54, 'Accesorios', 60),           -- Llavero PS
(55, 'Decoración', 35),           -- Taza Minecraft
(56, 'Accesorios', 20),           -- Mochila Gaming
(57, 'Accesorios', 28),           -- Alfombrilla Cyberpunk
(58, 'Accesorios', 18),           -- Auriculares Gaming
(59, 'Decoración', 45),           -- Lámpara Pac-Man
(60, 'Accesorios', 55),           -- Set Pins
(61, 'Tarjetas Digitales', 100),  -- PSN 50€
(62, 'Tarjetas Digitales', 100),  -- Xbox 25€
(63, 'Tarjetas Digitales', 100),  -- eShop 35€
(64, 'Tarjetas Digitales', 100),  -- Steam 20€
(65, 'Accesorios', 50),           -- Cable HDMI
(66, 'Accesorios', 30),           -- Soporte Consolas
(67, 'Accesorios', 35),           -- Cargador Dual PS5
(68, 'Decoración', 80),           -- Pegatinas Gamer
(69, 'Libros', 25),               -- Artbook Zelda
(70, 'Libros', 30),               -- Guía Elden Ring
(71, 'Figuras', 40),              -- amiibo Link
(72, 'Figuras', 45),              -- amiibo Mario
(73, 'Accesorios', 20),           -- Pro Controller
(74, 'Accesorios', 60),           -- Kit Limpieza
(75, 'Figuras', 35),              -- Peluche Psyduck
(76, 'Figuras', 28),              -- Figura Psyduck
(77, 'Decoración', 40),           -- Taza Psyduck
(78, 'Accesorios', 50);           -- Llavero Psyduck

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
INSERT INTO carrito (usuario_id, producto_id, plataforma_id, cantidad) VALUES
(1, 1, 3, 1),   -- Juan: Zelda (Switch)
(1, 37, 0, 1),  -- Juan: PS5 Standard (consola: plataforma_id=0)
(2, 3, 1, 2),   -- María: 2x FIFA (PS5)
(2, 49, 0, 1),  -- María: Camiseta Zelda (merchandising: plataforma_id=0)
(3, 2, 1, 1),   -- Carlos: Elden Ring (PS5)
(3, 51, 0, 2),  -- Carlos: 2x Mando DualSense (merchandising)
(4, 39, 0, 1),  -- Ana: Switch OLED (consola)
(4, 5, 3, 1),   -- Ana: Mario Odyssey (Switch)
(5, 8, 1, 1),   -- Luis: Minecraft (PS5)
(5, 55, 0, 1),  -- Luis: Taza Minecraft (merchandising)
(6, 6, 1, 1),   -- Sara: Cyberpunk (PS5)
(6, 57, 0, 1);  -- Sara: Alfombrilla Cyberpunk (merchandising)

-- ============================================
-- INSERTS PARA WISHLIST
-- ============================================
INSERT INTO wishlist (usuario_id, producto_id) VALUES
(1, 2),   -- Juan quiere Elden Ring
(1, 38),  -- Juan quiere Xbox Series X
(1, 56),  -- Juan quiere Mochila Gaming
(2, 37),  -- María quiere PS5
(2, 4),   -- María quiere Call of Duty
(2, 58),  -- María quiere Auriculares Gaming
(3, 37),  -- Carlos quiere PS5
(3, 1),   -- Carlos quiere Zelda
(3, 39),  -- Carlos quiere Switch OLED
(4, 2),   -- Ana quiere Elden Ring
(4, 7),   -- Ana quiere Red Dead 2
(5, 37),  -- Luis quiere PS5
(5, 3),   -- Luis quiere FIFA
(5, 42),  -- Luis quiere Steam Deck
(6, 38),  -- Sara quiere Xbox Series X
(6, 10);  -- Sara quiere The Witcher 3

-- ============================================
-- INSERTS PARA PEDIDOS
-- ============================================
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
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(1, 37, NULL, 1, 549.99, 549.99),  -- PS5 Standard (consola)
(1, 1, 3, 1, 59.99, 59.99);       -- Zelda (Switch)

-- Pedido 2: 
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(2, 3, 1, 2, 49.99, 99.98);       -- 2x FIFA (PS5)

-- Pedido 3: 
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(3, 2, 1, 1, 69.99, 69.99),       -- Elden Ring (PS5)
(3, 51, NULL, 2, 19.99, 39.98);   -- 2x Mando DualSense (merchandising)

-- Pedido 4: 
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(4, 39, NULL, 1, 349.99, 349.99), -- Switch OLED (consola)
(4, 5, 3, 1, 59.99, 59.99);       -- Mario Odyssey (Switch)

-- Pedido 5: 
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(5, 49, NULL, 1, 24.99, 24.99);   -- Camiseta Zelda (merchandising)

-- Pedido 6: 
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(6, 8, 1, 1, 29.99, 29.99),       -- Minecraft (PS5)
(6, 55, NULL, 1, 12.99, 12.99),   -- Taza Minecraft (merchandising)
(6, 52, NULL, 1, 9.99, 9.99);     -- Poster Elden Ring (merchandising)

-- Pedido 7: 
INSERT INTO pedidos_productos (pedido_id, producto_id, plataforma_id, cantidad, precio_unitario, subtotal) VALUES
(7, 40, NULL, 1, 449.99, 449.99), -- PS5 Digital (consola)
(7, 6, 1, 1, 39.99, 39.99);       -- Cyberpunk 2077 (PS5)