import '../entities/apply_leave_data.dart';

abstract class LeaveRepository {
  Future<ApplyLeaveData> applyEmpleave(leaveData);
  Future<LeaveBalanceData> fetchLeaveBalance(int leaveTypeId, int userId);
}