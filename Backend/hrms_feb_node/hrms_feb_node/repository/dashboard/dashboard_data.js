const provisionQuery = require("../../model");
const db = require("../../models");
const MainUsers = db.main_users;
const MainEmployeeleaves = db.main_employeeleaves;
const MainEmployeesummary = db.main_employees_summary;
const MainHolidayDates = db.main_holidaydates;
const MainLeaveRequest = db.main_leaverequest;
const { now } = require("moment");
const { Op } = require("sequelize");

const today = new Date();
today.setHours(0, 0, 0, 0);

const userdata = async (userId) => {
  try {
    const result = await MainEmployeesummary.findAll({
      attributes: ["user_id", "userfullname", "holiday_group", "project_id", "department_id"],
      where: {
        user_id: userId,

      },
      logging: console.log
    });

    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
}

const holidaydata = async (groupid) => {
  try {
    const currentYear = new Date().getFullYear();
    const nextYear = currentYear + 1;

    return await MainHolidayDates.findAll({
      attributes: ["holidayname", "holidaydate"],
      where: {
        groupid,
        holidaydate: { [Op.gte]: today },
        holidayyear: { [Op.in]: [currentYear, nextYear] }
      },
      order: [["holidaydate", "ASC"]],
      limit: 3,
      raw: true
    });
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
};


const holidaydataall = async (groupid) => {
  try {
    const result = await MainHolidayDates.findAll({
      attributes: ["holidayname", "holidaydate"],
      where: {
        groupid: groupid,
      },
      order: [["holidaydate", "ASC"]],
      logging: console.log
    });

    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
}

const leavedata = async (user_id, year) => {
  try {
    const result = await MainEmployeeleaves.findAll({
      attributes: ["emp_leave_limit", "used_leaves"],
      where: {
        user_id: user_id,
        alloted_year: year
      },
      logging: console.log
    });

    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
}

const getteamdata = async (projectId, user_id) => {
  try {
    const result = await MainEmployeesummary.findAll({
      attributes: ["user_id"],
      where: {
        project_id: projectId,
        user_id: { [Op.ne]: user_id },
        isactive: 1
      },
      raw: true
    });

    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
}

//for managers
const getEmployeeData = async (user_id) => {
  try {
    const result = await MainEmployeesummary.findAll({
      attributes: ["user_id"],
      where: {
        reporting_manager: user_id,
        isactive: 1
      },
      raw: true
    });
    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
}

const teamleavedata = async (userids) => {
  try {
    const next28Days = new Date(today);
    next28Days.setDate(today.getDate() + 28);

    const result = await MainLeaveRequest.findAll({
      attributes: ["from_date", "to_date", "leaveday", "leave_period"],
      include: [
        {
          model: MainEmployeesummary,
          as: "emp_sum_lve_req",
          attributes: ["userfullname", "prefix_id"],
        }
      ],
      where: {
        user_id: {
          [Op.in]: userids,
        },
        [Op.and]: [
          { to_date: { [Op.gte]: today } },       // Leave must not have ended before today
          { from_date: { [Op.lte]: next28Days } } // Leave must start within the next 28 days
        ],
        [Op.or]: [
          { leavestatus: "Approved" },
          { leavestatus: "Pending for approval" }
        ],
        leavetypeid: { [Op.ne]: 8 } // Exclude Overtime requests
      },
      order: [
        ["from_date", "ASC"]
      ],
      raw: true,
      logging: console.log
    });

    return result;
  } catch (err) {
    throw new Error(`Database Error: ${err.message}`);
  }
}

module.exports = { userdata, holidaydata, holidaydataall, leavedata, teamleavedata, getteamdata, getEmployeeData };