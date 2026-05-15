const jwt = require("jsonwebtoken");

function accessSecret() {
    const s = process.env.JWT_SECRET;
    if (!s) throw new Error("JWT_SECRET no configurado");
    return s;
}

function signAccess(userId) {
    return jwt.sign(
        { sub: String(userId), typ: "access" },
        accessSecret(),
        { expiresIn: process.env.JWT_ACCESS_EXPIRES || "15m" }
    );
}

function verifyAccessToken(token) {
    const decoded = jwt.verify(token, accessSecret());
    if (decoded.typ === "refresh") {
        const err = new Error("Token inválido");
        err.name = "JsonWebTokenError";
        throw err;
    }
    return decoded;
}

function refreshSecret() {
    const s = process.env.JWT_REFRESH_SECRET;
    if (s) return s;
    return accessSecret();
}

function signRefresh(userId) {
    return jwt.sign(
        { sub: String(userId), typ: "refresh" },
        refreshSecret(),
        { expiresIn: process.env.JWT_REFRESH_EXPIRES || "7d" }
    );
}

function verifyRefreshToken(token) {
    const decoded = jwt.verify(token, refreshSecret());
    if (decoded.typ !== "refresh") {
        const err = new Error("Token inválido");
        err.name = "JsonWebTokenError";
        throw err;
    }
    return decoded;
}

// ============================================
// PASSWORD RESET TOKENS
// ============================================

function signPasswordReset(userId) {
    return jwt.sign(
        { sub: String(userId), typ: "reset" },
        accessSecret(),
        { expiresIn: process.env.JWT_RESET_EXPIRES || "1h" }
    );
}

function verifyPasswordResetToken(token) {
    const decoded = jwt.verify(token, accessSecret());
    if (decoded.typ !== "reset") {
        const err = new Error("Token inválido");
        err.name = "JsonWebTokenError";
        throw err;
    }
    return decoded;
}

module.exports = {
    signAccess,
    signRefresh,
    signPasswordReset,
    verifyAccessToken,
    verifyRefreshToken,
    verifyPasswordResetToken,
};