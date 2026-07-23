import 'package:dio/dio.dart';

import '../config/app_config.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response> post(
    String path,
    dynamic data,
  ) {
    return _dio.post(
      path,
      data: data,
    );
  }

  Future<Response> put(
    String path,
    dynamic data,
  ) {
    return _dio.put(
      path,
      data: data,
    );
  }

  Future<Response> delete(String path) {
    return _dio.delete(path);
  }

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }
}
