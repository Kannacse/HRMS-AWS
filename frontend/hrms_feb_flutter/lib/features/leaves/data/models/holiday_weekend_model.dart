import '../../domain/entities/holiday_weekend_data.dart';

class HolidayWeekendModel extends HolidayWeekendData {
  HolidayWeekendModel({
    required List<String> weekends,
    required List<String> holidays,
  }) : super(weekends: weekends, holidays: holidays);

  factory HolidayWeekendModel.fromJson(Map<String, dynamic> json) {
    return HolidayWeekendModel(
      weekends: List<String>.from(json['weekends'] ?? []),
      holidays: List<String>.from(json['holidays'] ?? []),
    );
  }
}
