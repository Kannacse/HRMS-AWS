const express = require('express');
const router = express.Router();

const verifyToken = require('../auth');

const { userDashboarddata } = require('../services/dashboard/dashboarddata');

// ===================================
// Dashboard Data
// ===================================
router.post('/getempdata', verifyToken, async (req, res) => {

    console.log("======================================");
    console.log("GET EMP DATA API CALLED");
    console.log("Request Body:");
    console.log(req.body);

    console.log("Decoded Token:");
    console.log(req.user);

    const user_id = req.body.userId;
    const year = new Date().getFullYear();

    try {

        const user_data = await userDashboarddata(user_id, year);

        console.log("Dashboard Service Response:");
        console.log(JSON.stringify(user_data, null, 2));

        if (user_data && user_data.success) {

            console.log("Sending 200 Response");

            return res.status(200).json({
                user_data: user_data
            });
        }

        console.log("Unauthorized User");

        return res.status(401).json({
            error: "Unauthorized User"
        });

    } catch (err) {

        console.error("Dashboard API Error");
        console.error(err);

        return res.status(500).json({
            error: "Internal Server Error"
        });
    }
});

module.exports = router;
