const path = require("path");

const bienvenidaTemplate = ({ nombre, apellido1, email }) => {
    const html = `
    <!DOCTYPE html>
    <html lang="es">
    <head>
      <meta charset="UTF-8">
    </head>
    <body style="margin:0; padding:0; font-family: Segoe UI, sans-serif; background-color:#f4f4f4;">
        
        <div style="max-width:600px; margin:0 auto; background:#ffffff;">
            
            <!-- Cabecera del mail -->
            <div style="background:#4C71FF; padding:30px; text-align:center;">
                <img src="cid:logo" alt="NebriGame" style="max-width:180px;">
            </div>

            <!-- Cuerpo del mail -->
            <div style="padding:40px 30px; color:#333;">
                <h1 style="color:#1a1a2e; margin-top:0;">¡Bienvenido, ${nombre}!</h1>
                
                <p style="font-size:16px; line-height:1.6;">
                    Hola <strong>${nombre} ${apellido1}</strong>, estamos encantados de darte la bienvenida a <strong>NebriGame</strong>, 
                    esperamos que disfrutes de esta experiencia y te unas a nuestra comunidad de jugadores apasionados.
                </p>

                <p style="font-size:16px; line-height:1.6;">
                    Tu cuenta con el email <strong>${email}</strong> ya está activa
                    y lista para usar.
                </p>

                <!-- Botón para  ir a inicio de sesión -->
                <div style="text-align:center; margin:30px 0;">
                    <a href="${process.env.FRONTEND_URL}/login" 
                       style="background:#5B60B9; color:#fff; padding:14px 30px; 
                              text-decoration:none; border-radius:5px; font-weight:bold;
                              display:inline-block;">
                        Empezar a soñar
                    </a>
                </div>
            </div>

            <!-- Footer del mail -->
            <div style="background:#4C71FF; color:#aaa; padding:20px; 
                        text-align:center; font-size:12px;">
                <p style="margin:0; color:#fff;">© 2026 NebriGame. Todos los derechos reservados.</p>
            </div>
        </div>
    </body>
    </html>
    `;

    const attachments = [
        {
            filename: "logo.png",
            path: path.join(__dirname, "../assets/imagenes/emails/logo.png"),
            cid: "logo"
        }
    ];

    return { html, attachments };
};

module.exports = { bienvenidaTemplate };