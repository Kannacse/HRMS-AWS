abstract class ApplyLeaveEvent {}

class ApplyLeave extends ApplyLeaveEvent {
  final Map<String, dynamic>? leaveData;
  ApplyLeave(this.leaveData);
}

class FetchLeaveBalance extends ApplyLeaveEvent {
  final int leaveTypeId;
  final int userId;

  FetchLeaveBalance(this.leaveTypeId, this.userId);
}

class ResetLeaveBalance extends ApplyLeaveEvent {}
