require('dotenv').config();

const express = require("express");
const http = require("http");
const helmet = require("helmet");
const rateLimit = require("express-rate-limit");
const cors = require("cors");   // <-- NEW

// Import routes
const login = require('./router/login');
const dashboard = require('./router/dashboard');
const leaves = require('./router/leaves');
const attendance = require('./router/attendance');
const employeeLeaves = require('./router/employee_leaves');
const activityLog = require('./router/activitylog');

const app = express();

// ============================
// CORS Middleware (NEW)
// ============================
app.use(
  cors({
    origin: [
      "http://localhost:8081",
      "http://127.0.0.1:8081",
    ],
    credentials: true,
    methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);

// ============================
// Security Middleware
// ============================
app.use(helmet());
app.use(express.json());

// Trust only the first reverse proxy
app.set("trust proxy", 1);

// ============================
// Rate Limiting
// ============================

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 1000,
});

const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 20,
});

app.use("/api/", limiter);

// ============================
// API Routes
// ============================

// Login route
app.use('/api/hrms/', loginLimiter, login);

// Other routes
app.use('/api/hrms/', dashboard);
app.use('/api/hrms/', leaves);
app.use('/api/hrms/', attendance);
app.use('/api/hrms/', employeeLeaves);
app.use('/api/hrms/activity', activityLog);

// ============================
// Health Check
// ============================

app.get("/health", (req, res) => {
  res.status(200).json({
    status: "UP",
    service: "HRMS Backend",
    environment: process.env.NODE_ENV,
    timestamp: new Date().toISOString()
  });
});

// ============================
// Server Setup
// ============================

const PORT = process.env.PORT || 3000;

const server = http.createServer(app);

server.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 Server running on http://0.0.0.0:${PORT}`);
});
