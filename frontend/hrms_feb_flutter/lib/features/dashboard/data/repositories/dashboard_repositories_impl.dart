import '../../domain/repositories/dashboard_repository.dart';
import '../data_sources/dashboard_remote_data_source.dart';
import '../../domain/entities/dashboard_data.dart';

class DashboardRepositoriesImpl implements DashboardRepository{
  final DashboardRemoteDataSource dashboardRemoteDataSource;

  DashboardRepositoriesImpl(this.dashboardRemoteDataSource);

  @override
  Future<DashboardData> getDashboardData(int userId) async{
    return await dashboardRemoteDataSource.getDashboardData(userId);
  }

  
}