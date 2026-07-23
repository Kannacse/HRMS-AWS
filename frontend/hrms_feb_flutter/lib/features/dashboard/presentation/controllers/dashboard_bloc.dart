import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository repository;

  DashboardBloc(this.repository) : super(DashboardInitial()) {
    on<FetchDashboardData>((event, emit) async {
      print("======================================");
      print("Dashboard Bloc Started");
      print("Fetching Dashboard for User:");
      print(event.userId);

      emit(DashboardLoading());

      try {
        final dashboard = await repository.getDashboardData(event.userId);

        print("Dashboard Loaded Successfully");

        emit(DashboardLoaded(dashboard));
      } catch (e, stackTrace) {
        print("Dashboard Exception");
        print(e);

        print("StackTrace");
        print(stackTrace);

        emit(DashboardError(e.toString()));
      }
    });
  }
}
