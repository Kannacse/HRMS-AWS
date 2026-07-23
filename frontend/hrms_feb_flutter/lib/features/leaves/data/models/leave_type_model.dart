import 'package:hrms/features/leaves/domain/entities/leave_type_data.dart';

class LeaveTypeModel extends LeaveTypeData {
  LeaveTypeModel({
    required Map<int, String> leaveTypeData,
  }) : super(leaveTypeData);

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) {
    // 1. Drill down to the inner 'leaveTypes' list
    final List<dynamic> rawLeaveList = json['leaveTypes']['leaveTypes'] as List<dynamic>;

    final Map<int, String> leaveTypeMap = {};

    // 2. Iterate through the list to build the required Map<int, String>
    for (var leaveItem in rawLeaveList) {
      if (leaveItem is Map<String, dynamic>) {
        final leaveId = leaveItem['leaveid'];
        final leaveType = leaveItem['leavetype'];
        
        // Only add if both values are not null
        if (leaveId != null && leaveType != null) {
          leaveTypeMap[leaveId as int] = leaveType as String;
        }
      }
    }

    return LeaveTypeModel(
      leaveTypeData: leaveTypeMap,
    );
  }
}