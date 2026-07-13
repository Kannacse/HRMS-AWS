const express = require('express');
const router = express.Router();
const verifyToken = require('../auth');
const { getLeaves, updateLeaveStatus } = require('../services/employee_leaves/employee_leaves');

router.post('/employeeleaves', verifyToken, async (req, res) => {
    console.log("BODY FROM FLUTTER:", req.body);
    console.log("HEADERS FROM FLUTTER:", req.headers);
    // router.post('/employeeleaves', async (req, res) => {
    try {
        const { userId, emprole, month, year } = req.body;
        if (!userId) {
            return res.status(400).json({ error: 'UserId missing' });
        }

        const leaves = await getLeaves(userId, emprole, month, year);
        res.status(200).json({ leaves: leaves });
    } catch (error) {
        console.error("Error in employeeleaves:", error);
        res.status(500).json({ error: "Internal server error" });
    }
})

router.post('/employeeleaves/updatestatus', verifyToken, async (req, res) => {
    try {
        const result = await updateLeaveStatus(req);
        res.status(200).json(result);
    } catch (error) {
        console.error("Error in updatestatus:", error.message);
        res.status(400).json({ error: error.message });
    }
});

module.exports = router;