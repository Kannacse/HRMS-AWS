import 'package:hrms/core/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/leave_type_model.dart';

class LeaveTypeRemoteDataSource {
  final ApiService apiService;

  LeaveTypeRemoteDataSource(this.apiService);

  Future<LeaveTypeModel> getleaveTypes(userId) async {
    try {
      final response = await apiService.post('/api/hrms/leavetypes', {
        'userId': userId,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        return LeaveTypeModel.fromJson(response.data);
      } else {
        throw Exception('Server Error : ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 400) {
          return LeaveTypeModel.fromJson(e.response?.data);
        } else {
          throw Exception('Sever Error : ${e.response?.statusCode}');
        }
      } else {
        print(e.message);
        throw Exception('Network Error: ${e.message} ');
      }
    }
  }
}
