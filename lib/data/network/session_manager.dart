import 'package:flutter/foundation.dart';

class SessionManager {
  static String? _token;
  static String? _userName;
  static String? _userEmail;

  static final ValueNotifier<bool> loginStateNotifier = ValueNotifier<bool>(false);

  static String? get token => _token;
  static String? get userName => _userName;
  static String? get userEmail => _userEmail;

  static bool get isAuthenticated => _token != null && _token!.isNotEmpty;

  static void login(String token, String email, String name) {
    _token = token;
    _userEmail = email;
    _userName = name;
    loginStateNotifier.value = true;
  }

  static void logout() {
    _token = null;
    _userEmail = null;
    _userName = null;
    loginStateNotifier.value = false;
  }
}
