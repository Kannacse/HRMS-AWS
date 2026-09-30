const express = require('express');
const router = express.Router();

const verifyToken = require('../auth');
const db = require('../models');

const { getEmployees } = require('../services/employees/employees');

const MainUsers = db.main_users;

// ===================================
// Get Employees - Super Admin Only
// ===================================
router.get('/employees', verifyToken, async (req, res) => {

    console.log("======================================");
    console.log("GET EMPLOYEES API CALLED");
    console.log("Decoded Token:");
    console.log(req.user);

    try {

        // Get authenticated user's ID from JWT
        const userId = req.user.id;

        // Get the user's current role from the database
        const currentUser = await MainUsers.findOne({
            attributes: ['id', 'emprole', 'isactive'],
            where: {
                id: userId
            },
            raw: true
        });

        if (!currentUser) {
            return res.status(401).json({
                success: false,
                message: 'User not found'
            });
        }

        // Check whether the authenticated account is active
        if (currentUser.isactive !== 1) {
            return res.status(403).json({
                success: false,
                message: 'User account is inactive'
            });
        }

        // Super Admin role = 1
        if (currentUser.emprole !== 1) {
            return res.status(403).json({
                success: false,
                message: 'Access denied. Super Admin access required.'
            });
        }

        const result = await getEmployees();

        if (!result.success) {
            return res.status(500).json({
                success: false,
                message: result.error
            });
        }

        return res.status(200).json({
            success: true,
            employees: result.employees
        });

    } catch (error) {

        console.error("Get Employees API Error:");
        console.error(error);

        return res.status(500).json({
            success: false,
            message: 'Internal Server Error'
        });
    }
});

module.exports = router;
