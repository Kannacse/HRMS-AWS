import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/features/leaves/domain/repositories/holiday_weekend_repository.dart';
import 'package:hrms/features/leaves/presentation/controllers/holiday_weekend_event.dart';
import 'package:hrms/features/leaves/presentation/controllers/holiday_weekend_state.dart';

class HolidayWeekendBloc
    extends Bloc<HolidayWeekendEvent, HolidayWeekendState> {

  final HolidayWeekendRepository repository;

  HolidayWeekendBloc(this.repository)
      : super(HolidayWeekendInitial()) {
    print("🚀 HolidayWeekendBloc CREATED");


    on<FetchHolidayWeekend>((event, emit) async {
      emit(HolidayWeekendLoading());

      try {
        final data = await repository.getHolidayWeekend(
          event.userId,
          event.year,
        );

        // debugPrint("✅ Holidays: ${data.holidays}");
        // debugPrint("✅ Weekends: ${data.weekends}");

        emit(
          HolidayWeekendLoaded(
            holidays: data.holidays,
            weekends: data.weekends,
          ),
        );
      } catch (e) {
        debugPrint("❌ HolidayWeekend error: $e");
        emit(HolidayWeekendError(e.toString()));
      }
    });
  }
}
