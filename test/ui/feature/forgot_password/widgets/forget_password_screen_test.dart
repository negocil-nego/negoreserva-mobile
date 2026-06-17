import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('ForgotPasswordScreen', () {
    testWidgets('renders key elements', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const ForgotPasswordScreen()));
      await tester.pump();

      expect(find.text('Recuperar Senha'), findsOneWidget);
      expect(find.text('Recuperar sua conta'), findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
    });

    testWidgets('renders instruction text', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const ForgotPasswordScreen()));
      await tester.pump();

      expect(
        find.text(
          'Digite seu e-mail ou telefone para receber o código de verificação.',
        ),
        findsOneWidget,
      );
    });
  });
}
