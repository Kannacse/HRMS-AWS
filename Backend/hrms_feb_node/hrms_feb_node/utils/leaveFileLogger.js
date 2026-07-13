const fs = require('fs');
const path = require('path');

const logFile = path.resolve(process.cwd(), 'logs', 'leavedetails.log');

fs.mkdirSync(path.dirname(logFile), { recursive: true });

function logLeave(message) {
  fs.appendFile(logFile, message + '\n\n', err => {
    if (err) {
      console.error('Leave log failed:', err.message);
    }
  });
}

function getLocalDateTime() {
  return new Date().toLocaleString();
}

module.exports = { logLeave, getLocalDateTime };
