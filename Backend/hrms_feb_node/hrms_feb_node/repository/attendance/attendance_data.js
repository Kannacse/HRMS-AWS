const db = require("../../models");
const { now } = require("moment");
const { raw } = require("mysql2");
const { Op, NOW } = require("sequelize");

const Attendance = db.attendance_log;


const getAttendanceData = async (userId, beginDate, endDate) => {
  const result = await Attendance.findAll({
    where: {
      user_id: userId,
      date: {
        [Op.between]: [beginDate, endDate]
      }
    },
    raw: true,
    logging: console.log
  });

  return result;
}

const totalAttendancedetails = async (userId, beginDate, endDate) => {

  const result = await db.sequelize.query(`
  SELECT 
    SUM(worked_hours) AS hours_worked,
    SUM(lateby) AS total_lateby,
    SUM(earlyby) AS total_earlyby,

    (SELECT COUNT(id) 
     FROM attendance_log 
     WHERE check_in > :lateTime
       AND user_id = :userId
       AND date BETWEEN :beginDate AND :endDate
       AND day NOT IN ('Sun', 'Sat')
       AND status != 'H'
       AND lateby != 0
    ) AS late_days,

    (SELECT COUNT(id) 
     FROM attendance_log 
     WHERE check_out < :earlyTime
       AND user_id = :userId
       AND date BETWEEN :beginDate AND :endDate
       AND day NOT IN ('Sun', 'Sat')
       AND status NOT IN ('H', 'A')
       AND date != :today
       AND earlyby != 0
    ) AS early_days,

    (SELECT 
        SUM(
          CASE 
            WHEN EXISTS (
              SELECT 1 FROM main_leaverequest le 
              WHERE le.user_id = al.user_id 
                AND al.date BETWEEN le.from_date AND le.to_date 
                AND le.leaveday = 2 
                AND le.leavestatus = 'Approved'
            )
            OR EXISTS (
              SELECT 1 FROM ts_entries tr 
              WHERE tr.user_id = al.user_id 
                AND al.date = tr.date 
                AND tr.worked_hrs = '4:00'
            )
            THEN 0.5 ELSE 1 
          END
        )
      FROM attendance_log al
      WHERE status = 'A'
        AND user_id = :userId
        AND date BETWEEN :beginDate AND :endDate
        AND day NOT IN ('Sun', 'Sat')
        AND NOT EXISTS (
          SELECT te.id 
          FROM ts_entries te 
          WHERE te.user_id = al.user_id 
            AND te.date = al.date 
            AND te.status = 'Approved' 
            AND te.is_active = 1
        )
        AND NOT EXISTS (
          SELECT lv.id 
          FROM main_leaverequest lv 
          WHERE lv.user_id = al.user_id 
            AND al.date BETWEEN lv.from_date AND lv.to_date 
            AND lv.leaveday = 1 
            AND lv.leavestatus = 'Approved' 
            AND lv.leavetypeid != 8
        )
    ) AS leave_days,

    (SELECT SUM(leave_late_flag) / 2
      FROM attendance_log
      WHERE user_id = :userId
      AND date BETWEEN :beginDate AND :endDate
    ) AS late_leave_days


  FROM attendance_log
  WHERE user_id = :userId
    AND date BETWEEN :beginDate AND :endDate
  `, {
    replacements: {
      userId: userId,
      beginDate: beginDate,
      endDate: endDate,
      lateTime: process.env.LATETIME,
      earlyTime: process.env.EARLYTIME,
      today: new Date().toISOString().split('T')[0]
    },
    type: db.Sequelize.QueryTypes.SELECT,
    raw: true,
    logging: console.log
  });

  return result;
}

const weekendWorkData = async (beginDate, endDate) => {
  try {
    const result = await db.sequelize.query("SELECT date FROM main_alter_weekdays WHERE date BETWEEN :beginDate AND :endDate AND is_active = 1", {
      replacements: {
        beginDate: beginDate,
        endDate: endDate
      },
      type: db.Sequelize.QueryTypes.SELECT,
    })

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const weekendLeavesData = async (userId, weekendWorkDaysList) => {
  try {
    if (!weekendWorkDaysList.length) {
      return 0;
    }

    const result = await db.sequelize.query(
      `
      SELECT COUNT(*) AS leave_days
      FROM attendance_log
      WHERE user_id = :userId
        AND date IN (:weekendWorkDaysList)
        AND status = 'A'
      `,
      {
        replacements: {
          userId,
          weekendWorkDaysList
        },
        type: db.Sequelize.QueryTypes.SELECT,
      }
    );

    // result = [ { leave_days: 1 } ]
    return result[0].leave_days;

  } catch (err) {
    console.log(`Database error: ${err.message}`);
    return 0;
  }
};


module.exports = { getAttendanceData, totalAttendancedetails, weekendWorkData, weekendLeavesData };