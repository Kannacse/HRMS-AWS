import '../entities/attendance_data.dart';

abstract class AttendanceRepository {
  Future<AttendanceData> getAttendanceData(userId,month,year);
}