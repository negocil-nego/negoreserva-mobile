import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('ResetPasswordScreen', () {
    testWidgets('renders key elements', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const ResetPasswordScreen()));
      await tester.pump();

      expect(find.text('Redefinir Senha'), findsOneWidget);
      expect(find.text('Redefinir sua senha'), findsOneWidget);
      expect(find.text('Redefinir'), findsOneWidget);
    });

    testWidgets('renders all input fields', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const ResetPasswordScreen()));
      await tester.pump();

      expect(find.text('Código de verificação'), findsOneWidget);
      expect(find.text('Nova senha'), findsOneWidget);
      expect(find.text('Confirmar nova senha'), findsOneWidget);
    });
  });
}
