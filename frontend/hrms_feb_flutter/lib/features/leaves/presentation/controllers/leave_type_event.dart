abstract class LeaveTypeEvent {}

class FetchLeaveTypes extends LeaveTypeEvent{
  final int userId;

  FetchLeaveTypes(this.userId);

}