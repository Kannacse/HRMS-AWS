const express = require('express');
const router = express.Router();
const verifyToken = require('../auth');
const { userDashboarddata } = require('../services/dashboard/dashboarddata');
const { logUserActivity } = require('../utils/userActivityLogger');

router.post('/getempdata', verifyToken, async (req, res) => {
  console.log("BODY FROM FLUTTER:", req.body);
  console.log("HEADERS FROM FLUTTER:", req.headers);

  const user_id = req.body.userId;
  const year = new Date().getFullYear();
  // const year = 2023;
  try {
    const user_data = await userDashboarddata(user_id, year);

    console.log(user_data);

    if (user_data && user_data.success) {
      res.status(200).json({ user_data: user_data });
    } else {
      res.status(401).json({ error: "Unauthorized User" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
});


router.post('/logoutlog', verifyToken, async (req, res) => {
  const userId = req.body.userId;

  try {
    await logUserActivity(
      `${new Date().toLocaleString()} | User ID: ${userId} | Logged Out`
    );

    return res.status(200).json({
      success: true,
      message: 'Logout logged successfully',
    });
  } catch (error) {
    console.error("Error logging user activity:", error);

    return res.status(500).json({
      success: false,
      message: 'Failed to log logout activity',
    });
  }
});

module.exports = router;