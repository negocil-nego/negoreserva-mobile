import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('AuthTextField', () {
    testWidgets('renders hint text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthTextField(
              hint: 'Digite seu e-mail',
              prefixIcon: Icons.email_outlined,
            ),
          ),
        ),
      );

      expect(find.text('Digite seu e-mail'), findsOneWidget);
    });

    testWidgets('toggles password visibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthTextField(
              hint: 'Senha',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
      expect(find.byIcon(Icons.visibility_outlined), findsNothing);

      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();

      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off_outlined), findsNothing);
    });

    testWidgets('accepts text input', (tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthTextField(
              hint: 'Nome',
              prefixIcon: Icons.person_outline,
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'João');
      expect(controller.text, 'João');
    });
  });
}
