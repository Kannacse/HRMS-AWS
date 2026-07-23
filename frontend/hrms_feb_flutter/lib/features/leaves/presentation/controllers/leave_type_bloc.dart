import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/leave_type_event.dart';
import '../controllers/leave_type_state.dart';
import '../../domain/repositories/leave_type_repository.dart';

class LeaveTypeBloc extends Bloc<LeaveTypeEvent,LeaveTypeState>{
  final LeaveTypeRepository repository;

  LeaveTypeBloc(this.repository) : super(LeaveTypeInitial()) {
    on<FetchLeaveTypes>((event, emit) async{
      emit(LeaveTypeLoading());
      try{
        final data = await repository.getLeaveType(event.userId);
        emit(LeaveTypeLoaded(data.leaveTypeData));
      }catch(e){
        emit(LeaveTypeError(e.toString()));
      }
    },);
  }
}

