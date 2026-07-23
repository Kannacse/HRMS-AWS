import '../../domain/entities/attendance_data.dart';

class AttendanceModel extends AttendanceData {
  AttendanceModel({
    required super.hoursWorked,
    required super.totalLateby,
    required super.totalEarlyby,
    required super.lateDays,
    required super.earlyDays,
    required super.leaveDays,
    required super.lateLeaveDays,
    required super.weekendWorkDaysList,
    required super.dailyDetails,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    final List finalAttendance = json['finalAttendance'] ?? [];
    final List weekendWorkDaysList = json['weekendWorkDaysList'] ?? [];

    if (finalAttendance.isEmpty) {
      return AttendanceModel(
        hoursWorked: 0,
        totalLateby: 0,
        totalEarlyby: 0,
        lateDays: 0,
        earlyDays: 0,
        leaveDays: 0,
        lateLeaveDays: 0.0,
        weekendWorkDaysList: [],
        dailyDetails: [],
      );
    }

    final data = finalAttendance.first;

    return AttendanceModel(
      hoursWorked:
          double.tryParse(data['hours_worked']?.toString() ?? '0') ?? 0.0,

      totalLateby: int.tryParse(data['total_lateby']?.toString() ?? '0') ?? 0,

      totalEarlyby: int.tryParse(data['total_earlyby']?.toString() ?? '0') ?? 0,

      lateDays: double.tryParse(data['late_days']?.toString() ?? '0') ?? 0,

      earlyDays: double.tryParse(data['early_days']?.toString() ?? '0') ?? 0.0,

      leaveDays: double.tryParse(data['leave_days']?.toString() ?? '0') ?? 0.0,

      lateLeaveDays:
          double.tryParse(data['late_leave_days']?.toString() ?? '0') ?? 0,

      weekendWorkDaysList: List<String>.from(weekendWorkDaysList),

      dailyDetails:
          (data['dailyDetails'] as List<dynamic>?)
              ?.map((e) => DailyDetail.fromJson(e))
              .toList() ??
          [],
    );
  }
}
