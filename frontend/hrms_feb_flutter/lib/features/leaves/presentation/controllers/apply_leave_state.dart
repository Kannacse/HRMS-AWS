abstract class ApplyLeaveState {
  final double totalLeaves;
  final double usedLeaves;

  const ApplyLeaveState({
    this.totalLeaves = 0,
    this.usedLeaves = 0,
  });

  ApplyLeaveState copyWith({
    double? totalLeaves,
    double? usedLeaves,
  });
}

class ApplyLeaveInitial extends ApplyLeaveState {
  const ApplyLeaveInitial({
    double totalLeaves = 0,
    double usedLeaves = 0,
  }) : super(totalLeaves: totalLeaves, usedLeaves: usedLeaves);

  @override
  ApplyLeaveState copyWith({
    double? totalLeaves,
    double? usedLeaves,
  }) {
    return ApplyLeaveInitial(
      totalLeaves: totalLeaves ?? this.totalLeaves,
      usedLeaves: usedLeaves ?? this.usedLeaves,
    );
  }
}

class ApplyLeaveLoading extends ApplyLeaveState {
  const ApplyLeaveLoading({
    required double totalLeaves,
    required double usedLeaves,
  }) : super(totalLeaves: totalLeaves, usedLeaves: usedLeaves);

  @override
  ApplyLeaveState copyWith({
    double? totalLeaves,
    double? usedLeaves,
  }) {
    return ApplyLeaveLoading(
      totalLeaves: totalLeaves ?? this.totalLeaves,
      usedLeaves: usedLeaves ?? this.usedLeaves,
    );
  }
}

class ApplyLeaveLoaded extends ApplyLeaveState {
  final bool success;
  final String successMsg;

  const ApplyLeaveLoaded(
    this.successMsg,
    this.success, {
    required double totalLeaves,
    required double usedLeaves,
  }) : super(totalLeaves: totalLeaves, usedLeaves: usedLeaves);

  @override
  ApplyLeaveState copyWith({
    double? totalLeaves,
    double? usedLeaves,
  }) {
    return ApplyLeaveLoaded(
      successMsg,
      success,
      totalLeaves: totalLeaves ?? this.totalLeaves,
      usedLeaves: usedLeaves ?? this.usedLeaves,
    );
  }
}

class ApplyLeaveError extends ApplyLeaveState {
  final String message;

  const ApplyLeaveError(
    this.message, {
    required double totalLeaves,
    required double usedLeaves,
  }) : super(totalLeaves: totalLeaves, usedLeaves: usedLeaves);

  @override
  ApplyLeaveState copyWith({
    double? totalLeaves,
    double? usedLeaves,
  }) {
    return ApplyLeaveError(
      message,
      totalLeaves: totalLeaves ?? this.totalLeaves,
      usedLeaves: usedLeaves ?? this.usedLeaves,
    );
  }
}
