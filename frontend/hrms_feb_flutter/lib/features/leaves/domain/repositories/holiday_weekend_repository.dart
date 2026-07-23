import 'package:hrms/features/leaves/domain/entities/holiday_weekend_data.dart';

abstract class HolidayWeekendRepository {
  Future<HolidayWeekendData> getHolidayWeekend(
    int userId,
    int year,
  );
}
