import 'package:dio/dio.dart';
import '../../../../core/services/api_service.dart';
import '../models/holiday_weekend_model.dart';

class HolidayWeekendRemoteDataSource {
  final ApiService apiService;

  HolidayWeekendRemoteDataSource(this.apiService);

  Future<HolidayWeekendModel> getHolidayWeekend(
    int userId,
    int year,
  ) async {
    try {
      final response = await apiService.post(
        '/api/hrms/holidayweekend',
        {
          'userId': userId,
          'year': year,
        },
      );

      print('HolidayWeekend STATUS: ${response.statusCode}');
      print('HolidayWeekend DATA: ${response.data}');

      if (response.statusCode == 200) {
        return HolidayWeekendModel.fromJson(response.data);
      } else {
        throw Exception('Server error ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('HolidayWeekend ERROR: ${e.response?.data}');
      throw Exception(e.message);
    }
  }
}
