import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

final class Routes {
  static const String verification = '/verification';
  static const String onboarding = '/onboarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/';
}

final GoRouter router = GoRouter(
  initialLocation: Routes.onboarding,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => const Scaffold(
    body: Center(child: Text('Página não encontrada!')),
  ),
  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: Routes.register,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      path: Routes.verification,
      builder: (BuildContext context, GoRouterState state) {
        return const VerificationScreen();
      },
    )
  ],
);