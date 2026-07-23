class Leaves {
  final double? empLeaveLimit;
  final double? usedLeaves;

  Leaves({this.empLeaveLimit, this.usedLeaves});

  factory Leaves.fromJson(Map<String, dynamic> json) {
    return Leaves(
      empLeaveLimit: (json['emp_leave_limit'] as num?)?.toDouble(),
      usedLeaves: (json['used_leaves'] as num?)?.toDouble(),
    );
  }
}

class Holiday {
  final String? holidayname;
  final String? holidaydate;

  Holiday({this.holidaydate, this.holidayname});

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      holidayname: json['holidayname'],
      holidaydate: json['holidaydate'],
    );
  }
}

class TeamLeaves {
  final String? employeeName;
  final String? fromDate;
  final String? toDate;
  final int? leaveday;
  final int? leavePeriod;
  final int? prefixId;

  TeamLeaves({this.employeeName, this.fromDate, this.toDate, this.leaveday, this.leavePeriod, this.prefixId});

  factory TeamLeaves.fromJson(Map<String, dynamic> json) {
    return TeamLeaves(
      employeeName: json['employeename'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
      leaveday: json['leaveday'],
      leavePeriod: json['leave_period'],
      prefixId: json['prefix_id'],
    );
  }
}

class DashboardData {
  final Leaves? leaves;
  final List<Holiday>? holidays;
  final List<TeamLeaves>? teamLeaves;
  final String? userFullName;

  DashboardData({this.leaves, this.holidays, this.teamLeaves, this.userFullName});
}