import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/features/auth/domain/entities/user.dart';

class AuthStorage {
  // Encrypted storage instance
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String _keyUser = 'logged_in_user';

  /// Save user securely
  static Future<void> saveUser(User user) async {
    final jsonString = jsonEncode({
      'userId': user.userId,
      'userfullname': user.userfullname,
      'emailaddress': user.emailaddress,
      'token': user.token,
      'refreshtoken': user.refreshtoken,
      'emprole': user.emprole,
    });

    await _storage.write(
      key: _keyUser,
      value: jsonString,
    );
  }

  /// Get user securely
  static Future<User?> getUser() async {
    final jsonString = await _storage.read(key: _keyUser);
    if (jsonString == null) return null;

    final Map<String, dynamic> json = jsonDecode(jsonString);

    return User(
      userId: json['userId'],
      userfullname: json['userfullname'],
      emailaddress: json['emailaddress'],
      token: json['token'],
      refreshtoken: json['refreshtoken'],
      emprole: json['emprole'],
    );
  }

  /// Clear user data (logout)
  static Future<void> clearUser() async {
    await _storage.delete(key: _keyUser);
  }

  // static Future<void> clearAll() async {
  //   await _storage.deleteAll();
  // }
}
