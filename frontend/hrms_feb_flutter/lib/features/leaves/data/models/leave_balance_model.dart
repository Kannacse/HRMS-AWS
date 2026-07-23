import 'package:hrms/features/leaves/domain/entities/apply_leave_data.dart';

class LeaveBalanceModel extends LeaveBalanceData {
  LeaveBalanceModel({
    required double totalLeaves,
    required double usedLeaves,
  }) : super(totalLeaves, usedLeaves);

  factory LeaveBalanceModel.fromJson(Map<String, dynamic> json) {
    final leaveData = json['leaveData'] as Map<String, dynamic>?;

    if (leaveData == null) {
      return LeaveBalanceModel(
        totalLeaves: 0.0,
        usedLeaves: 0.0,
      );
    }

    return LeaveBalanceModel(
      totalLeaves: (leaveData['totalLeaves'] as num?)?.toDouble() ?? 0.0,
      usedLeaves: (leaveData['usedLeaves'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
