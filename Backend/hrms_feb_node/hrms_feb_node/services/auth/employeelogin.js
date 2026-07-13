const express = require('express')
const { userdata } = require('../../repository/users/main_users');
const jwt = require('jsonwebtoken');
const { logUserActivity } = require('../../utils/userActivityLogger');

async function generateToken(user) {
  // You can include any user information you want in the token payload
  const payload = {
    id: user.id,
    username: user.name
  };

  const secretKey = process.env.SECRET_KEY;

  // Generate the token with an expiration time
  const token = jwt.sign(payload, secretKey, { expiresIn: '5m' });
  return token;
}

async function generateRefreshToken(payload) {
  const refreshSecretKey = process.env.REFRESH_SECRET_KEY;

  return jwt.sign(payload, refreshSecretKey, { expiresIn: '7d' });
};

async function userLogin(username, password, ipAddress) {
  try {
    const result = await userdata(username, password, ipAddress);

    if (!result.success) {
      return result; // INACTIVE or INVALID
    }

    await logUserActivity(
      `${new Date().toLocaleString()} | User ID: ${result.user[0].dataValues.id} | Logged in | IP Address: ${ipAddress}`
    );

    return {
      success: true,
      user: result.user
    };

  } catch (error) {
    return {
      success: false,
      reason: 'ERROR',
      error: error.message
    };
  }
}


module.exports = { userLogin, generateToken, generateRefreshToken }