import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('OtpInputField', () {
    testWidgets('renders text field', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OtpInputField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
            ),
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
    });

    testWidgets('accepts a single digit input', (tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OtpInputField(
              controller: controller,
              focusNode: FocusNode(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), '5');
      expect(controller.text, '5');
    });
  });
}
