const express = require('express');
const { getLeaveTypes, getEmpolyeePrefix, getAlteredWeekdays, getcompoffdata, getcompoffclub, weekendWorkData, getAttendanceData, appliedleave, checkLeaveExists, saveLeaves, updateTsEntry, saveLeaveHistory, leavebalance } = require('../../repository/leaves/leaves');
const { userdata, holidaydataall } = require('../../repository/dashboard/dashboard_data')
const { logLeave, getLocalDateTime } = require('../../utils/leaveFileLogger');


async function getUserleaves(userId, year) {
  try {
    // Get employee prefix
    const empPrefix = await getEmpolyeePrefix(userId);
    const prefixId = Number(empPrefix?.prefix_id);

    let leaveTypes = await getLeaveTypes(userId, year);

    // 👉 Apply prefix-based filtering
    leaveTypes = leaveTypes.filter(l => {
      // prefix = 1 → exclude employeeleavetypesid = 9
      if (prefixId === 1 && l.employeeleavetypesid === 9) {
        return false;
      }

      // prefix = 2 or 3 → exclude employeeleavetypesid = 6
      if ((prefixId === 2 || prefixId === 3) && l.employeeleavetypesid === 6) {
        return false;
      }
      return true;
    });

    leaveTypes = leaveTypes
      .filter(l => l !== null) // 🔥 prevent null rows
      .map(l => ({
        ...(l.JSON ?? {}),      // 🔥 protect spread
        leaveid: l.employeeleavetypesid,
        leavetype: l['main_lve_type_id.leavetype'],
        allotedLeaves: l.employeeleavetypesid === 8 ? 0 : (l.number_of_days ?? 0),
        usedLeaves: l.employeeleavetypesid === 8 ? 0 : (l.used_leaves ?? 0),

      }));


    return { success: true, leaveTypes };
  } catch (error) {
    return { success: false, error: error.message };
  }
}


// Calculate number of days
async function calculatedays(userId, fromDate, toDate, leaveTypeId, daySelected) {
  try {
    let days = 0;
    let result = null;
    let weekenddeatils = null;
    let holiday = [];
    let holidayleaverequest = 0;
    let holiday_error = '';
    let noOfDays = 0;

    if (daySelected == 1 || daySelected == 2) {
      if (toDate >= fromDate) {

        const userData = await userdata(userId);
        let groupId = userData[0].holiday_group;
        let deptId = userData[0].department_id;

        if (deptId) {
          weekenddeatils = await getAlteredWeekdays(deptId); // get weekend details array
          let weekend1 = null;
          let weekend2 = null;

          if (weekenddeatils && weekenddeatils.length > 0) {
            weekend1 = weekenddeatils[0].daystartname;
            weekend2 = weekenddeatils[0].dayendname;
          }


          if (weekenddeatils && weekenddeatils.length > 0) {
            holiday = await holidaydataall(groupId); // get holiday dates

            holiday = holiday.map(h => {
              return {
                ...h.JSON,
                holidaydate: h.holidaydate
              }
            });

            if (holiday && holiday.length > 0) {
              for (const holiday_date of holiday) {
                if (fromDate == holiday_date.holidaydate) {
                  holidayleaverequest = 1;
                  holiday_error = 'fromDate';
                  break;
                } else if (toDate == holiday_date.holidaydate) {
                  holidayleaverequest = 1;
                  holiday_error = 'toDate';
                  break;
                }
              }
            }
          }


        }

        let fromDateObj = new Date(fromDate);
        let weekDay = fromDateObj.toLocaleDateString('en-US', { weekday: 'long' });

        while (fromDateObj <= new Date(toDate)) {
          if (leaveTypeId === 8) {
            // Add all days for maternity leave
            noOfDays++;
          } else {
            const dateStr = fromDateObj.toISOString().split('T')[0];

            const isHoliday = holiday.some(h => h.holidaydate === dateStr);

            if (weekDay !== weekend1 && weekDay !== weekend2 && !isHoliday) {
              noOfDays++;
            }
            else {
              if (weekDay !== weekend1 && weekDay !== weekend2) {
                noOfDays++;
              }
            }
          }

          // Increment the date by 1 day
          fromDateObj.setDate(fromDateObj.getDate() + 1);

          // Update fromDate and weekDay
          fromDate = fromDateObj.toISOString().split('T')[0]; // format as 'YYYY-MM-DD'
          weekDay = fromDateObj.toLocaleDateString('en-US', { weekday: 'long' });
        }

      }

      if (holidayleaverequest != 1) {
        if (daySelected == 2) {
          days = 0.5;
        } else {
          days = noOfDays;
        }

        result = {
          result: 'success',
          days: days,
          message: '',
          availableleaves: '',
          holiday_error: '',
        }

      } else {
        result = {
          result: 'error',
          days: noOfDays,
          message: 'You have applied government holiday. you cannot apply to leave on weekends/holidays',
          availableleaves: '',
          holiday_error: holiday_error
        };
      }
    } else {
      if (fromDate == toDate) {
        if (ishalfday == 1) {
          result = {
            result: 'success',
            days: 0.5,
            message: '',
            availableleaves: '',
            holiday_error: '',
          }

        } else {
          result = {
            result: 'error',
            days: noOfDays,
            message: 'Half day leave canot be applied',
            availableleaves: '',
            holiday_error: holiday_error
          };
        }
      } else {
        result = {
          result: 'error',
          days: noOfDays,
          message: 'From Date and To Date should be same for Half day.',
          availableleaves: '',
          holiday_error: holiday_error
        };

      }

    }


    return { success: true, result };
  } catch (error) {
    return { success: false, error: error.message };
  }
}


