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

    print("========================================");
    print("AUTH STORAGE - SAVE USER");
    print("Platform: ${kIsWeb ? 'WEB' : 'MOBILE'}");
    print("Key: $_keyUser");
    print("JSON:");
    print(jsonString);

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();

      final success = await prefs.setString(_keyUser, jsonString);

      print("SharedPreferences Save Success: $success");

      final verify = prefs.getString(_keyUser);

      print("Stored Value:");
      print(verify);
    } else {
      await _secureStorage.write(
        key: _keyUser,
        value: jsonString,
      );

      final verify = await _secureStorage.read(
        key: _keyUser,
      );

      print("Secure Storage Value:");
      print(verify);
    }

    print("AUTH STORAGE - SAVE COMPLETE");
    print("========================================");
  }

  static Future<User?> getUser() async {
    print("========================================");
    print("AUTH STORAGE - GET USER");

    String? jsonString;

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();

      jsonString = prefs.getString(_keyUser);

      print("Read From SharedPreferences:");
      print(jsonString);
    } else {
      jsonString = await _secureStorage.read(
        key: _keyUser,
      );

      print("Read From Secure Storage:");
      print(jsonString);
    }

    if (jsonString == null) {
      print("No user found in storage.");
      print("========================================");
      return null;
    }

    final Map<String, dynamic> json =
        jsonDecode(jsonString);

    print("Decoded JSON:");
    print(json);

    final user = User(
      userId: json['userId'],
      userfullname: json['userfullname'],
      emailaddress: json['emailaddress'],
      token: json['token'],
      refreshtoken: json['refreshtoken'],
      emprole: json['emprole'],
    );

    print("User Created:");
    print(user.userfullname);
    print(user.emailaddress);
    print(user.userId);

    print("AUTH STORAGE - GET COMPLETE");
    print("========================================");

    return user;
  }

  static Future<void> clearUser() async {
    print("========================================");
    print("AUTH STORAGE - CLEAR USER");

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();

      await prefs.remove(_keyUser);

      print("SharedPreferences Cleared");
    } else {
      await _secureStorage.delete(
        key: _keyUser,
      );

      print("Secure Storage Cleared");
    }

    print("AUTH STORAGE - CLEAR COMPLETE");
    print("========================================");
  }
}
