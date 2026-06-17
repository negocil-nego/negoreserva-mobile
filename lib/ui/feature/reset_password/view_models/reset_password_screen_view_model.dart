import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ResetPasswordScreenViewModel extends ChangeNotifier {
  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final _service = ResetPasswordService(ResetPasswordGqlRepository(GqlClient()));

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> reset() async {
    if (passwordController.text != confirmController.text) {
      _errorMessage = 'As senhas não coincidem';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = ResetPasswordRequest(
        code: codeController.text.trim(),
        password: passwordController.text,
        confirm: confirmController.text,
      );
      await _service.forgetResetPassword(request);
      _isLoading = false;
      notifyListeners();
      return true;
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
    codeController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }
}
