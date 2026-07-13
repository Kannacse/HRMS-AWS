const express = require('express');
const router = express.Router();
const verifyToken = require('../auth');
const { getempAttendanceData } = require('../services/attendance/attendancedata');


router.post('/attendancedata', verifyToken, async (req, res) => {
  const { userId, month, year } = req.body;

  try {
    const attendanceData = await getempAttendanceData(userId, month, year);

    if (attendanceData.success) {
      res.status(200).json(attendanceData);
    } else {
      res.status(401).json({ error: "Unauthorized User" });
    }
  } catch (err) {
    res.status(500).json({ error: "Internal server error" });
  }

});
module.exports = router;