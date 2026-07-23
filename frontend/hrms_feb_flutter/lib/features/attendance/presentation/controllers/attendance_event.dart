abstract class AttendanceEvent {}

class FetchAttendanceData extends AttendanceEvent{
  final int userId;
  final int month;
  final int year;

  FetchAttendanceData(this.userId,this.month,this.year);
}