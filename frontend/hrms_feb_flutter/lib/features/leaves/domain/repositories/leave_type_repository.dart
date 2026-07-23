import '../entities/leave_type_data.dart';

abstract class LeaveTypeRepository {
  Future<LeaveTypeData> getLeaveType(userId);
}