const nodemailer = require("nodemailer");

const port = Number(process.env.EMAIL_PORT) || 587;
const secure = port === 465;

const useIpv4Only = /^true$/i.test(String(process.env.EMAIL_USE_IPV4 || ""));

const transporter = nodemailer.createTransport({
    pool: true,
    host: process.env.EMAIL_HOST,
    port,
    secure,
    ...(useIpv4Only && { family: 4 }),
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASSWORD,
    },
});

const sendEmail = async (to, subject, text, tryNumber = 0) => {
    if (tryNumber > 3) {
        console.error("Error al enviar el email: se han intentado 3 veces");
        throw new Error("Error al enviar el email: se han intentado 3 veces");
    }

    try {
        const from = process.env.EMAIL_FROM || process.env.EMAIL_USER;
        await transporter.sendMail({
            from,
            to,
            subject,
            text,
        });
        console.log("Correo electrónico enviado a", to);
    } catch (error) {
        console.error("Error al enviar el email:", error.message);
        return sendEmail(to, subject, text, tryNumber + 1);
    }
};

module.exports = { sendEmail };
