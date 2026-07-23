abstract class LeaveTypeState {}

class LeaveTypeInitial extends LeaveTypeState {}

class LeaveTypeLoading extends LeaveTypeState {}

class LeaveTypeLoaded extends LeaveTypeState {
  final Map<int, String> leaveTypes;
  LeaveTypeLoaded(this.leaveTypes);
}

class LeaveTypeError extends LeaveTypeState {
  final String message;
  LeaveTypeError(this.message);
}
