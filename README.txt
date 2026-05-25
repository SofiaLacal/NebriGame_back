================================================================
  NEBRIGAME
  Tienda online de videojuegos
  Trabajo Fin de Grado
================================================================

1. STACK TECNOLÓGICO
----------------------------------------------------------------

  Backend
    - Node.js + Express
    - Sequelize (ORM) sobre MySQL
    - JWT (access token + refresh token) para autenticación
    - bcrypt para el hashing de contraseñas
    - Nodemailer para el envío de correos electrónicos
    - dotenv para la gestión de variables de entorno
    - CORS

  Frontend
    - Vue 3 con la Composition API
    - Vue Router para la navegación
    - Pinia para la gestión de estado
    - Vite como herramienta de build

  Gestor de paquetes
    - pnpm (en ambos proyectos)

2. REQUISITOS PREVIOS
----------------------------------------------------------------

Antes de instalar el proyecto se necesita tener instalado:

  - Node.js 18 o superior
  - pnpm  (instalación global: npm install -g pnpm)
  - MySQL 8 o superior  (o MariaDB equivalente)
  - Una cuenta de correo SMTP para el envío de emails
    (por ejemplo, una cuenta de Gmail con contraseña de aplicación)


3. INSTALACIÓN
----------------------------------------------------------------

  3.1 Clonar el repositorio

      git clone <url-del-repositorio>
      cd NebriGame

  3.2 Instalar dependencias del backend

      cd Back
      pnpm install

  3.3 Instalar dependencias del frontend

      cd ../Front
      pnpm install


4. CONFIGURACIÓN: VARIABLES DE ENTORNO
----------------------------------------------------------------

En cada uno de los dos proyectos hay un archivo .env.example que
sirve de plantilla. Hay que copiarlo a un archivo .env y
rellenarlo con valores reales.

  4.1 Backend  (Back/.env)

      # Base de datos
      DB_HOST=localhost
      DB_PORT=3306
      DB_NAME=nebrigame
      DB_USER=root
      DB_PASSWORD=tu_contraseña

      # Servidor
      PORT=3000
      NODE_ENV=development

      # JWT
      JWT_ACCESS_SECRET=cadena_larga_y_aleatoria
      JWT_REFRESH_SECRET=otra_cadena_larga_y_aleatoria
      JWT_ACCESS_EXPIRES=15m
      JWT_REFRESH_EXPIRES=7d

      # Correo (Nodemailer)
      MAIL_HOST=smtp.gmail.com
      MAIL_PORT=465
      MAIL_USER=tu_correo@gmail.com
      MAIL_PASS=tu_contraseña_de_aplicacion
      MAIL_FROM="NebriGame <tu_correo@gmail.com>"

      # Frontend
      FRONTEND_URL=http://localhost:5173

  4.2 Frontend  (Front/.env)

      VITE_API_URL=http://localhost:3000/api

  IMPORTANTE: el archivo .env no se sube nunca al repositorio.
  Solo se sube el .env.example, que no contiene credenciales.


5. BASE DE DATOS
----------------------------------------------------------------

  5.1 Crear la base de datos vacía en MySQL:

      CREATE DATABASE nebrigame
        CHARACTER SET utf8mb4
        COLLATE utf8mb4_unicode_ci;

  5.2 Al arrancar el backend por primera vez, Sequelize crea
      automáticamente todas las tablas a partir de los modelos.

  5.3 (Opcional) Cargar los datos de prueba que hay en la
      carpeta Back/data/ ejecutando el script de seed:

      pnpm run seed


6. EJECUCIÓN DEL PROYECTO
----------------------------------------------------------------

El backend y el frontend se arrancan por separado, cada uno en
su propia terminal.

  6.1 Arrancar el backend

      cd Back
      pnpm run dev        # modo desarrollo (con nodemon)
        - o bien -
      pnpm start          # modo producción

      Por defecto la API queda escuchando en:
      http://localhost:3000

  6.2 Arrancar el frontend

      cd Front
      pnpm run dev

      Por defecto el frontend queda accesible en:
      http://localhost:5173


7. NOTAS
----------------------------------------------------------------

  - El proyecto utiliza pnpm como gestor de paquetes en ambos
    repositorios. Los archivos pnpm-lock.yaml deben conservarse.

  - Las claves JWT (JWT_ACCESS_SECRET y JWT_REFRESH_SECRET) deben
    ser cadenas largas y aleatorias diferentes entre sí. No deben
    compartirse ni subirse al repositorio.

  - Para que Gmail funcione como servidor SMTP se necesita
    activar la verificación en dos pasos y generar una
    "contraseña de aplicación" desde la configuración de la
    cuenta de Google.

================================================================
