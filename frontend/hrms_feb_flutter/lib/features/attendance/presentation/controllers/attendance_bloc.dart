import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/attendance_event.dart';
import '../controllers/attendance_state.dart';
import '../../domain/repositories/attendance_repository.dart';

class AttendanceBloc extends Bloc<AttendanceEvent,AttendanceState>{
  final AttendanceRepository repository;

  AttendanceBloc(this.repository) :super(AttendanceInitial()){
    on<FetchAttendanceData>((event,emit) async{
      emit(AttendanceLoading());
      try{
        final data = await repository.getAttendanceData(event.userId,event.month,event.year);
        emit(AttendanceLoaded(data));
      }catch(e){
        emit(AttendanceError(e.toString()));
      }
    });
  } 

}