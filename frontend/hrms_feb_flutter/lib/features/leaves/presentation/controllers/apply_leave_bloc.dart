import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/apply_leave_event.dart';
import '../controllers/apply_leave_state.dart';
import '../../domain/repositories/leave_repository.dart';

class ApplyLeaveBloc extends Bloc<ApplyLeaveEvent, ApplyLeaveState> {
  final LeaveRepository repository;

  ApplyLeaveBloc(this.repository) : super(ApplyLeaveInitial()) {
    on<ApplyLeave>(_onApplyLeave);
    on<FetchLeaveBalance>(_onFetchLeaveBalance);

    on<ResetLeaveBalance>((event, emit) {
      emit(ApplyLeaveInitial(usedLeaves: 0.0, totalLeaves: 0));
    });
  }

  void _onApplyLeave(ApplyLeave event, Emitter<ApplyLeaveState> emit) async {
    emit(
      ApplyLeaveLoading(
        totalLeaves: state.totalLeaves,
        usedLeaves: state.usedLeaves,
      ),
    );

    try {
      final data = await repository.applyEmpleave(event.leaveData);

      emit(
        ApplyLeaveLoaded(
          data.successMsg,
          data.success,
          totalLeaves: state.totalLeaves,
          usedLeaves: state.usedLeaves,
        ),
      );
    } catch (e) {
      emit(
        ApplyLeaveError(
          e.toString(),
          totalLeaves: state.totalLeaves,
          usedLeaves: state.usedLeaves,
        ),
      );
    }
  }

  void _onFetchLeaveBalance(
    FetchLeaveBalance event,
    Emitter<ApplyLeaveState> emit,
  ) async {
    emit(
      ApplyLeaveLoading(
        totalLeaves: state.totalLeaves,
        usedLeaves: state.usedLeaves,
      ),
    );

    try {
      final result = await repository.fetchLeaveBalance(
        event.leaveTypeId,
        event.userId,
      );

      emit(
        state.copyWith(
          totalLeaves: result.totalLeaves,
          usedLeaves: result.usedLeaves,
        ),
      );
    } catch (e) {
      debugPrint("❌ FetchLeaveBalance error: $e");

      emit(
        ApplyLeaveError(
          e.toString(),
          totalLeaves: state.totalLeaves,
          usedLeaves: state.usedLeaves,
        ),
      );
    }
  }
}
