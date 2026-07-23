abstract class HolidayWeekendState {}

class HolidayWeekendInitial extends HolidayWeekendState {}

class HolidayWeekendLoading extends HolidayWeekendState {}

class HolidayWeekendLoaded extends HolidayWeekendState {
  final List<String> holidays;
  final List<String> weekends;

  HolidayWeekendLoaded({
    required this.holidays,
    required this.weekends,
  });
}


class HolidayWeekendError extends HolidayWeekendState {
  final String message;
  HolidayWeekendError(this.message);
}
