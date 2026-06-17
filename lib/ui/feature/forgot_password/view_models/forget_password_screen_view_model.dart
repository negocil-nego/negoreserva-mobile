import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ForgetPasswordScreenViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final _service = ForgetPasswordService(ForgetPasswordGqlRepository(GqlClient()));

  bool _isLoading = false;
  String? _errorMessage;
  bool _success = false;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get success => _success;

  Future<bool> send() async {
    final input = emailController.text.trim();
    if (input.isEmpty) {
      _errorMessage = 'Email ou telefone é obrigatório';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _service.sendMessageForgetPassword(ForgetPasswordRequest(input: input));
      _isLoading = false;
      _success = true;
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
    emailController.dispose();
    super.dispose();
  }
}
