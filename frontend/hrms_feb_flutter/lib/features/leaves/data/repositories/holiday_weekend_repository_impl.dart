import 'package:hrms/features/leaves/data/data_sources/holiday_weekend_remote_data_source.dart';
import 'package:hrms/features/leaves/domain/entities/holiday_weekend_data.dart';
import 'package:hrms/features/leaves/domain/repositories/holiday_weekend_repository.dart';

class HolidayWeekendRepositoryImpl
    implements HolidayWeekendRepository {

  final HolidayWeekendRemoteDataSource remote;

  HolidayWeekendRepositoryImpl(this.remote);

  @override
  Future<HolidayWeekendData> getHolidayWeekend(
    int userId,
    int year,
  ) async {
    return await remote.getHolidayWeekend(userId, year);
  }
}
