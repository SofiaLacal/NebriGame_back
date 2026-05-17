const path = require("path");

const recuperarPasswordTemplate = ({ nombre, resetLink }) => {
    const html = `
    <!DOCTYPE html>
    <html lang="es">
    <head><meta charset="UTF-8"></head>
    <body style="margin:0; padding:0; font-family: Segoe UI, sans-serif; background-color:#f4f4f4;">
        <div style="max-width:600px; margin:0 auto; background:#ffffff;">
            
            <!-- Cabecera del mail -->
            <div style="background:#4C71FF; padding:30px; text-align:center;">
                <img src="cid:logo" alt="NebriGame" style="max-width:180px;">
            </div>

            <!-- Cuerpo del mail -->
            <div style="padding:40px 30px; color:#333;">
                <h1 style="color:#1a1a2e; margin-top:0;">Recupera tu contraseña</h1>
                
                <p style="font-size:16px; line-height:1.6;">
                    Hola <strong>${nombre}</strong>, hemos recibido una solicitud
                    para restablecer la contraseña de tu cuenta.
                </p>

                <p style="font-size:16px; line-height:1.6;">
                    Pulsa el botón de abajo para crear una contraseña nueva.
                    Este enlace caducará en <strong>1 hora</strong> por seguridad.
                </p>

                <div style="text-align:center; margin:30px 0;">
                    <a href="${resetLink}" 
                       style="background:#5B60B9; color:#fff; padding:14px 30px; 
                              text-decoration:none; border-radius:5px; font-weight:bold;
                              display:inline-block;">
                        Restablecer contraseña
                    </a>
                </div>

                <div style="background:#f4f4f4; border-left:4px solid #e94560; 
                            padding:15px 20px; margin:25px 0;">
                    <p style="margin:0; font-size:14px; color:#555;">
                        <strong>¿No has sido tú?</strong><br>
                        Si no has solicitado este cambio, ignora este correo.
                        Tu contraseña no se modificará y nadie podrá acceder a tu cuenta.
                    </p>
                </div>
            </div>

            <!-- Footer del mail -->
            <div style="background:#4C71FF; color:#aaa; padding:20px; 
                        text-align:center; font-size:12px;">
                <p style="margin:0; color:#fff;">© 2026 NebriGame. Todos los derechos reservados.</p>
            </div>
        </div>
    </body>
    </html>`;

    const attachments = [
        {
            filename: "logo.png",
            path: path.join(__dirname, "../assets/imagenes/emails/logo.png"),
            cid: "logo"
        }
    ];

    return { html, attachments };
};

module.exports = { recuperarPasswordTemplate };