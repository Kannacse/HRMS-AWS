import 'package:dio/dio.dart';
import 'api_service.dart';

class ActivityLoggerRemoteDataSource {
  final ApiService apiService;

  ActivityLoggerRemoteDataSource(this.apiService);

  Future<void> logActivity({
    required int userId,
    required String page,
    required String action,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      await apiService.post('/api/hrms/activity/log', {
        'userId': userId,
        'page': page,
        'action': action,
        'metadata': metadata,
      });
    } on DioException {
      //  logging must NEVER break UI
    }
  }
}
