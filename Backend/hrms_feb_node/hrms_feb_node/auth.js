const jwt = require('jsonwebtoken');

function verifyToken(req, res, next) {
  // Read token from Authorization header
  const authHeader = req.headers["authorization"];
  if (!authHeader) {
    return res.status(401).json({ message: "Authorization header missing" });
  }

  // Format: "Bearer <token>"
  const parts = authHeader.split(" ");
  if (parts.length !== 2 || parts[0] !== "Bearer") {
    return res.status(401).json({ message: "Invalid authorization format" });
  }

  const token = parts[1];

  jwt.verify(
    token,
    process.env.SECRET_KEY,
    { algorithms: ["HS256"] },
    (err, decoded) => {
      if (err) {
        return res.status(401).json({ message: "Invalid or expired token" });
      }

      req.user = decoded;
      next();
    }
  );
}


module.exports = verifyToken;