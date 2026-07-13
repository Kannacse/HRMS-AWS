const express = require('express');
const { userdata, holidaydata, leavedata, teamleavedata, getteamdata, getEmployeeData } = require('../../repository/dashboard/dashboard_data');

async function userDashboarddata(user_id, year) {
  try {
    const userData = await userdata(user_id);
    const leaves = await leavedata(user_id, year);

    let holiday = [];
    let teamLeaves = [];
    let currentUserFullName = "";

    if (userData.length > 0) {
      const groupId = userData[0].holiday_group;
      const projectId = userData[0].project_id;

      // Holiday data
      holiday = await holidaydata(groupId);
      currentUserFullName = userData[0].userfullname;


      // change the holidaydate format using map
      holiday = holiday.map(h => {
        const dateObj = new Date(h.holidaydate);
        const formatedDate = dateObj.toLocaleDateString("en-GB", {
          day: '2-digit',
          month: "short",
        });
        return {  // Push changed format to holiday
          ...h.JSON,
          holidayname: h.holidayname,
          holidaydate: formatedDate.replace(/ /g, " ")
        }
      });


      // Get team members data
      let teamData = projectId ? await getteamdata(projectId, user_id) : [];
      const reportingTeam = await getEmployeeData(user_id);
      const teamUserIds = [
        ...new Set(
          [...teamData, ...reportingTeam].map(u => u.user_id)
        )
      ];

      // team member leave data
      teamLeaves = await teamleavedata(teamUserIds);

      teamLeaves = teamLeaves.map(l => {
        return {
          ...l.JSON,
          employeename: l['emp_sum_lve_req.userfullname'],
          from_date: l.from_date,
          to_date: l.to_date,
          leaveday: l.leaveday,
          leave_period: l.leave_period,
          prefix_id: l['emp_sum_lve_req.prefix_id']
        }
      });
    }

    return { success: true, leaves, holiday, teamLeaves, userFullName: currentUserFullName };
  } catch (error) {
    return { success: false, error: error.message };
  }

}

module.exports = { userDashboarddata };