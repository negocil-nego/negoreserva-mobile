import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel() {
    SessionManager.loginStateNotifier.addListener(_onLoginStateChanged);
  }

  void _onLoginStateChanged() {
    notifyListeners();
  }

  bool get isAuthenticated => SessionManager.isAuthenticated;
  String? get userName => SessionManager.userName;
  String? get userEmail => SessionManager.userEmail;

  void logout() {
    SessionManager.logout();
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  @override
  void dispose() {
    SessionManager.loginStateNotifier.removeListener(_onLoginStateChanged);
    super.dispose();
  }
}
