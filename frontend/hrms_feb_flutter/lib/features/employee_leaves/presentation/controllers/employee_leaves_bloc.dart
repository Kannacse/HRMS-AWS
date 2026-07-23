import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/features/employee_leaves/domain/repositories/employee_leaves_repositories.dart';
import '../controllers/employee_leaves_event.dart';
import '../controllers/employee_leaves_state.dart';

class EmployeeLeavesBloc
    extends Bloc<EmployeeLeavesEvent, EmployeeLeavesState> {
  final EmployeeLeavesRepositories repository;

  EmployeeLeavesBloc(this.repository) : super(EmployeeLeavesInitial()) {
    on<FetchEmployeeLeavesData>(_onFetchLeaves);
    on<LeaveActionEvent>(_onLeaveAction);
  }

  Future<void> _onFetchLeaves(
    FetchEmployeeLeavesData event,
    Emitter<EmployeeLeavesState> emit,
  ) async {
    emit(EmployeeLeavesLoading());

    try {
      final leaves = await repository.getEmployeeLeavesData(
        event.userId,
        event.emprole,
        event.month,
        event.year,
      );

      emit(EmployeeLeavesLoaded(leaves));
    } catch (e) {
      emit(EmployeeLeavesError(e.toString()));
    }
  }

  Future<void> _onLeaveAction(
    LeaveActionEvent event,
    Emitter<EmployeeLeavesState> emit,
  ) async {
    emit(EmployeeLeavesLoading());

    try {
      await repository.updateLeaveStatus(
        action: event.action,
        userId: event.userId,
        id: event.leave.id,
        leaveTypeId: event.leave.leavetypeid!,
        leaveDay: event.leave.leaveDay,
        noOfDays: event.leave.noOfDays,
        approverComments: event.approverComments,
      );

      add(
        FetchEmployeeLeavesData(
          event.userId,
          event.emprole,
          event.month,
          event.year,
        ),
      );
    } catch (e) {
      emit(EmployeeLeavesError(e.toString()));
    }
  }
}
