class AttendanceData {
  final double hoursWorked;
  final int totalLateby;
  final int totalEarlyby;
  final double lateDays;
  final double earlyDays;
  final double leaveDays;
  final double lateLeaveDays;
  final List<String> weekendWorkDaysList;
  final List<DailyDetail> dailyDetails;

  AttendanceData({
    required this.hoursWorked,
    required this.totalLateby,
    required this.totalEarlyby,
    required this.lateDays,
    required this.earlyDays,
    required this.leaveDays,
    required this.lateLeaveDays,
    required this.weekendWorkDaysList,
    required this.dailyDetails,
  });
}

class DailyDetail {
  final int userId;
  final String employeeId;
  final String date;
  final int month;
  final int year;
  final String day;
  final String checkIn;
  final String checkOut;
  final String workedHours;
  final String status;
  final String lateBy;
  final String earlyBy;

  DailyDetail({
    required this.userId,
    required this.employeeId,
    required this.date,
    required this.month,
    required this.year,
    required this.day,
    required this.checkIn,
    required this.checkOut,
    required this.workedHours,
    required this.status,
    required this.lateBy,
    required this.earlyBy,
  });

  factory DailyDetail.fromJson(Map<String, dynamic> json) {
    return DailyDetail(
      userId: int.tryParse(json['user_id']?.toString() ?? '0') ?? 0,
      employeeId: json['employeeId']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      month: int.tryParse(json['month']?.toString() ?? '0') ?? 0,
      year: int.tryParse(json['year']?.toString() ?? '0') ?? 0,
      day: json['day']?.toString() ?? '',
      checkIn: json['check_in']?.toString() ?? '0.00',
      checkOut: json['check_out']?.toString() ?? '0.00',
      workedHours: json['worked_hours']?.toString() ?? '0.00',
      status: json['status']?.toString() ?? '',
      lateBy: json['lateby']?.toString() ?? '0',
      earlyBy: json['earlyby']?.toString() ?? '0',
    );
  }
}
