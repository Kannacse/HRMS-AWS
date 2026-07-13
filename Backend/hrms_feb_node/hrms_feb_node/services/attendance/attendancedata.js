const express = require('express');
const { getAttendanceData, totalAttendancedetails, weekendWorkData, weekendLeavesData } = require('../../repository/attendance/attendance_data');


async function getempAttendanceData(userId, month, year) {
  let beginDate = await attendanceDate(month, year, 'begin');
  let endDate = await attendanceDate(month, year, 'end');
  let finalAttendance = [];

  const attendanceResult = await getAttendanceData(userId, beginDate, endDate);
  const attendanceCount = await totalAttendancedetails(userId, beginDate, endDate);
  const weekendWorkDays = await weekendWorkData(beginDate, endDate);

  const weekendWorkDaysList = weekendWorkDays.map(item => item.date);

  const weekendLeavescount = await weekendLeavesData(userId, weekendWorkDaysList);


  console.log('attendanceCount: ', attendanceCount);
  console.log('weekendLeavescount: ', weekendLeavescount);

  if (attendanceCount && attendanceCount.length > 0) {
    const summary = { ...attendanceCount[0] };
    // convert string → number and add weekend leaves
    summary.leave_days =
      parseFloat(summary.leave_days || 0) + Number(weekendLeavescount || 0);

    summary.dailyDetails = attendanceResult || [];

    finalAttendance = [summary];
  }

  console.log('finalAttendance:', finalAttendance);

  return { success: true, finalAttendance, weekendWorkDaysList };
}

async function attendanceDate(month, year, type) {
  let pastMonth = '';
  let pastYear = '';
  if (month == 1) {
    pastMonth = 12;
    pastYear = parseInt(year) - 1;
  } else {
    pastMonth = parseInt(month) - 1;
    pastYear = parseInt(year);
  }

  let beginDate = pastYear + '-' + pastMonth + '-' + '29';
  let endDate = year + '-' + month + '-' + '28';

  if (year % 4 !== 0 && month === 3) {
    beginDate = `${year}-${month}-01`;
  }

  if (type == 'begin') {
    return beginDate;
  } else {
    return endDate;
  }

}

module.exports = { getempAttendanceData };