import 'package:hrms/features/attendance/domain/entities/attendance_data.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final AttendanceData data;
  AttendanceLoaded(this.data);
}

class AttendanceError extends AttendanceState {
  final String message;
  AttendanceError(this.message);
}
