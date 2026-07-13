// routes/login.js
const express = require('express');
const router = express.Router();
const { userLogin, generateToken, generateRefreshToken } = require('../services/auth/employeelogin');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');

router.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!username || !password) return res.status(400).json({ error: 'Username and password required' });

    const hash_password = crypto.createHash('md5').update(password).digest('hex');

    const ipAddress =
      req.headers['x-forwarded-for']?.split(',')[0] ||
      req.socket.remoteAddress;


    const result = await userLogin(username, hash_password, ipAddress);

    if (!result.success) {
      if (result.reason === 'INACTIVE') {
        return res.status(403).json({
          message: 'Login failed. Employee has been inactivated from the organization'
        });
      }

      return res.status(401).json({
        message: 'Invalid username or password'
      });
    }


    const user = result.user[0];
    const payload = { id: user.id, username: user.userfullname };

    const accessToken = await generateToken(payload);
    const refreshToken = await generateRefreshToken(payload);

    const fullUser = {
      id: user.id,
      emprole: user.emprole,
      userstatus: user.userstatus,
      firstname: user.firstname,
      lastname: user.lastname,
      userfullname: user.userfullname,
      emailaddress: user.emailaddress,
      contactnumber: user.contactnumber,
      employeeId: user.employeeId,
      policy_status: user.policy_status,
      jobtitle_id: user.jobtitle_id,
      themes: user.themes,
      isactive: user.isactive,
    };

    res.status(200).json({
      accessToken,
      refreshToken,
      user: fullUser,
    });

  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});


router.post('/refresh', async (req, res) => {
  const { refreshToken } = req.body;
  if (!refreshToken) return res.status(401).json({ message: 'No refresh token' });

  try {
    const payload = jwt.verify(refreshToken, process.env.REFRESH_SECRET_KEY);

    const cleanUser = { id: payload.id, username: payload.username };

    const newAccessToken = await generateToken(cleanUser);
    res.status(200).json({ accessToken: newAccessToken });
  } catch (err) {
    res.status(403).json({ message: 'Invalid refresh token' });
  }
});


module.exports = router;