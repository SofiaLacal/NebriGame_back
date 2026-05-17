const path = require("path");

const confirmacionPedidoTemplate = ({ nombre, pedidoId, productos, total, direccion }) => {

    const productosHtml = productos.map(p => `
        <tr>
            <td style="padding:12px; border-bottom:1px solid #eee;">
                <strong>${p.nombre}</strong>
                ${p.plataforma ? `<br><small style="color:#666;">${p.plataforma}</small>` : ''}
            </td>
            <td style="padding:12px; border-bottom:1px solid #eee; text-align:center;">
                ${p.cantidad}
            </td>
            <td style="padding:12px; border-bottom:1px solid #eee; text-align:right;">
                ${(parseFloat(p.precio) * p.cantidad).toFixed(2)}€
            </td>
        </tr>
    `).join('');

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
                <h1 style="color:#1a1a2e; margin-top:0;">¡Gracias por tu compra, ${nombre}! </h1>
                
                <p style="font-size:16px; line-height:1.6;">
                    Hemos recibido tu pedido y lo estamos
                    preparando. Te avisaremos cuando salga rumbo a tu dirección.
                </p>

                <h2 style="color:#1a1a2e; font-size:18px; margin-top:30px;">
                    Resumen del pedido
                </h2>
                
                <table style="width:100%; border-collapse:collapse; margin-top:10px;">
                    <thead>
                        <tr style="background:#5B60B9; color:#fff;">
                            <th style="padding:12px; text-align:left;">Producto</th>
                            <th style="padding:12px; text-align:center;">Cantidad</th>
                            <th style="padding:12px; text-align:right;">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${productosHtml}
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" style="padding:15px; text-align:right; 
                                                    font-weight:bold;">TOTAL:</td>
                            <td style="padding:15px; text-align:right; font-weight:bold; 
                                       color:#e94560; font-size:18px;">
                                ${parseFloat(total).toFixed(2)}€
                            </td>
                        </tr>
                    </tfoot>
                </table>

                ${direccion ? `
                <h2 style="color:#1a1a2e; font-size:18px; margin-top:30px;">
                    Dirección de envío
                </h2>
                <div style="background:#f4f4f4; padding:15px; border-radius:5px;">
                    <p style="margin:0; font-size:14px; line-height:1.6;">
                        ${direccion.calle}, ${direccion.numeroCasa}<br>
                        ${direccion.codigoPostal} ${direccion.ciudad}<br>
                        ${direccion.region}
                    </p>
                </div>
                ` : ''}

                <div style="text-align:center; margin:30px 0;">
                    <a href="${process.env.FRONTEND_URL}/pedidos" 
                       style="background:#5B60B9; color:#fff; padding:14px 30px; 
                              text-decoration:none; border-radius:5px; font-weight:bold;
                              display:inline-block;">
                        Ver mis pedidos
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

module.exports = { confirmacionPedidoTemplate };