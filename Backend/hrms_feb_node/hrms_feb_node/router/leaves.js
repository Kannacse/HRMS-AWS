const express = require('express');
const router = express.Router();
const verifyToken = require('../auth');
const { getUserleaves, calculatedays, applyleave, getLeaveBalance, getHolidayAndWeekend } = require('../services/leaves/leaves');
const { getLeaveTypes } = require('../repository/leaves/leaves');


router.post('/leavetypes', verifyToken, async (req, res) => {
  const userId = req.body.userId;
  const year = new Date().getFullYear();

  const leaveTypes = await getUserleaves(userId, year);

  res.status(200).json({ leaveTypes: leaveTypes });
})


router.post('/applyleave', verifyToken, async (req, res) => {
  try {
    // CHANGE: Destructure directly from req.body
    const { 
      userId, 
      fromDate, 
      toDate, 
      leavetypeId, 
      description, 
      leaveDay, 
      leavePeriod, 
      appliedLeavesdaycount, 
      compensatory_hrs, // Match the key sent from Flutter
      compOffDate, 
      late_early,      // Match the key sent from Flutter
      dayName,
      sandwichLeave
    } = req.body; 

    // Log to verify data is arriving correctly
    console.log("Received Data:", req.body);

    const applyLeave = await applyleave(
      userId,
      description,
      fromDate,
      toDate,
      leavetypeId,
      leaveDay,
      leavePeriod,
      appliedLeavesdaycount,
      compensatory_hrs,
      compOffDate,
      late_early,
      null,
      dayName,
      sandwichLeave
    );

    if (applyLeave.success === true) {
      res.status(200).json(applyLeave);
    } else {
      res.status(400).json(applyLeave);
    }

  } catch (error) {
    console.error("Apply Leave Error:", error); // Log the actual error for debugging
    res.status(500).json({ error: error.message });
  }
});

router.post('/validatedate', verifyToken, async (req, res) => {
  try {
    const { userId, fromDate, toDate, leaveTypeId, daySelected } = req.body;

    const calculateDays = await calculatedays(userId, fromDate, toDate, leaveTypeId, daySelected);

    console.log(calculateDays);

    if (calculateDays.success) {
      res.status(200).json(calculateDays);
    } else {
      res.status(401).json({ error: "Unauthorized User" });
    }

  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }

})

router.post('/getleavebalance', verifyToken, async (req, res) => {
  const { leaveTypeId, userId } = req.body;
  const year = new Date().getFullYear();

  try {
    const leaveBalance = await getLeaveBalance(leaveTypeId, userId, year);

    console.log(leaveBalance);

    if (leaveBalance.success) {
      res.status(200).json(leaveBalance);
    } else {
      res.status(401).json({ error: "Unauthorized User" });
    }
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }

})

router.post('/holidayweekend', verifyToken, async (req, res) => {
  try {
    const { userId } = req.body;

    const data = await getHolidayAndWeekend(userId);

    if (data.success) {
      res.status(200).json(data);
    } else {
      res.status(400).json(data);
    }
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});



module.exports = router;