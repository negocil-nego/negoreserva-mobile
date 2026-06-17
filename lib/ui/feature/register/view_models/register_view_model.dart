import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class RegisterViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _service = RegisterService(RegisterGqlRepository(GqlClient()));

  bool _isLoading = false;
  String? _errorMessage;
  String? _otpId;
  String? _userId;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get otpId => _otpId;
  String? get userId => _userId;

  Future<bool> register() async {
    if (passwordController.text != confirmPasswordController.text) {
      _errorMessage = 'As senhas não coincidem';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final request = CreateAccountClientInput(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        password: passwordController.text,
        confirm: confirmPasswordController.text,
      );
      final response = await _service.createAccountClient(request);
      _isLoading = false;
      _otpId = response.otpId;
      _userId = response.userId;
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
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
