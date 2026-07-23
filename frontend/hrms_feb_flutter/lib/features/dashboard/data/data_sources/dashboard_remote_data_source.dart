import 'package:dio/dio.dart';

import '../../../../core/services/api_service.dart';
import '../models/dashboard_model.dart';

class DashboardRemoteDataSource {
  final ApiService apiService;

  DashboardRemoteDataSource(this.apiService);

  Future<DashboardModel> getDashboardData(int userId) async {
    try {
      print("======================================");
      print("Dashboard API Request Started");
      print("User ID : $userId");

      final response = await apiService.post(
        '/api/hrms/getempdata',
        {
          'userId': userId,
        },
      );

      print("Dashboard API Response Status:");
      print(response.statusCode);

      print("Dashboard API Response:");
      print(response.data);

      if (response.statusCode == 200) {
        return DashboardModel.fromJson(response.data);
      } else {
        throw Exception(
          "Dashboard API Failed : ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      print("Dio Exception");
      print(e);

      if (e.response != null) {
        print("Status Code:");
        print(e.response?.statusCode);

        print("Response:");
        print(e.response?.data);
      }

      rethrow;
    } catch (e) {
      print("Unknown Exception");
      print(e);
      rethrow;
    }
  }
}
