part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

class FetchDashboardData extends DashboardEvent {
  final int userId;

  FetchDashboardData(this.userId);
}
