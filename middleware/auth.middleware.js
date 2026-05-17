const { verifyAccessToken } = require("../utils/jwt");
const { Usuario } = require("../models");

function authenticateAccessToken(req, res, next) {
    const authHeader = req.headers.authorization;
    const token =
        authHeader && authHeader.startsWith("Bearer ")
            ? authHeader.slice(7).trim()
            : null;

    if (!token) {
        return res.status(401).json({ success: false, error: "Token requerido" });
    }

    try {
        const decoded = verifyAccessToken(token);
        req.authUserId = parseInt(decoded.sub, 10);
        if (Number.isNaN(req.authUserId)) {
            return res.status(401).json({ success: false, error: "Token inválido" });
        }
        next();
    } catch {
        return res
            .status(401)
            .json({ success: false, error: "Token inválido o caducado" });
    }
}

function requireSameUser(req, res, next) {
    const paramId = parseInt(req.params.userId, 10);
    if (Number.isNaN(paramId) || paramId !== req.authUserId) {
        return res.status(403).json({ success: false, error: "No autorizado" });
    }
    next();
}

async function requireAdmin(req, res, next) {
    try {
        const usuario = await Usuario.findByPk(req.authUserId, {
            attributes: ["id", "admin"],
        });
        if (!usuario || !usuario.admin) {
            return res.status(403).json({ success: false, error: "No autorizado" });
        }
        next();
    } catch (error) {
        res.status(500).json({
            success: false,
            message: "Error al verificar permisos de administrador",
            error: error.message,
        });
    }
}

module.exports = { authenticateAccessToken, requireSameUser, requireAdmin };
