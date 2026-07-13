const db = require('../../models')
const Sequelize = require('sequelize');
const MainLeaveRequest = db.main_leaverequest;
const MainEmployeeLeaves = db.main_employeeleaves;
const TblUserLeaveTypes = db.tbl_user_leave_type;
const MainUsers = db.main_users;
const MainLogManager = db.main_logmanager;
const MainEmployeeLeaveTypes = db.main_employeeleavetypes;
const { logLeave, getLocalDateTime } = require('../../utils/leaveFileLogger');
const {
  getLeavesByRole,
  saveLeaveHistory
} = require('../../repository/employeeleaves/employee_leaves_records.js');



const getLeaves = async (user_id, emprole, month, year) => {
  return await getLeavesByRole(user_id, emprole, month, year);
};

const updateLeaveStatus = async (req) => {
  let leaveLogMessage = null;

  const {
    action,
    userId,
    id,
    leaveTypeId,
    leaveDay,
    no_of_days,
    approverComments,
  } = req.body;
  console.log('Update Leave Status Request:', req.body);

  let status;

  try {
    await db.sequelize.transaction(async (t) => {

      const currentStatus = await MainLeaveRequest.findOne({
        where: { id, isactive: 1 },
        lock: t.LOCK.UPDATE,
        transaction: t
      });

      const leaveTypeDB = await MainEmployeeLeaveTypes.findOne({
        where: { id: leaveTypeId, isactive: 1 },
        transaction: t
      });

      if (!currentStatus) {
        throw new Error('Leave request not found');
      }

      const leaveFromDate = new Date(currentStatus.from_date);

      const leaveYear = leaveFromDate.getFullYear();

      const employeeUserId = currentStatus.user_id;


      const previousStatus = currentStatus.leavestatus;

      switch (action.toLowerCase()) {
        case 'approved':
        case 'approve':
          status = 'Approved';
          break;
        case 'rejected':
        case 'reject':
          status = 'Rejected';
          break;
        case 'cancel':
        case 'canceled':
          status = 'Cancel';
          break;
        default:
          throw new Error('Invalid action');
      }


      // Update leave status (INSIDE transaction)
      const updateFields = {
        leavestatus: status,
        modifiedby: userId,
        modifieddate: new Date()
      };

      if (approverComments && (status === 'Rejected' || status === 'Cancel')) {
        updateFields.approver_comments = approverComments;
      }

      const [updated] = await MainLeaveRequest.update(
        updateFields,
        {
          where: {
            id: id,
            user_id: employeeUserId,
            isactive: 1,
          },
          lock: t.LOCK.UPDATE,
          transaction: t
        }
      );

      if (!updated) {
        throw new Error('Leave request not found');
      }

      await MainLogManager.create({
        module_name: 'Leave',
        menu_name: `Leave Request ${status}`,
        user_id: userId,
        page_url: '/api/hrms/employeeleaves/updatestatus',
        user_action: status === 'Approved' ? 7 : (status === 'Rejected' ? 8 : (status === 'Cancel' ? 5 : null)),
        log_details: `Leave request ${status} for user ${employeeUserId} from ${currentStatus.from_date} to ${currentStatus.to_date}.`,
        last_modifiedby: userId,
        last_modifieddate: new Date(),
        tracker: 'mobile',
        is_active: 1
      },
        { transaction: t });

      leaveLogMessage =
        `${getLocalDateTime()} | LEAVE_${status.toLocaleUpperCase()} | LeaveId= ${id} | Leave Period: ${currentStatus.leave_period == 1 ? 'Morning' : currentStatus.leave_period == 2 ? 'Afternoon' : 'Full Day'} | EmployeeId= ${employeeUserId} | ${status}By= ${userId}`;

      // Only if approved
      if (status === 'Approved') {
        const increment = Number(no_of_days);

        // Fetch leave balance
        const leaveType = await TblUserLeaveTypes.findOne({
          where: {
            userid: employeeUserId,
            employeeleavetypesid: leaveTypeId,
            isactive: 1,
            alloted_year: leaveYear
          },
          lock: t.LOCK.UPDATE,
          transaction: t
        });

        if (!leaveType) {
          throw new Error('Leave type not found');
        }

        const alreadyUsed = Number(leaveType.used_leaves || 0);
        const leaveLimit = Number(leaveType.number_of_days || 0);

        // Calculate
        const remainingLeaves = Math.max(leaveLimit - alreadyUsed, 0);
        const coveredByLeaves = Math.min(remainingLeaves, increment);
        const excessLeaves = increment - coveredByLeaves; // LoP

        // 1️⃣ Update used_leaves (can exceed limit)
        await TblUserLeaveTypes.update(
          {
            used_leaves: Sequelize.literal(`used_leaves + ${increment}`),
            modifiedby: userId,
            modifieddate: new Date()
          },
          {
            where: {
              userid: employeeUserId,
              employeeleavetypesid: leaveTypeId,
              alloted_year: leaveYear,
              isactive: 1
            },
            transaction: t
          }
        );

        // 2️⃣ Update employee summary
        await MainEmployeeLeaves.update(
          {
            used_leaves: Sequelize.literal(`used_leaves + ${increment}`),
            modifiedby: userId,
            modifieddate: new Date()
          },
          {
            where: {
              user_id: employeeUserId,
              alloted_year: leaveYear,
              isactive: 1
            },
            transaction: t
          }
        );

        // 3️⃣ Update LoP ONLY if excess exists
        await MainLeaveRequest.update(
          {
            loss_of_pay: excessLeaves > 0 ? excessLeaves : null,
            modifiedby: userId,
            modifieddate: new Date()
          },
          {
            where: { id, user_id: employeeUserId, isactive: 1 },
            transaction: t
          }
        );


        const userEmail = await MainUsers.findOne({
          attributes: ['emailaddress', 'userfullname'],
          where: { id: employeeUserId },
          lock: t.LOCK.UPDATE,
          transaction: t
        })

        const employeeName = userEmail.userfullname;
        const noOfDays = increment;
        const fromDate = currentStatus.from_date;
        const toDate = currentStatus.to_date;
        const leaveTypeName = leaveTypeDB.leavetype;
        const leaveReason = currentStatus.reason;

        const approveMsg = `
            <div>Hi ${employeeName},</div>
            <div>The below leave(s) has been approved.</div>

            <div>
            <table width="100%" cellspacing="0" cellpadding="15" border="0"
              style="border:3px solid #BBBBBB; font-size:16px; font-family:Arial, Helvetica, sans-serif; margin:30px 0;"
              bgcolor="#ffffff">

              <tbody>
                <tr>
                  <td width="28%" style="border-right:2px solid #BBBBBB;">Employee Name</td>
                  <td width="72%">${employeeName}</td>
                </tr>

                <tr bgcolor="#e9f6fc">
                  <td style="border-right:2px solid #BBBBBB;">No. of Day(s)</td>
                  <td>${noOfDays}</td>
                </tr>

                <tr>
                  <td style="border-right:2px solid #BBBBBB;">From</td>
                  <td>${fromDate}</td>
                </tr>

                <tr bgcolor="#e9f6fc">
                  <td style="border-right:2px solid #BBBBBB;">Leave Type</td>
                  <td>${leaveTypeName}</td>
                </tr>

                <tr>
                  <td style="border-right:2px solid #BBBBBB;">To</td>
                  <td>${toDate}</td>
                </tr>

                <tr bgcolor="#e9f6fc">
                  <td style="border-right:2px solid #BBBBBB;">Reason for Leave</td>
                  <td>${leaveReason}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div style="padding:20px 0 10px 0;">
            Please <a href="https://hrms.codeboardtech.com/index.php/pendingleaves/all"
            target="_blank" style="color:#b3512f;">click here</a> to login and check the leave details.
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
              toName: employeeName,
              subject: 'Leave request approved',
              header: 'Leave Request',
              message: approveMsg,
              is_sent: 0,
              createddate: new Date(),
              modifieddate: new Date()
            },
            transaction: t
          }
        );

        const leaveRequestData = await MainLeaveRequest.findOne({
          where: { id: id, isactive: 1 },
          transaction: t
        });

        let history = '';
        if (leaveRequestData.leavetypeid == 8) {
          history = 'Overtime Request has been Approved by';
        } else if (leaveRequestData.leavetypeid == 10) {
          history = 'Comp off Request has been Approved by';
        } else {
          history = 'Leave Request has been Approved by';
        }

        const historyData = {
          leaverequest_id: id,
          description: history,
          createdby: userId,
          modifiedby: userId,
          isactive: 1,
          createddate: new Date(),
          modifieddate: new Date(),
        }
        await saveLeaveHistory(historyData);
      }


      if (status === "Rejected" || status === "Cancel") {

        const increment = Number(no_of_days);

        const userEmail = await MainUsers.findOne({
          attributes: ['emailaddress', 'userfullname'],
          where: { id: employeeUserId },
          lock: t.LOCK.UPDATE,
          transaction: t
        })

        const employeeName = userEmail.userfullname;
        const noOfDays = increment;
        const fromDate = currentStatus.from_date;
        const toDate = currentStatus.to_date;
        const leaveTypeName = leaveTypeDB.leavetype;
        const leaveReason = currentStatus.reason;

        if (status === "Cancel") {
          const cancelMsg = `
           <div>Hi, ${employeeName}</div>
								<div>The below leave(s) has been cancelled.</div>
								<div>
								<table width="100%" cellspacing="0" cellpadding="15" border="0" style="border:3px solid #BBBBBB; font-size:16px; font-family:Arial, Helvetica, sans-serif; margin:30px 0 30px 0;" bgcolor="#ffffff">
									<tbody><tr>
										<td width="28%" style="border-right:2px solid #BBBBBB;">Employee Name</td>
										<td width="72%">${employeeName}</td>
									</tr>
									<tr bgcolor="#e9f6fc">
										<td style="border-right:2px solid #BBBBBB;">No. of Day(s)</td>
										<td>${noOfDays}</td>
									</tr>
									<tr>
										<td style="border-right:2px solid #BBBBBB;">From</td>
										<td>${fromDate}</td>
									</tr>
									<tr bgcolor="#e9f6fc">
										<td style="border-right:2px solid #BBBBBB;">Leave Types</td>
										<td>${leaveTypeName}</td>
									</tr>
									<tr>
										<td style="border-right:2px solid #BBBBBB;">To</td>
										<td>${toDate}</td>
									</tr>
									<tr bgcolor="#e9f6fc">
										<td style="border-right:2px solid #BBBBBB;">Reason for Leave</td>
										<td>${leaveReason}</td>
								</tr>
								</tbody></table>

							</div>
							<div style="padding:20px 0 10px 0;">Please <a href="http://localhost/web_hrms/index.php/" target="_blank" style="color:#b3512f;">click here</a> to login and check the leave details.</div>
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
                toName: employeeName,
                subject: 'Leave request cancelled',
                header: 'Leave Request',
                message: cancelMsg,
                is_sent: 0,
                createddate: new Date(),
                modifieddate: new Date()
              },
              transaction: t
            }
          );

          const leaveRequestData = await MainLeaveRequest.findOne({
            where: { id: id, isactive: 1 },
            transaction: t
          });

          let history = '';
          if (leaveRequestData.leavetypeid == 8) {
            history = 'Overtime Request has been Cancelled by';
          } else if (leaveRequestData.leavetypeid == 10) {
            history = 'Comp off Request has been Cancelled by';
          } else {
            history = 'Leave Request has been Cancelled by';
          }

          const historyData = {
            leaverequest_id: id,
            description: history,
            createdby: userId,
            modifiedby: userId,
            isactive: 1,
            createddate: new Date(),
            modifieddate: new Date(),
          }
          await saveLeaveHistory(historyData);
        }

        if (status === "Rejected") {
          const rejectMsg = `<div>Hi ${employeeName},</div><div>The below leave(s) has been rejected. </div><div>
                <table width="100%" cellspacing="0" cellpadding="15" border="0" style="border:3px solid #BBBBBB; font-size:16px; font-family:Arial, Helvetica, sans-serif; margin:30px 0 30px 0;" bgcolor="#ffffff">
                      <tbody><tr>
                        <td width="28%" style="border-right:2px solid #BBBBBB;">Employee Name</td>
                        <td width="72%">${employeeName}</td>
                      </tr>
                      <tr bgcolor="#e9f6fc">
                        <td style="border-right:2px solid #BBBBBB;">No. of Day(s)</td>
                        <td>${noOfDays}</td>
                      </tr>
                      <tr>
                        <td style="border-right:2px solid #BBBBBB;">From</td>
                        <td>${fromDate}</td>
                      </tr>
                      <tr bgcolor="#e9f6fc">
                        <td style="border-right:2px solid #BBBBBB;">Leave Type</td>
                        <td>${leaveTypeName}</td>
                      </tr>
                      <tr>
                        <td style="border-right:2px solid #BBBBBB;">To</td>
                        <td>${toDate}</td>
            	     </tr>
                      <tr bgcolor="#e9f6fc">
                        <td style="border-right:2px solid #BBBBBB;">Reason for Leave</td>
                        <td>${leaveReason}</td>
                  </tr>
                </tbody></table>

            </div>
            <div style="padding:20px 0 10px 0;">Please <a href="https://hrms.codeboardtech.com/index.php/pendingleaves/all" target="_blank" style="color:#b3512f;">click here</a> to login and check the leave details.</div>
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
                toName: employeeName,
                subject: 'Leave request rejected',
                header: 'Leave Request',
                message: rejectMsg,
                is_sent: 0,
                createddate: new Date(),
                modifieddate: new Date()
              },
              transaction: t
            }
          );

          const leaveRequestData = await MainLeaveRequest.findOne({
            where: { id: id, isactive: 1 },
            transaction: t
          });

          let history = '';
          if (leaveRequestData.leavetypeid == 8) {
            history = 'Overtime Request has been Rejected by';
          } else if (leaveRequestData.leavetypeid == 10) {
            history = 'Comp off Request has been Rejected by';
          } else {
            history = 'Leave Request has been Rejected by';
          }

          const historyData = {
            leaverequest_id: id,
            description: history,
            createdby: userId,
            modifiedby: userId,
            isactive: 1,
            createddate: new Date(),
            modifieddate: new Date(),
          }
          await saveLeaveHistory(historyData);
        }

        await MainLeaveRequest.update(
          { loss_of_pay: null, modifiedby: userId, modifieddate: new Date() },
          { where: { id, user_id: employeeUserId, isactive: 1 }, transaction: t }
        );

        if (previousStatus === "Approved") {
          const decrement = Number(no_of_days);

          await TblUserLeaveTypes.update(
            {
              used_leaves: Sequelize.literal(
                `GREATEST(used_leaves - ${Number(no_of_days)}, 0)`
              ),
              modifiedby: userId,
              modifieddate: new Date()
            },
            {
              where: {
                userid: employeeUserId,
                employeeleavetypesid: leaveTypeId,
                alloted_year: leaveYear,
                isactive: 1
              },
              transaction: t
            }
          );


          await MainEmployeeLeaves.update(
            {
              used_leaves: Sequelize.literal(
                `GREATEST(used_leaves - ${Number(no_of_days)}, 0)`
              ),
              modifiedby: userId,
              modifieddate: new Date()
            },
            {
              where: {
                user_id: employeeUserId,
                alloted_year: leaveYear,
                isactive: 1
              },
              transaction: t
            }
          );

        }


      }
    });

    if (leaveLogMessage) {
      logLeave(leaveLogMessage);
    }


    // Send response ONLY after commit
    return {
      success: true,
      status,
      message: `Leave ${status.toLowerCase()} successfully`
    };


  } catch (error) {
    console.error('Transaction error:', error);
    throw error;
  }

};

module.exports = {
  getLeaves,
  updateLeaveStatus
};