import '../../domain/repositories/leave_repository.dart';
import '../data_sources/apply_leave_remote_data_source.dart';
import '../../domain/entities/apply_leave_data.dart';

class LeaveRepositoryImpl implements LeaveRepository{
  final ApplyLeaveRemoteDataSource applyLeaveRemoteDataSource;

  LeaveRepositoryImpl(this.applyLeaveRemoteDataSource);

  @override
  Future<ApplyLeaveData> applyEmpleave(leaveData) async{
    return await  applyLeaveRemoteDataSource.applyLeave(leaveData);
  }

  @override
  Future<LeaveBalanceData> fetchLeaveBalance(int leaveTypeId, int userId) async{
    return await applyLeaveRemoteDataSource.leaveBalance(leaveTypeId,userId);
  }
}