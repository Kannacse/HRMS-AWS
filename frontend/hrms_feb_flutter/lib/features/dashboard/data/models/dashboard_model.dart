import '../../domain/entities/dashboard_data.dart';

class DashboardModel extends DashboardData {
  DashboardModel({
    required Leaves leaves,
    required List<Holiday> holidays,
    required List<TeamLeaves> teamLeaves,
    required String? userFullName,
  }) : super(
         leaves: leaves,
         holidays: holidays,
         teamLeaves: teamLeaves,
         userFullName: userFullName,
       );

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    final userData =
        json['user_data'] as Map<String, dynamic>; // extract user_data

    return DashboardModel(
      leaves:
          (userData['leaves'] != null &&
              userData['leaves'] is List &&
              userData['leaves'].isNotEmpty)
          ? Leaves.fromJson(userData['leaves'][0])
          : Leaves(empLeaveLimit: 0, usedLeaves: 0),
      holidays: (userData['holiday'] as List)
          .map((e) => Holiday.fromJson(e))
          .toList(),
      teamLeaves: (userData['teamLeaves'] as List)
          .map((e) => TeamLeaves.fromJson(e))
          .toList(),
      userFullName: userData['userFullName'],
    );
  }
}
