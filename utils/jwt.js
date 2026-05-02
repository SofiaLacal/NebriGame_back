const jwt = require("jsonwebtoken");

function accessSecret() {
    const s = process.env.JWT_SECRET;
    if (!s) throw new Error("JWT_SECRET no configurado");
    return s;
}

function signAccess(userId) {
    return jwt.sign(
        { sub: String(userId) },
        accessSecret(),
        { expiresIn: process.env.JWT_ACCESS_EXPIRES || "15m" }
    );
}

function verifyAccessToken(token) {
    return jwt.verify(token, accessSecret());
}

module.exports = {
    signAccess,
    verifyAccessToken,
};
