import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('GoogleSignInButton', () {
    testWidgets('renders default label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GoogleSignInButton())),
      );

      expect(find.text('Sign Up with Google'), findsOneWidget);
    });

    testWidgets('renders custom label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GoogleSignInButton(label: 'Entrar com Google'),
          ),
        ),
      );

      expect(find.text('Entrar com Google'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GoogleSignInButton(
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Sign Up with Google'));
      expect(pressed, true);
    });
  });
}
