import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _service = LoginService(LoginGqlRepository(GqlClient()));

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = LoginRequest(
        username: usernameController.text.trim(),
        password: passwordController.text,
      );
      final response = await _service.login(request);
      _isLoading = false;
      notifyListeners();
      return response.token.isNotEmpty;
    } on GqlException catch (e) {
      _isLoading = false;
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Erro inesperado: $e';
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
