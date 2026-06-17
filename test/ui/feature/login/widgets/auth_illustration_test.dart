import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('AuthIllustration', () {
    testWidgets('renders with given icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AuthIllustration(icon: Icons.shield_outlined),
          ),
        ),
      );

      expect(find.byIcon(Icons.shield_outlined), findsOneWidget);
    });
  });
}
