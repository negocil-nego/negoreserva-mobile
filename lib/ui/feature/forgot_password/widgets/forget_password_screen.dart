import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final ForgetPasswordScreenViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ForgetPasswordScreenViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    final success = await _viewModel.send();
    if (success && mounted) {
      context.go(Routes.resetPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.text),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Recuperar Senha',
            style: TextStyle(fontSize: 16, color: AppColors.text)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(child: AuthIllustration(icon: Icons.lock_reset_outlined)),
            const SizedBox(height: 32),
            const Text('Recuperar sua conta',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text)),
            const SizedBox(height: 8),
            const Text(
                'Digite seu e-mail ou telefone para receber o código de verificação.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
            const SizedBox(height: 28),
            TextField(
              controller: _viewModel.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'E-mail ou telefone',
                prefixIcon:
                    const Icon(Icons.contact_mail_outlined, color: AppColors.hint),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.inputBorder)),
              ),
            ),
            if (_viewModel.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _viewModel.errorMessage!,
                  style: const TextStyle(color: AppColors.error, fontSize: 13),
                ),
              ),
            const Spacer(),
            ListenableBuilder(
              listenable: _viewModel,
              builder: (context, _) {
                return PrimaryButton(
                  label: 'Continuar',
                  isLoading: _viewModel.isLoading,
                  onPressed: _viewModel.isLoading ? null : _continue,
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