// Apply leave

async function applyleave(userId, reason, fromDate, toDate, leavetypeId, leaveDay, leavePeriod, appliedLeavesdaycount, compensatory_hrs, compOffDate, lateEarly, repMangId, dayName, sandwichLeave) {
  try {
    let leaveLogMessage = null;
    const userData = await userdata(userId);
    let groupId = userData[0].holiday_group;
    let deptId = userData[0].department_id;

    let msgArray = null;
    let errorFlag = 'true';
    // let sandwichLeave = 0;
    let compensatoryHrs = compensatory_hrs || null;


    // Weekend work date
    let weekendWorkingData = await weekendWorkData();

    let attendanceData = [];

    // get attendance log
    if (compOffDate) {
      attendanceData = await getAttendanceData(userId, compOffDate);
    }


    let full_from_date = new Date(fromDate);
    let full_comp_off_date = compOffDate ? new Date(compOffDate) : null;
    let compDay = full_comp_off_date
      ? full_comp_off_date.toLocaleDateString('en-US', { weekday: 'long' })
      : null;
    let fromDay = full_from_date.toLocaleDateString('en-US', { weekday: 'long' });

    // Previous day
    let previous_from_date = new Date(full_from_date);
    previous_from_date.setDate(previous_from_date.getDate() - 1);
    previous_from_date = previous_from_date.toISOString().split('T')[0]; // format YYYY-MM-DD

    // Next day
    let next_from_date = new Date(full_from_date);
    next_from_date.setDate(next_from_date.getDate() + 1);
    next_from_date = next_from_date.toISOString().split('T')[0]; // format YYYY-MM-DD

    // Day diff
    let diffTime = full_comp_off_date - full_from_date;
    let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));


    if (!leavetypeId) {
      msgArray = {
        result: 'Please select leave type',
      }
      errorFlag = 'false';
    }

    // if (leavetypeId == 8) {
    //   if (!hour || !min || (Number(hour) === 0 && Number(min) === 0)) {
    //     return {
    //       success: false,
    //       errorFlag: 'false',
    //       msgArray: {
    //         result: 'Please enter valid overtime hours'
    //       }
    //     };
    //   }
    // }

    // Comp off validations
    if (leavetypeId == 10) {
      if (compOffDate) {
        let compoffLeaveData = await getcompoffdata(userId, compOffDate, 10);
        let getCompoffDataClub = await getcompoffclub(userId, previous_from_date, next_from_date, 10)

        if (compoffLeaveData.length > 0) {
          msgArray = {
            result: 'Comp off already applied on this date',
          }
          errorFlag = 'false';
        }

        if (getCompoffDataClub.length > 0) {
          msgArray = {
            result: 'Comp off cannot be applied for more than one day continously',
          }
          errorFlag = 'false';
        }

        if (diffDays > 30) {
          msgArray = {
            result: 'Comp off must be taken within 30 days',
          }
          errorFlag = 'false';
        }

        if (compDay == 'Saturday' || compDay == 'Sunday') {

          // Check compoff day is working weekend
          let isWorkingweekend = weekendWorkingData.some(item => item.date === compOffDate);
          let isWeekendFrom = weekendWorkingData.some(item => item.date === fromDate);

          if (isWorkingweekend) {
            msgArray = {
              result: 'This weekend is a working day',
            }
            errorFlag = 'false';
          } else {
            // Apply comp off on working weekend
            if (fromDay == 'Saturday' || fromDay == 'Sunday') {
              if (!isWeekendFrom) {
                msgArray = {
                  result: 'Cannot apply comp off on weekends',
                }
                errorFlag = 'false';
              }
            }

            if (full_comp_off_date > full_from_date) {
              msgArray = {
                result: 'Comp off date should less than from date',
              }
              errorFlag = 'false';
            }

            // Check attendance on that day works
            if (attendanceData.length > 0) {
              let workedHrs = attendanceData[0].worked_hours;

              if (workedHrs < 8) {
                msgArray = {
                  result: 'You have not worked on 8hrs on this day',
                }
                errorFlag = 'false';
              }
            } else {
              msgArray = {
                result: 'You have not worked on 8hrs on this day',
              }
              errorFlag = 'false';
            }
          }


        } else {
          msgArray = {
            result: 'Cannot apply comp off on weekday',
          }
          errorFlag = 'false';
        }
      }
    }


    // Leave validation for previous month after 30

    if (leavetypeId != 10 && leavetypeId != 8) {
      let fromMon = full_from_date.getMonth() + 1;
      let fromYear = full_from_date.getFullYear();
      let fromDateDay = full_from_date.getDate();
      let currentDate = new Date();  // keep it as a Date object
      let currentMonth = currentDate.getMonth() + 1; // month is 0-based
      let currentYear = currentDate.getFullYear();
      let currentDateDay = currentDate.getDate();

      let monthDiff = currentMonth - fromMon;

      const currentYM = currentYear * 12 + currentMonth;
      const fromYM = fromYear * 12 + fromMon;

      if (currentYM > fromYM) {
        // From date is in a previous payroll month
        if (currentYM - fromYM <= 1) {
          if (fromDateDay < 29) {
            msgArray = {
              result: 'Cannot able to apply leave on previous payroll month after the 30',
            };
            errorFlag = 'false';
          }
        } else {
          msgArray = {
            result: 'Cannot able to apply leave on previous payroll month after the 30',
          };
          errorFlag = 'false';
        }
      } else if (currentYM === fromYM) {
        // Same payroll month
        if (currentDateDay > 30 && fromDateDay < 29) {
          msgArray = {
            result: 'Cannot able to apply leave on previous payroll month after the 30',
          };
          errorFlag = 'false';
        }
      }


    }

    // Check leave already applied
    // let userAppliedleave = await appliedleave(userId);

    let leaveExists = null;
    if (leaveDay == 1) {
      leaveExists = await checkLeaveExists(fromDate, toDate, userId);
    } else {
      leaveExists = await checkLeaveExists(fromDate, fromDate, userId);
    }

    if (leaveExists === true) {
      msgArray = {
        result: 'Leave has already applied for the above dates',
      };
      errorFlag = 'false';
    }



    // if (dayName.includes(1) || dayName.includes(5)) {
    //   sandwichLeave = 1;
    // }


    // Save leave request

    if (errorFlag == 'true') {

      console.log('sandwichLeave value:', sandwichLeave);


      const insertLeaves = await saveLeaves({ leavetypeId, fromDate, toDate, userId, reason, leaveDay, leavePeriod, appliedLeavesdaycount, compensatoryHrs, compOffDate, lateEarly, repMangId, dayName, sandwichLeave });

      let leaveId = insertLeaves.id;
      if (leaveId) {

        const period = await calculatePeriod(fromDate, toDate);

        // Cancel timesheet entries
        if (leavetypeId != 8) {
          for (const pt of period) {
            const dataEntry = {
              status: "Cancelled",
              modified_by: userId,
              modified_date: new Date(),
              is_active: 0,
            }

            const whereEntry = {
              user_id: userId,
              date: pt
            }

            const saveEntry = await updateTsEntry(dataEntry, whereEntry);

          }
        }

        // Update leave history
        let history = '';
        if (leavetypeId == 8) {
          history = 'Overtime Request has been sent for Manager Approval by';
        } else if (leavetypeId == 10) {
          history = 'Comp off Request has been sent for Manager Approval by';
        } else {
          history = 'Leave Request has been sent for Manager Approval by';
        }

        const historyData = {
          leaverequest_id: leaveId,
          description: history,
          createdby: userId,
          modifiedby: userId,
          isactive: 1,
          createddate: new Date(),
          modifieddate: new Date(),
        }
        await saveLeaveHistory(historyData);

        leaveLogMessage =
          `${getLocalDateTime()} | LEAVE_APPLIED | User: ${userId ?? 'NA'} | LeaveType: ${leavetypeId ?? 'NA'} | LeavePeriod: ${leavePeriod == 1 ? 'Morning' : leavePeriod == 2 ? 'Afternoon' : 'Full Day'
          } | LeaveId: ${leaveId ?? 'NA'} | From: ${fromDate ?? 'NA'} | To: ${toDate ?? 'NA'}`;

        if (leaveLogMessage) {
          logLeave(leaveLogMessage);
        }
      }
      msgArray = {
        result: 'Leave request applied successfully'
      }


      return { success: true, errorFlag, msgArray };
    } else {

      return { success: false, errorFlag, msgArray };
    }


  } catch (error) {
    return {
      success: false,
      errorFlag: 'false',
      msgArray: {
        result: error.message || 'Something went wrong while applying leave'
      }
    };
  }
}

