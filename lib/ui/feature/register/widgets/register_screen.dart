import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              const Text("Vamos começar", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text)),
              const SizedBox(height: 6),
              const Text('crie uma conta para acessar todos os recursos', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
              const SizedBox(height: 28),
              const AuthTextField(
                hint: 'Digite seu nome completo',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 14),
              const AuthTextField(
                hint: 'Digite seu e-mail',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              const AuthTextField(
                hint: 'Senha',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 14),
              const AuthTextField(
                hint: 'Confirme sua senha',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Cadastre-se',
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              const SocialDivider(),
              const SizedBox(height: 20),
              GoogleSignInButton(onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já possui uma conta? ', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  GestureDetector(
                    onTap: () => context.go(Routes.login),
                    child: const Text('Entrar', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
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