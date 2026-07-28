import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';
import '../../data/data_sources/auth_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final ApiService apiService;

  LoginCubit(this.loginUser, this.apiService)
      : super(LoginInitial());

  Future<void> login(String email, String password) async {
    print("========================================");
    print("LOGIN BUTTON CLICKED");
    print("Username: $email");
    print("========================================");

    emit(LoginLoading());

    try {
      final user = await loginUser(email, password);

      // IMPORTANT: Set JWT for all future API requests
      apiService.setToken(user.token);

      // await AuthStorage.saveUser(user);

      print("========================================");
      print("LOGIN SUCCESS");
      print("User: ${user.userfullname}");
      print("========================================");

      emit(LoginSuccess(user));
    } on DioException catch (e) {
      print("========================================");
      print("DIO EXCEPTION");
      print("TYPE: ${e.type}");
      print("MESSAGE: ${e.message}");
      print("URL: ${e.requestOptions.baseUrl}${e.requestOptions.path}");
      print("METHOD: ${e.requestOptions.method}");
      print("STATUS: ${e.response?.statusCode}");
      print("RESPONSE: ${e.response?.data}");
      print("========================================");

      String? backendMessage;

      if (e.response?.data is Map<String, dynamic>) {
        backendMessage =
            e.response?.data['error'] ??
            e.response?.data['message'];
      }

      if (e.response?.statusCode == 401 ||
          e.response?.statusCode == 403) {
        emit(
          LoginError(
            backendMessage ?? 'Invalid username or password',
            showInline: true,
          ),
        );
        return;
      }

      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        emit(LoginError('Unable to connect to server'));
        return;
      }

      if (e.response?.statusCode == 500) {
        emit(
          LoginError(
            backendMessage ??
                'Something went wrong. Please try again later',
          ),
        );
        return;
      }

      emit(LoginError(backendMessage ?? 'Unexpected error occurred'));
    } catch (e, s) {
      print("========================================");
      print("UNKNOWN ERROR");
      print(e);
      print(s);
      print("========================================");

      emit(LoginError('Unexpected error occurred'));
    }
  }
}
