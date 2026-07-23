import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/auth_storage.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../../core/services/api_service.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService apiService;

  AuthBloc(this.apiService) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<TokenRefreshed>(_onTokenRefreshed);
    on<LoggedOut>(_onLoggedOut);
  }

  Future<void> _onAppStarted(
    AppStarted event,
    Emitter<AuthState> emit,
  ) async {
    final user = await AuthStorage.getUser();

    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoggedIn(
    LoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final user = User(
      userId: event.userId,
      userfullname: event.userfullname,
      emailaddress: event.emailaddress,
      token: event.accessToken,
      refreshtoken: event.refreshToken,
      emprole: event.emprole,
    );

    await AuthStorage.saveUser(user);
    emit(Authenticated(user));
  }

  Future<void> _onTokenRefreshed(
    TokenRefreshed event,
    Emitter<AuthState> emit,
  ) async {
    final user = await AuthStorage.getUser();
    if (user == null) return;

    final updatedUser = User(
  userId: user.userId,
  userfullname: user.userfullname,
  emailaddress: user.emailaddress,
  token: event.newAccessToken,
  refreshtoken: user.refreshtoken,
  emprole: user.emprole,
);
    await AuthStorage.saveUser(updatedUser);
    emit(Authenticated(updatedUser));
  }

  Future<void> _onLoggedOut(
    LoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    await AuthStorage.clearUser();
    emit(Unauthenticated());
  }
}
