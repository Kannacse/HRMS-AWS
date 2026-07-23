import 'dart:convert';
import '../models/employee_leave_model.dart';
import '../../../../core/services/api_service.dart';
import 'package:dio/dio.dart';

class EmployeeLeavesDataSource {
  final ApiService apiService;

  EmployeeLeavesDataSource(this.apiService);

  Future<List<EmployeeLeaveModel>> getEmployeeLeavesData(
    int userId,
    int emprole,
    int month,
    int year,
  ) async {
    try {
      final response = await apiService.post('/api/hrms/employeeleaves', {
        'userId': userId,
        'emprole': emprole,
        'month': month,
        'year': year,
      });

      Map<String, dynamic> data;

      if (response.data is String) {
        data = jsonDecode(response.data);
      } else if (response.data is Map<String, dynamic>) {
        data = Map<String, dynamic>.from(response.data);
      } else {
        throw Exception(
          'Unexpected response type: ${response.data.runtimeType}',
        );
      }

      final List<dynamic> leavesList = data['leaves'] ?? [];

      // Filter out nulls and ensure each element is a Map
      final List<EmployeeLeaveModel> leaves = leavesList
          .where((e) => e != null)
          .map(
            (e) => EmployeeLeaveModel.fromJson(
              Map<String, dynamic>.from(e as Map<String, dynamic>),
            ),
          )
          .toList();

      return leaves;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Server Error: ${e.response?.statusCode}');
      } else {
        print(e.message);
        throw Exception('Network Error: ${e.message}');
      }
    }
  }

  Future<void> updateLeaveStatus({
    required String action,
    required int userId,
    required int id,
    required int leaveTypeId,
    required int? leaveDay,
    required double noOfDays,
    String? approverComments,
  }) async {
    try {
      final payload = {
        'action': action,
        'userId': userId,
        'id': id,
        'leaveTypeId': leaveTypeId,
        'leaveDay': leaveDay,
        'no_of_days': noOfDays,
      };
      if (approverComments != null && approverComments.isNotEmpty) {
        payload['approverComments'] = approverComments;
      }
      await apiService.post('/api/hrms/employeeleaves/updatestatus', payload);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
