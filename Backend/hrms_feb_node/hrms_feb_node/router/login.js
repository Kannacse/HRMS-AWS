const express = require('express');
const router = express.Router();

const verifyToken = require('../auth');
const { userDashboarddata } = require('../services/dashboard/dashboarddata');
const { userLogin, generateToken, generateRefreshToken } = require('../services/auth/employeelogin');

// ===================================
// Login
// ===================================
router.post("/login", async (req, res) => {
    try {
        const { username, password } = req.body;
        if (!username || !password) {
            return res.status(400).json({ success: false, message: "Username and password are required" });
        }
        const ipAddress = req.headers["x-forwarded-for"]?.split(",")[0]?.trim() || req.socket.remoteAddress || "";
        const result = await userLogin(username, password, ipAddress);
        if (!result.success) {
            if (result.reason === "INACTIVE") return res.status(403).json({ success: false, message: "User account is inactive" });
            return res.status(401).json({ success: false, message: "Invalid username or password" });
        }
        const user = result.user[0];
        const accessToken = await generateToken(user);
        const refreshToken = await generateRefreshToken({ id: user.id, username: user.name });
        return res.status(200).json({ success: true, user: { id: user.id, userfullname: user.userfullname, emailaddress: user.emailaddress, emprole: user.emprole }, accessToken: accessToken, refreshToken: refreshToken });
    } catch (error) {
        console.error("Login error:", error);
        return res.status(500).json({ success: false, message: "Internal Server Error" });
    }
});

// Dashboard Data
// ===================================
router.post('/getempdata', verifyToken, async (req, res) => {

    console.log("\n======================================");
    console.log("GET EMP DATA API CALLED");
    console.log("======================================");

    // Request Headers
    console.log("\nRequest Headers:");
    console.log(req.headers);

    // Authorization Header
    console.log("\nAuthorization Header:");
    console.log(req.headers.authorization);

    // Request Body
    console.log("\nRequest Body:");
    console.log(req.body);

    // JWT Payload
    console.log("\nDecoded Token:");
    console.log(JSON.stringify(req.user, null, 2));

    // User IDs
    const bodyUserId = req.body.userId;
    const tokenUserId = req.user?.id;
    const year = new Date().getFullYear();

    console.log("\nUser ID from Request Body :", bodyUserId);
    console.log("User ID from JWT Token    :", tokenUserId);

    try {

        // Using request body for now (same as original code)
        const user_data = await userDashboarddata(bodyUserId, year);

        console.log("\nDashboard Service Response:");
        console.log(JSON.stringify(user_data, null, 2));

        if (user_data && user_data.success) {

            console.log("\nDashboard API SUCCESS");

            return res.status(200).json({
                user_data: user_data
            });
        }

        console.log("\nDashboard API FAILED");
        console.log("Returned Object:");
        console.log(user_data);

        return res.status(401).json({
            error: "Unauthorized User",
            details: user_data
        });

    } catch (err) {

        console.log("\nDashboard API EXCEPTION");
        console.error(err);

        return res.status(500).json({
            error: "Internal Server Error",
            message: err.message,
            stack: err.stack
        });
    }

});

module.exports = router;
