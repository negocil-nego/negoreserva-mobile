import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = RegisterViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    final success = await _viewModel.register();
    if (success && mounted) {
      context.go(Routes.verification, extra: {
        'otpId': _viewModel.otpId,
        'userId': _viewModel.userId,
        'email': _viewModel.emailController.text.trim(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Center(
                child: AuthIllustration(icon: Icons.phone_android_outlined),
              ),
              const SizedBox(height: 28),
              const Text("Vamos começar",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text)),
              const SizedBox(height: 6),
              const Text('crie uma conta para acessar todos os recursos',
                  style: TextStyle(
                      fontSize: 13, color: AppColors.textSecondary)),
              const SizedBox(height: 28),
              AuthTextField(
                hint: 'Digite seu nome completo',
                prefixIcon: Icons.person_outline,
                controller: _viewModel.nameController,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                hint: 'Digite seu e-mail',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _viewModel.emailController,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                hint: 'Telefone',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                controller: _viewModel.phoneController,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                hint: 'Senha',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                controller: _viewModel.passwordController,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                hint: 'Confirme sua senha',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                controller: _viewModel.confirmPasswordController,
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
                    label: 'Cadastre-se',
                    isLoading: _viewModel.isLoading,
                    onPressed: _viewModel.isLoading ? null : _onRegister,
                  );
                },
              ),
              const SizedBox(height: 24),
              const SocialDivider(),
              const SizedBox(height: 20),
              GoogleSignInButton(onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já possui uma conta? ',
                      style: TextStyle(
                          fontSize: 13, color: AppColors.textSecondary)),
                  GestureDetector(
                    onTap: () => context.go(Routes.login),
                    child: const Text('Entrar',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
