const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');

router.post('/login', async (req, res) => {
  try {

    // Temporary authentication bypass
    const user = {
      id: 3,
      emprole: 1,
      userstatus: "old",
      firstname: "Anand",
      lastname: "T",
      userfullname: "Anand T",
      emailaddress: "",
      contactnumber: "",
      employeeId: "CBT720540",
      policy_status: "policy_acknowledged",
      jobtitle_id: 1,
      themes: "default",
      isactive: 1
    };

    // Generate JWT Access Token
    const accessToken = jwt.sign(
      {
        id: user.id,
        employeeId: user.employeeId,
        emprole: user.emprole
      },
      process.env.SECRET_KEY,
      {
        algorithm: "HS256",
        expiresIn: "1h"
      }
    );

    // Generate JWT Refresh Token
    const refreshToken = jwt.sign(
      {
        id: user.id
      },
      process.env.SECRET_KEY,
      {
        algorithm: "HS256",
        expiresIn: "7d"
      }
    );

    return res.status(200).json({
      accessToken,
      refreshToken,
      user
    });

  } catch (error) {
    console.error("Login error:", error);

    return res.status(500).json({
      error: "Internal server error"
    });
  }
});

router.post('/refresh', async (req, res) => {

  const { refreshToken } = req.body;

  if (!refreshToken) {
    return res.status(401).json({
      message: "No refresh token"
    });
  }

  try {
    const decoded = jwt.verify(refreshToken, process.env.SECRET_KEY);

    const accessToken = jwt.sign(
      {
        id: decoded.id,
        employeeId: "CBT720540",
        emprole: 1
      },
      process.env.SECRET_KEY,
      {
        algorithm: "HS256",
        expiresIn: "1h"
      }
    );

    return res.status(200).json({
      accessToken
    });

  } catch (err) {
    return res.status(403).json({
      message: "Invalid refresh token"
    });
  }
});

module.exports = router;
