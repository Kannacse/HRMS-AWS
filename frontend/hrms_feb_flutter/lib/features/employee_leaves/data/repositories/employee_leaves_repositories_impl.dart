import 'package:hrms/features/employee_leaves/data/models/employee_leave_model.dart';
import '../data_sources/employee_leaves_data_source.dart';
import '../../domain/repositories/employee_leaves_repositories.dart';

class EmployeeLeavesRepositoriesImpl implements EmployeeLeavesRepositories {
  final EmployeeLeavesDataSource dataSource;

  EmployeeLeavesRepositoriesImpl(this.dataSource);

  @override
  Future<List<EmployeeLeaveModel>> getEmployeeLeavesData(
    int userId,
    int emprole,
    int month,
    int year,
  ) async {
    return await dataSource.getEmployeeLeavesData(userId, emprole, month, year);
  }

  @override
  Future<void> updateLeaveStatus({
    required String action,
    required int userId,
    required int id,
    required int leaveTypeId,
    required int? leaveDay,
    required double noOfDays,
    String? approverComments,
  }) async {
    return await dataSource.updateLeaveStatus(
      action: action,
      userId: userId,
      id: id,
      leaveTypeId: leaveTypeId,
      leaveDay: leaveDay,
      noOfDays: noOfDays,
      approverComments: approverComments,
    );
  }
}
