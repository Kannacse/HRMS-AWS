const fs = require('fs');
const path = require('path');

const logDir = path.resolve(__dirname, '../logs');
const logFile = path.join(logDir, 'useractivities.log');

if (!fs.existsSync(logDir)) {
  fs.mkdirSync(logDir, { recursive: true });
}

function logUserActivity(logMessage) {
  fs.appendFile(
    logFile,
    logMessage + '\n\n',
    { encoding: 'utf8' },
    err => {
      if (err) {
        console.error('❌ User activity log write failed:', err);
      }
    }
  );
  console.log('Logging user activity to:', logFile);
}
module.exports = { logUserActivity };
