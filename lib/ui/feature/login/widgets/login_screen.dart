import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                child: AuthIllustration(icon: Icons.shield_outlined),
              ),
              const SizedBox(height: 28),
              const Text('Bem-vindo de volta!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text)),
              const SizedBox(height: 6),
              const Text("Faça login para continuar explorando", style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
              const SizedBox(height: 28),
              const AuthTextField(
                hint: 'digite seu e-mail',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              const AuthTextField(
                hint: 'senha',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Entrar',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationScreen())),
              ),
              const SizedBox(height: 24),
              const SocialDivider(),
              const SizedBox(height: 20),
              GoogleSignInButton(label: 'Entrar com Google', onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não tem uma conta? ", style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  GestureDetector(
                    onTap: () => context.go(Routes.register),
                    child: const Text('Cadastre-se aqui', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
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