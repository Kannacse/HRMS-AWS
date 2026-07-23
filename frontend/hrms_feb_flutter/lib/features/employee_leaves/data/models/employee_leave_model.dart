class EmployeeLeaveModel {
  final int id;
  final String employeeId;
  final String name;
  final String status;
  final String leaveType;
  final double noOfDays;
  final String? fromDate;
  final String? toDate;
  final String? appliedOn;
  final String reportingManagerName;
  final int? leavetypeid;
  final int? repMangId;
  final int? leavePeriod;
  final int? leaveDay;
  final int appliedLeavescount;
  final String comments;

  EmployeeLeaveModel({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.status,
    required this.leaveType,
    required this.noOfDays,
    required this.fromDate,
    required this.toDate,
    required this.appliedOn,
    required this.reportingManagerName,
    this.leavetypeid,
    this.repMangId,
    this.leavePeriod,
    this.leaveDay,
    required this.appliedLeavescount,
    required this.comments,
  });

  factory EmployeeLeaveModel.fromJson(Map<String, dynamic> json) {
    return EmployeeLeaveModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      employeeId: json['employeeId']?.toString() ?? "",
      name: json['name']?.toString() ?? "",
      status: json['status']?.toString() ?? "",
      leaveType: json['leaveType']?.toString() ?? "",
      noOfDays: json['noOfDays'] is double
          ? json['noOfDays']
          : double.tryParse(json['noOfDays']?.toString() ?? '0') ?? 0,
      fromDate: json['from_date']?.toString(),
      toDate: json['to_date']?.toString(),
      appliedOn: json['appliedOn']?.toString(),
      reportingManagerName: json['reportingManagerName']?.toString() ?? "",
      leavetypeid: json['leavetypeid'] is int
          ? json['leavetypeid']
          : int.tryParse(json['leavetypeid']?.toString() ?? ""),
      repMangId: json['rep_mang_id'] is int
          ? json['rep_mang_id']
          : int.tryParse(json['rep_mang_id']?.toString() ?? ""),
      leavePeriod: json['leavePeriod'] is int
          ? json['leavePeriod']
          : int.tryParse(json['leavePeriod']?.toString() ?? ""),
      leaveDay: json['leaveDay'] is int
          ? json['leaveDay']
          : int.tryParse(json['leaveDay']?.toString() ?? ""),
      appliedLeavescount: json['appliedLeavescount'] is int
          ? json['appliedLeavescount']
          : int.tryParse(json['appliedLeavescount']?.toString() ?? '0') ?? 0,
      comments: json['comments']?.toString() ?? "",
    );
  }
}
