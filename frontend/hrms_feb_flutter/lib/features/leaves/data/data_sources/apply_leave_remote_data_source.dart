import '../../../../core/services/api_service.dart';
import 'package:dio/dio.dart';
import '../models/apply_leave_model.dart';
import '../models/leave_balance_model.dart';

class ApplyLeaveRemoteDataSource {
  final ApiService apiService;

  ApplyLeaveRemoteDataSource(this.apiService);

  // Apply leave
  Future<ApplyLeaveModel> applyLeave(leaveData) async {
    try {
      final response = await apiService.post('/api/hrms/applyleave', leaveData);
      
      print("Status Code: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        return ApplyLeaveModel.fromJson(response.data);
      } else {
        throw Exception('Server Error : ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 400) {
          return ApplyLeaveModel.fromJson(e.response?.data);
        } else {
          throw Exception('Sever Error : ${e.response?.statusCode}');
        }
      } else {
        print(e.message);
        throw Exception('Network Error: ${e.message} ');
      }
    }
  }

  // Get leave balance

  Future<LeaveBalanceModel> leaveBalance(leaveTypeId, userId) async {
    try {
      final response = await apiService.post('/api/hrms/getleavebalance', {
        'leaveTypeId': leaveTypeId,
        'userId': userId,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        return LeaveBalanceModel.fromJson(response.data);
      } else {
        throw Exception('Server Error : ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 400) {
          return LeaveBalanceModel.fromJson(e.response?.data);
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
