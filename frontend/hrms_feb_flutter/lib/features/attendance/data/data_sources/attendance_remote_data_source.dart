import '../models/attendance_model.dart';
import '../../../../core/services/api_service.dart';
import 'package:dio/dio.dart';


class AttendanceRemoteDataSource {
  final ApiService apiService;
AttendanceRemoteDataSource(this.apiService);


  Future<AttendanceModel> getAttendanceData(userId,month,year) async{
    try{
      final response = await apiService.post('/api/hrms/attendancedata', {
        'userId' : userId,
        'month' : month,
        'year' : year
      });
      if(response.statusCode == 200){
        return AttendanceModel.fromJson(response.data);
      }else{
        throw Exception('Server Error: ${response.statusCode}');
      }
    }on DioException catch(e){
      if(e.response != null){
        throw Exception('Sever Error: ${e.response?.statusCode}');
      }else{
        print(e.message);
        throw Exception('Network Error: ${e.message} ');
      }
    }
  }
}