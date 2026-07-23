import 'package:hrms/features/employee_leaves/data/models/employee_leave_model.dart';

abstract class EmployeeLeavesRepositories {
  Future<List<EmployeeLeaveModel>> getEmployeeLeavesData(
    int userId,
    int emprole,
    int month,
    int year,
  );

  Future<void> updateLeaveStatus({
    required String action,
    required int userId,
    required int id,
    required int leaveTypeId,
    required int? leaveDay,
    required double noOfDays,
    String? approverComments,
  });
}
