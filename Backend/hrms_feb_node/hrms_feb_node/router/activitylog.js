const express = require('express');
const router = express.Router();
const verifyToken = require('../auth');
const { logUserActivity } = require('../utils/userActivityLogger');
const path = require('path');
const fs = require('fs');

router.post('/log', verifyToken, (req, res) => {
  try {
    const { page, action, metadata } = req.body;

    if (!page || !action) {
      return res.status(400).json({ error: 'page and action are required' });
    }

    // user info from token (IMPORTANT)
    const userId = req.user.id;

    const timestamp = new Date().toLocaleString();

    const logMessage =
      `${timestamp} | User ID: ${userId} | ${action} ${page}` +
      (metadata ? ` | ${JSON.stringify(metadata)}` : '');

    logUserActivity(logMessage);

    res.status(200).json({ success: true });
  } catch (err) {
    console.error('Activity log failed:', err);

    // Never break app because of logging
    res.status(200).json({ success: true });
  }
});

router.get('/log/useractivities', verifyToken, (req, res) => {
  try {
    const logFilePath = path.join(
      __dirname,
      '../logs/useractivities.log'
    );

    if (!fs.existsSync(logFilePath)) {
      return res.status(404).json({ error: 'useractivities.log not found' });
    }

    res.setHeader('Content-Type', 'text/plain');
    res.setHeader(
      'Content-Disposition',
      'inline; filename="useractivities.log"'
    );

    res.sendFile(logFilePath);
  } catch (err) {
    console.error('Failed to read useractivities log:', err);
    res.status(500).json({ error: 'Unable to read log file' });
  }
});

// GET leave details log file
router.get('/log/leavedetails', verifyToken, (req, res) => {
  try {
    const logFilePath = path.join(
      __dirname,
      '../logs/leavedetails.log'
    );

    if (!fs.existsSync(logFilePath)) {
      return res.status(404).json({ error: 'leavedetails.log not found' });
    }

    res.setHeader('Content-Type', 'text/plain');
    res.setHeader(
      'Content-Disposition',
      'inline; filename="leavedetails.log"'
    );

    res.sendFile(logFilePath);
  } catch (err) {
    console.error('Failed to read leavedetails log:', err);
    res.status(500).json({ error: 'Unable to read log file' });
  }
});

module.exports = router;