abstract class HolidayWeekendEvent {}

class FetchHolidayWeekend extends HolidayWeekendEvent {
  final int userId;
  final int year;

  FetchHolidayWeekend(this.userId, this.year);
}
