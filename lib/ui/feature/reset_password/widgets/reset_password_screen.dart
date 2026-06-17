import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ResetPasswordScreenViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ResetPasswordScreenViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _onReset() async {
    final success = await _viewModel.reset();
    if (success && mounted) {
      context.go(Routes.login);
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
        title: const Text('Redefinir Senha',
            style: TextStyle(fontSize: 16, color: AppColors.text)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Center(child: AuthIllustration(icon: Icons.lock_reset_outlined)),
            const SizedBox(height: 28),
            const Text('Redefinir sua senha',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text)),
            const SizedBox(height: 6),
            const Text('Digite o código e sua nova senha.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
            const SizedBox(height: 28),
            AuthTextField(
              hint: 'Código de verificação',
              prefixIcon: Icons.pin_outlined,
              controller: _viewModel.codeController,
            ),
            const SizedBox(height: 14),
            AuthTextField(
              hint: 'Nova senha',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _viewModel.passwordController,
            ),
            const SizedBox(height: 14),
            AuthTextField(
              hint: 'Confirmar nova senha',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              controller: _viewModel.confirmController,
            ),
            if (_viewModel.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _viewModel.errorMessage!,
                  style: const TextStyle(color: AppColors.error, fontSize: 13),
                ),
              ),
            const SizedBox(height: 24),
            ListenableBuilder(
              listenable: _viewModel,
              builder: (context, _) {
                return PrimaryButton(
                  label: 'Redefinir',
                  isLoading: _viewModel.isLoading,
                  onPressed: _viewModel.isLoading ? null : _onReset,
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
