part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  final int userId;
  final String userfullname;
  final String emailaddress;
  final String accessToken;
  final String refreshToken;
  final int emprole;

  LoggedIn(
    this.userId,
    this.userfullname,
    this.emailaddress,
    this.accessToken,
    this.refreshToken,
    this.emprole,
  );
}

class TokenRefreshed extends AuthEvent {
  final String newAccessToken;

  TokenRefreshed(this.newAccessToken);
}

class LoggedOut extends AuthEvent {}
