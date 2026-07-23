import 'package:hrms/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.userId,
    required super.userfullname,
    required super.emailaddress,
    required super.token,
    required super.refreshtoken,
    required super.emprole,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json['user'];

    return UserModel(
      userId: user['id'],
      userfullname: user['userfullname'],
      emailaddress: user['emailaddress'],
      emprole: user['emprole'],
      token: json['token'],
      refreshtoken: json['refreshtoken'],
    );
  }
}
