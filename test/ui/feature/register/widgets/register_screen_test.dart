import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('RegisterScreen', () {
    testWidgets('renders key elements', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const RegisterScreen()));
      await tester.pump();

      expect(find.text('Vamos começar'), findsOneWidget);
      expect(find.text('Cadastre-se'), findsOneWidget);
      expect(find.text('Já possui uma conta? '), findsOneWidget);
      expect(find.text('Entrar'), findsWidgets);
    });

    testWidgets('renders all input fields', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const RegisterScreen()));
      await tester.pump();

      expect(find.text('Digite seu nome completo'), findsOneWidget);
      expect(find.text('Digite seu e-mail'), findsOneWidget);
      expect(find.text('Telefone'), findsOneWidget);
      expect(find.text('Confirme sua senha'), findsOneWidget);
    });
  });
}
