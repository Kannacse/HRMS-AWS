const request = require("supertest");
const express = require("express");

// Mock authentication middleware
jest.mock("../auth", () => (req, res, next) => {
    req.user = { id: 1 };
    next();
});

// Mock database
jest.mock("../models", () => ({
    main_users: {
        findOne: jest.fn()
    },
    main_employees_summary: {
        findAll: jest.fn()
    }
}));

// Mock employee service
jest.mock("../services/employees/employees", () => ({
    getEmployees: jest.fn()
}));

const employeesRouter = require("../router/employees");

const db = require("../models");
const { getEmployees } = require("../services/employees/employees");

const app = express();

app.use(express.json());
app.use("/api/hrms", employeesRouter);


describe("GET /api/hrms/employees", () => {

    beforeEach(() => {
        jest.clearAllMocks();
    });


    test("should return employees for Super Admin", async () => {

        db.main_users.findOne.mockResolvedValue({
            id: 1,
            emprole: 1,
            isactive: 1
        });

        getEmployees.mockResolvedValue({
            success: true,
            employees: [
                {
                    user_id: 1,
                    employeeId: "EMP001",
                    userfullname: "Test Employee",
                    emailaddress: "test@example.com"
                }
            ]
        });

        const response = await request(app)
            .get("/api/hrms/employees")
            .set("Authorization", "Bearer test-token");

        expect(response.statusCode).toBe(200);

        expect(response.body.success).toBe(true);

        expect(response.body.employees).toHaveLength(1);

        expect(response.body.employees[0].employeeId).toBe("EMP001");
    });


    test("should return 401 when user is not found", async () => {

        db.main_users.findOne.mockResolvedValue(null);

        const response = await request(app)
            .get("/api/hrms/employees")
            .set("Authorization", "Bearer test-token");

        expect(response.statusCode).toBe(401);

        expect(response.body.success).toBe(false);

        expect(response.body.message).toBe("User not found");
    });


    test("should return 403 when user account is inactive", async () => {

        db.main_users.findOne.mockResolvedValue({
            id: 1,
            emprole: 1,
            isactive: 0
        });

        const response = await request(app)
            .get("/api/hrms/employees")
            .set("Authorization", "Bearer test-token");

        expect(response.statusCode).toBe(403);

        expect(response.body.success).toBe(false);

        expect(response.body.message).toBe("User account is inactive");
    });


    test("should return 403 when user is not Super Admin", async () => {

        db.main_users.findOne.mockResolvedValue({
            id: 1,
            emprole: 2,
            isactive: 1
        });

        const response = await request(app)
            .get("/api/hrms/employees")
            .set("Authorization", "Bearer test-token");

        expect(response.statusCode).toBe(403);

        expect(response.body.success).toBe(false);

        expect(response.body.message).toBe(
            "Access denied. Super Admin access required."
        );
    });


    test("should return 500 when employee service fails", async () => {

        db.main_users.findOne.mockResolvedValue({
            id: 1,
            emprole: 1,
            isactive: 1
        });

        getEmployees.mockResolvedValue({
            success: false,
            error: "Database Error"
        });

        const response = await request(app)
            .get("/api/hrms/employees")
            .set("Authorization", "Bearer test-token");

        expect(response.statusCode).toBe(500);

        expect(response.body.success).toBe(false);

        expect(response.body.message).toBe("Database Error");
    });


    test("should return 500 when database lookup throws an error", async () => {

        db.main_users.findOne.mockRejectedValue(
            new Error("Database connection failed")
        );

        const response = await request(app)
            .get("/api/hrms/employees")
            .set("Authorization", "Bearer test-token");

        expect(response.statusCode).toBe(500);

        expect(response.body.success).toBe(false);

        expect(response.body.message).toBe("Internal Server Error");
    });

});
