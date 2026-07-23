import '../../../../core/services/api_service.dart';
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSource(this.apiService);

  Future<UserModel> login(String email, String password) async {
  final response = await apiService.post(
    '/api/hrms/login',
    {
      'username': email,
      'password': password,
    },
  );

  final Map<String, dynamic> data = response.data;

  final userJson = Map<String, dynamic>.from(data['user']);
  final accessToken = data['accessToken'];
  final refreshToken = data['refreshToken'];

  if (accessToken == null || refreshToken == null) {
    throw Exception('Tokens missing in response');
  }

  return UserModel.fromJson({
    'user': userJson,
    'token': accessToken,
    'refreshtoken': refreshToken,
  });
}

}
