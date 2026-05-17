const path = require("path");

const eliminacionTemplate = ({ nombre, email }) => {
    const html = `
    <!DOCTYPE html>
    <html lang="es">
    <head><meta charset="UTF-8"></head>
    <body style="margin:0; padding:0; font-family: Segoe UI, sans-serif; background-color:#f4f4f4;">
        <div style="max-width:600px; margin:0 auto; background:#ffffff;">
            
            <!-- Cabecera del mail -->
            <div style="background:#1a1a2e; padding:30px; text-align:center;">
                <img src="cid:logo" alt="NebriGame" style="max-width:180px;">
            </div>

            <!-- Cuerpo del mail -->
            <div style="padding:40px 30px; color:#333;">
                <h1 style="color:#1a1a2e; margin-top:0;">Hasta pronto, ${nombre}</h1>
                
                <p style="font-size:16px; line-height:1.6;">
                    Te confirmamos que tu cuenta asociada al email
                    <strong>${email}</strong> ha sido <strong>eliminada correctamente</strong>
                    de NebriGame.
                </p>

                <p style="font-size:16px; line-height:1.6;">
                    Todos tus datos personales, métodos de pago y direcciones
                    han sido borrados de nuestros servidores.
                </p>

                <div style="background:#f4f4f4; border-left:4px solid #e94560; 
                            padding:15px 20px; margin:25px 0;">
                    <p style="margin:0; font-size:14px; color:#555;">
                        <strong>¿No fuiste tú?</strong><br>
                        Si esto ha sido un error o no solicitaste la eliminación,
                        contacta con nosotros lo antes posible.
                    </p>
                </div>

                <p style="font-size:16px; line-height:1.6;">
                    Sentimos verte marchar. Si en algún momento quieres volver,
                    estaremos encantados de recibirte de nuevo.
                </p>

                <div style="text-align:center; margin:30px 0;">
                    <a href="${process.env.FRONTEND_URL}/registro" 
                       style="background:#5B60B9; color:#fff; padding:14px 30px; 
                              text-decoration:none; border-radius:5px; font-weight:bold;
                              display:inline-block;">
                        Crear cuenta nueva
                    </a>
                </div>
            </div>

            <!-- Footer del mail -->
            <div style="background:#1a1a2e; color:#aaa; padding:20px; 
                        text-align:center; font-size:12px;">
                <p style="margin:0;">© 2026 NebriGame. Todos los derechos reservados.</p>
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

module.exports = { eliminacionTemplate };