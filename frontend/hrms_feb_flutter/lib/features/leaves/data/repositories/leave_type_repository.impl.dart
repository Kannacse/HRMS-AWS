import '../../domain/entities/leave_type_data.dart';
import '../../domain/repositories/leave_type_repository.dart';
import '../data_sources/leave_type_remote_data_source.dart';

class LeaveTypeRepositoryImpl implements LeaveTypeRepository {
  final LeaveTypeRemoteDataSource leaveTypeRemoteDataSource;

    LeaveTypeRepositoryImpl(this.leaveTypeRemoteDataSource);


  @override
  Future<LeaveTypeData> getLeaveType(userId) async{
    return await leaveTypeRemoteDataSource.getleaveTypes(userId);
  }
}