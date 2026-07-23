import '../../data/data_sources/attendance_remote_data_source.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../../domain/entities/attendance_data.dart';

class AttendanceRepositoriesImpl implements AttendanceRepository{
  final AttendanceRemoteDataSource dataSource;

  AttendanceRepositoriesImpl(this.dataSource);

  @override
  Future<AttendanceData> getAttendanceData(userId,month,year) async{ 
    return await dataSource.getAttendanceData(userId,month,year);
  }
}