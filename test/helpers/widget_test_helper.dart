import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/_import.dart';

Widget wrapWithMaterial(Widget child) {
  return MaterialApp(
    home: child,
  );
}

Widget wrapWithGoRouter(Widget screen, {String path = '/'}) {
  return MaterialApp.router(
    routerConfig: GoRouter(
      initialLocation: path,
      routes: [
        GoRoute(
          path: path,
          builder: (_, __) => screen,
        ),
        GoRoute(
          path: Routes.login,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: Routes.home,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: Routes.register,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: Routes.forgetPassword,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: Routes.verification,
          builder: (_, __) => const SizedBox(),
        ),
        GoRoute(
          path: Routes.resetPassword,
          builder: (_, __) => const SizedBox(),
        ),
      ],
    ),
  );
}
