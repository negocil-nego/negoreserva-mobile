import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('renders key elements', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const LoginScreen()));
      await tester.pump();

      expect(find.text('Bem-vindo de volta!'), findsOneWidget);
      expect(find.text('Entrar'), findsOneWidget);
      expect(find.text('Esqueceu a senha?'), findsOneWidget);
      expect(find.text('Cadastre-se aqui'), findsOneWidget);
      expect(find.text('Continuar sem conta'), findsOneWidget);
      expect(find.text('Entrar com Google'), findsOneWidget);
    });

    testWidgets('renders email and password fields', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const LoginScreen()));
      await tester.pump();

      expect(find.text('Digite seu e-mail'), findsOneWidget);
      expect(find.text('Senha'), findsOneWidget);
    });
  });
}
