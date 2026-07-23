import 'package:hrms/features/employee_leaves/data/models/employee_leave_model.dart';

abstract class EmployeeLeavesEvent {}

class FetchEmployeeLeavesData extends EmployeeLeavesEvent {
  final int userId;
  final int emprole;
  final int month;
  final int year;

  FetchEmployeeLeavesData(this.userId, this.emprole, this.month, this.year);
}

class LeaveActionEvent extends EmployeeLeavesEvent {
  final String action;
  final int userId;
  final int emprole;
  final EmployeeLeaveModel leave;
  final int month;
  final int year;
  final String? approverComments;

  LeaveActionEvent({
    required this.action,
    required this.userId,
    required this.emprole,
    required this.leave,
    required this.month,
    required this.year,
    this.approverComments,
  });
}
