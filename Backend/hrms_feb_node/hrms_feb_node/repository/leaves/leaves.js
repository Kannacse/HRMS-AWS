const db = require("../../models");
const MainUsers = db.main_users;
const MainEmployeesummary = db.main_employees_summary;
const MainLeaveRequest = db.main_leaverequest;
const LeaveTypes = db.tbl_user_leave_type;
const MainLeaveTypes = db.main_employeeleavetypes;
const TsEntries = db.ts_entries;
const LeaveHistory = db.main_leaverequest_history;
const MainLogManager = db.main_logmanager;
const { now } = require("moment");
const { Op, } = require("sequelize");


const getLeaveTypes = async (userId, year) => {
  try {
    const result = await LeaveTypes.findAll({
      where: {
        userid: userId,
        alloted_year: year,
        isactive: 1
      },
      include: [
        {
          model: MainLeaveTypes,
          as: "main_lve_type_id",
          attributes: ["leavetype"]
        }
      ],
      raw: true
    });

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const getEmpolyeePrefix = async (userId) => {
  try {
    const result = await MainEmployeesummary.findOne(
      {
        attributes: ['prefix_id'],
        where: {
          user_id: userId,
          isactive: 1
        },
        raw: true
      }
    );

    return result
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const appliedleave = async (userId) => {
  try {
    const result = await MainLeaveRequest.findAll({
      attributes: ['from_date', 'to_date'],
      where: {
        user_id: userId,
        leavestatus: {
          [Op.in]: [1, 2],
        },
        isactive: 1
      },
      raw: true
    });

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const checkLeaveExists = async (from_date, to_date, userId) => {
  try {
    const result = await db.sequelize.query(
      `
      SELECT COUNT(l.id) AS leaveexist
      FROM main_leaverequest l
      WHERE l.user_id = :userId
        AND l.leavestatus IN (1, 2)
        AND l.isactive = 1
        AND (
          DATE(:from_date) <= DATE(l.to_date)
          AND DATE(:to_date) >= DATE(l.from_date)
        )
      `,
      {
        replacements: {
          userId,
          from_date,
          to_date,
        },
        type: db.Sequelize.QueryTypes.SELECT,
      }
    );

    return result[0].leaveexist > 0;
  } catch (err) {
    console.error('Database error in checkLeaveExists:', err);
    throw err;
  }
};




const getAlteredWeekdays = async () => {
  const currentYear = new Date().getFullYear();

  const startDate = `${currentYear}-01-01`;
  const endDate = `${currentYear + 1}-01-01`;

  try {
    const result = await db.sequelize.query(
      `
      SELECT date
      FROM main_alter_weekdays
      WHERE date >= :startDate
        AND date < :endDate
      `,
      {
        replacements: { startDate, endDate },
        type: db.Sequelize.QueryTypes.SELECT,
      }
    );

    return result;
  } catch (err) {
    console.log(`Database error: ${err.message}`);
  }
};


const getcompoffdata = async (userId, comp_off_date, comp_off_id) => {
  try {
    const result = await db.sequelize.query("SELECT * FROM main_leaverequest WHERE user_id = ? AND  leavetypeid = ? AND compensatory_date = ? AND (leavestatus = 'Approved' OR leavestatus = 'Pending for approval') AND isactive = ?", {
      replacements: [userId, comp_off_id, comp_off_date, 1],
      type: db.Sequelize.QueryTypes.SELECT,
    })

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const getcompoffclub = async (userId, previous_from_date, next_from_date, comp_off_id) => {
  try {
    const result = await db.sequelize.query("SELECT * FROM main_leaverequest WHERE user_id = ? AND (from_date = ? OR from_date = ?) AND  leavetypeid = ? AND (leavestatus = 'Approved' OR leavestatus = 'Pending for approval') AND isactive = ?", {
      replacements: [userId, previous_from_date, next_from_date, comp_off_id, 1],
      type: db.Sequelize.QueryTypes.SELECT,
    })

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const weekendWorkData = async () => {
  try {
    const result = await db.sequelize.query("SELECT date FROM main_alter_weekdays WHERE is_active = 1", {
      type: db.Sequelize.QueryTypes.SELECT,
    })

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const getAttendanceData = async (userId, date) => {
  try {
    if (!date) return [];

    const result = await db.sequelize.query(
      "SELECT * from attendance_log where user_id = ? AND date = ?",
      {
        replacements: [userId, date],
        type: db.Sequelize.QueryTypes.SELECT,
      }
    );

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const getRepMang = async (userId) => {
  try {
    const result = await db.sequelize.query("Select reporting_manager, reporting_manager_name from main_employees_summary where user_id = ?", {
      replacements: [userId],
      type: db.Sequelize.QueryTypes.SELECT,
    })
    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  };
}

// const getNoOfDays = (appliedLeavesdaycount, leaveDay) => {
//   if (leaveDay == 2) {
//     return appliedLeavesdaycount * 0.5;
//   }
//   return appliedLeavesdaycount;
// }

const saveLeaves = async ({ leavetypeId, fromDate, toDate, userId, reason, leaveDay, leavePeriod, appliedLeavesdaycount, compensatoryHrs, compOffDate, lateEarly, dayName, sandwichLeave }) => {

  const transaction = await db.sequelize.transaction();

  try {
    // const lossOfPay = getNoOfDays(appliedLeavesdaycount, leaveDay);
    const repData = await getRepMang(userId);
    const repMangId = repData?.[0]?.reporting_manager ?? null;
    if (!repMangId) throw new Error("Reporting manager not found");

    const result = await MainLeaveRequest.create({
      user_id: userId,
      reason: reason,
      leavetypeid: leavetypeId,
      leaveday: leaveDay,
      leave_period: leavePeriod,
      from_date: fromDate,
      to_date: toDate,
      leavestatus: 1,
      loss_of_pay: appliedLeavesdaycount,
      compensatory_hrs: compensatoryHrs,
      compensatory_date: compOffDate,
      late_early: lateEarly,
      rep_mang_id: repMangId,
      no_of_days: appliedLeavesdaycount,
      appliedleavescount: appliedLeavesdaycount,
      is_sandwich_leave: sandwichLeave,
      modifiedby: userId,
      modifieddate: new Date(),
      createdby: userId,
      createddate: new Date(),
      isactive: 1,
    },
      { transaction });

    const userEmail = await MainUsers.findOne({
      attributes: ['emailaddress', 'userfullname'],
      where: { id: repMangId },
      transaction
    },
    );

    await MainLogManager.create({
      module_name: 'Leave',
      menu_name: 'Leave Request Applied',
      user_id: userId,
      page_url: '/api/hrms/applyleave',
      user_action: 1,
      log_details: `Leave applied from ${fromDate} to ${toDate} for ${appliedLeavesdaycount} day(s).`,
      last_modifiedby: userId,
      last_modifieddate: new Date(),
      tracker: 'mobile',
      is_active: 1
    },
      { transaction });

    const managerName = userEmail?.userfullname ?? 'Manager';

    const year = new Date().getFullYear();

    const leaveTypeData = await LeaveTypes.findOne({
      attributes: ['number_of_days', 'used_leaves'],
      where: {
        employeeleavetypesid: leavetypeId,
        userid: userId,
        alloted_year: year
      },
      transaction
    },
    );

    const Remaining = leaveTypeData ? (leaveTypeData.number_of_days - leaveTypeData.used_leaves) : 0;

    const leaveType = await MainLeaveTypes.findOne({
      attributes: ['leavetype'],
      where: { id: leavetypeId },
      transaction
    },
    );

    const requestMsg = `
            <div>
							<div>Dear ${managerName},</div>
							<div>The leave of the below employee is pending for approval:</div>
							<div>
							<table width="100%" cellspacing="0" cellpadding="15" border="0" style="border:3px solid #BBBBBB; font-size:16px; font-family:Arial, Helvetica, sans-serif; margin:30px 0 30px 0;" bgcolor="#ffffff">
							<tbody><tr>
								<td width="28%" style="border-right:2px solid #BBBBBB;">Employee Name</td>
								<td width="72%">${managerName}</td>
							</tr>
							<tr bgcolor="#e9f6fc">
								<td style="border-right:2px solid #BBBBBB;">No. of Day(s)</td>
								<td>${appliedLeavesdaycount}</td>
							</tr>
							<tr>
								<td style="border-right:2px solid #BBBBBB;">Remaining Leaves</td>
								<td>${Remaining ?? 0}</td>
							</tr>
							<tr>
								<td style="border-right:2px solid #BBBBBB;">From</td>
								<td>${fromDate}</td>
							</tr>
							<tr bgcolor="#e9f6fc">
									<td style="border-right:2px solid #BBBBBB;">Leave Type</td>
									<td>${leaveType?.leavetype ?? 'N/A'}</td>
							</tr>
							<tr>
								<td style="border-right:2px solid #BBBBBB;">To</td>
								<td>${toDate}</td>
							</tr>
							<tr bgcolor="#e9f6fc">
								<td style="border-right:2px solid #BBBBBB;">Reason for Leave</td>
								<td>${reason}</td>
							</tr>
							<tr>
								<td style="border-right:2px solid #BBBBBB;">Reporting Manager</td>
								<td>${managerName}</td>
							</tr>
							</tbody></table>

							</div>
							<div style="padding:20px 0 10px 0;">Please <a href="http://localhost/web_hrms/index.php/manageremployeevacations" target="_blank" style="color:#b3512f;">click here</a> to login and check the leave details.</div>
							</div>
    `;

    await db.sequelize.query(
      `insert into main_emaillogs
      (toEmail, toName, emailsubject, header, message, is_sent, createddate, modifieddate) 
      values
      (:toEmail, :toName, :subject, :header, :message, :is_sent, :createddate, :modifieddate)
      `,
      {
        replacements: {
          toEmail: userEmail.emailaddress,
          toName: managerName,
          subject: 'Leave request for approval',
          header: 'Leave Request',
          message: requestMsg,
          is_sent: 0,
          createddate: new Date(),
          modifieddate: new Date()
        },
        transaction
      },
    );

    await transaction.commit();

    return result;
  } catch (err) {
    await transaction.rollback();
    console.error('Database error:', err);
    throw err;
  }
}

const updateTsEntry = async (dataEntry, whereEntry) => {
  try {
    const result = await TsEntries.update(
      dataEntry,
      {
        where: whereEntry,
        logging: console.log,
      }
    );
    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const saveLeaveHistory = async (dataEntry) => {
  try {
    const result = await LeaveHistory.create(
      dataEntry,
      {
        logging: console.log,
      }
    );
    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

const leavebalance = async (leavetypeId, userid, year) => {
  try {
    const result = await LeaveTypes.findAll({
      where: {
        employeeleavetypesid: leavetypeId,
        userid: userid,
        alloted_year: year
      },
      raw: true
    })

    return result;
  } catch (err) {
    console.log(`Database error ${err.message}`);
  }
}

module.exports = { getLeaveTypes, getEmpolyeePrefix, getAlteredWeekdays, getcompoffdata, getcompoffclub, weekendWorkData, getAttendanceData, appliedleave, checkLeaveExists, saveLeaves, updateTsEntry, saveLeaveHistory, leavebalance };