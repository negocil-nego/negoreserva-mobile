import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    final success = await _viewModel.login();
    if (success && mounted) {
      context.go(Routes.home);
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
              Center(child: AuthIllustration(icon: Icons.shield_outlined)),
              const SizedBox(height: 28),
              const Text('Bem-vindo de volta!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text)),
              const SizedBox(height: 6),
              const Text("Faça login para continuar explorando",
                  style: TextStyle(
                      fontSize: 13, color: AppColors.textSecondary)),
              const SizedBox(height: 28),
              AuthTextField(
                hint: 'Digite seu e-mail',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _viewModel.usernameController,
              ),
              const SizedBox(height: 14),
              AuthTextField(
                hint: 'Senha',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                controller: _viewModel.passwordController,
              ),
              if (_viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    _viewModel.errorMessage!,
                    style: const TextStyle(color: AppColors.error, fontSize: 13),
                  ),
                ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.go(Routes.forgetPassword),
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                        fontSize: 13, color: AppColors.textSecondary),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ListenableBuilder(
                listenable: _viewModel,
                builder: (context, _) {
                  return PrimaryButton(
                    label: 'Entrar',
                    isLoading: _viewModel.isLoading,
                    onPressed: _viewModel.isLoading ? null : _onLogin,
                  );
                },
              ),
              const SizedBox(height: 24),
              const SocialDivider(),
              const SizedBox(height: 20),
              GoogleSignInButton(
                  label: 'Entrar com Google', onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem uma conta? ",
                      style: TextStyle(
                          fontSize: 13, color: AppColors.textSecondary)),
                  GestureDetector(
                    onTap: () => context.go(Routes.register),
                    child: const Text('Cadastre-se aqui',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => context.go(Routes.home),
                child: const Text('Continuar sem conta',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
