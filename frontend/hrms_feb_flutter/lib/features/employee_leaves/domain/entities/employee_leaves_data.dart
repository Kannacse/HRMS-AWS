class EmployeeLeavesData {
  final int id;
  final String employeeName;
  final String employeeId;
  final String leaveType;
  final String fromDate;
  final String toDate;
  final String appliedOn;
  final String totalDays;
  final String reportingManager;
  final String status;

  EmployeeLeavesData({
    required this.id,
    required this.employeeName,
    required this.employeeId,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.appliedOn,
    required this.totalDays,
    required this.reportingManager,
    required this.status,
  });
}