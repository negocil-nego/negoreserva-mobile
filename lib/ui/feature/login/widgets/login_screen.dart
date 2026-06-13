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
              const Text('Welcome back!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.text)),
              const SizedBox(height: 6),
              const Text("Let's login for explore continues", style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
              const SizedBox(height: 28),
              const AuthTextField(
                hint: 'enter your email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              const AuthTextField(
                hint: 'password',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                label: 'Sign In',
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationScreen())),
              ),
              const SizedBox(height: 24),
              const SocialDivider(),
              const SizedBox(height: 20),
              GoogleSignInButton(label: 'Sign Up with Google', onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ", style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  GestureDetector(
                    onTap: () => context.go(Routes.register),
                    child: const Text('Sign Up here', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
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
