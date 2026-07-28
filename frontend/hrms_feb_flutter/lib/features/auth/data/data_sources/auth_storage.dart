import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';

class AuthStorage {
  static const FlutterSecureStorage _secureStorage =
      FlutterSecureStorage();

  static const String _keyUser = 'logged_in_user';

  static Future<void> saveUser(User user) async {
    final jsonString = jsonEncode({
      'userId': user.userId,
      'userfullname': user.userfullname,
      'emailaddress': user.emailaddress,
      'token': user.token,
      'refreshtoken': user.refreshtoken,
      'emprole': user.emprole,
    });

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyUser, jsonString);
    } else {
      await _secureStorage.write(
        key: _keyUser,
        value: jsonString,
      );
    }
  }

  static Future<User?> getUser() async {
    String? jsonString;

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      jsonString = prefs.getString(_keyUser);
    } else {
      jsonString = await _secureStorage.read(key: _keyUser);
    }

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

  static Future<void> clearUser() async {
    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_keyUser);
    } else {
      await _secureStorage.delete(key: _keyUser);
    }
  }
}
