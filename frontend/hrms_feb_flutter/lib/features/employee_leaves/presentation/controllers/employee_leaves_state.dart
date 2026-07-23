import 'package:hrms/features/employee_leaves/data/models/employee_leave_model.dart';

abstract class EmployeeLeavesState {}

class EmployeeLeavesInitial extends EmployeeLeavesState {}

class EmployeeLeavesLoading extends EmployeeLeavesState {}

class EmployeeLeavesLoaded extends EmployeeLeavesState {
  final List<EmployeeLeaveModel> leavesData;

  EmployeeLeavesLoaded(this.leavesData);
}

class EmployeeLeavesError extends EmployeeLeavesState {
  final String message;
  EmployeeLeavesError(this.message);
}