async function calculatePeriod(fromDate, toDate) {
  const start = new Date(fromDate);
  const end = new Date(toDate);
  end.setDate(end.getDate() + 1);

  let dates = [];
  let current = new Date(start);

  while (current < end) {
    dates.push(current.toISOString().split("T")[0]); // only YYYY-MM-DD
    current.setDate(current.getDate() + 1);
  }

  return dates;
}

async function getLeaveBalance(leaveTypeId, userId, year) {
  if (leaveTypeId == 8) {
    return {
      success: true,
      leaveData: {
        totalLeaves: 0,
        usedLeaves: 0,
      }
    };
  }

  const balanceData = await leavebalance(leaveTypeId, userId, year);
  let leaveData = [];
  if (
    Array.isArray(balanceData) &&
    balanceData.length > 0 &&
    balanceData[0] &&
    balanceData[0].number_of_days !== null
  ) {
    leaveData = {
      totalLeaves: balanceData[0].number_of_days ?? 0,
      usedLeaves: balanceData[0].used_leaves ?? 0,
    };
    return { success: true, leaveData };
  }
  else {
    return {
      success: true,
      leaveData: {
        totalLeaves: 0,
        usedLeaves: 0,
      }
    };
  }

}

async function getHolidayAndWeekend(userId) {
  try {
    const userData = await userdata(userId);
    const groupId = userData[0]?.holiday_group;

    const weekends = await getAlteredWeekdays();
    let holidays = [];

    if (groupId) {
      holidays = await holidaydataall(groupId);
    }

    return {
      success: true,
      weekends: weekends.map(w => w.date),
      holidays: holidays.map(h => h.holidaydate),
    };
  } catch (error) {
    return {
      success: false,
      error: error.message,
    };
  }
}



module.exports = { getUserleaves, calculatedays, applyleave, calculatePeriod, getLeaveBalance, getHolidayAndWeekend }