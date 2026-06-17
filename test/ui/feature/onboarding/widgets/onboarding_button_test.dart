import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('OnboardingButton', () {
    testWidgets('renders Começar text', (tester) async {
      await tester.pumpWidget(
        wrapWithGoRouter(
          const Scaffold(body: OnboardingButton()),
        ),
      );

      expect(find.text('Começar'), findsOneWidget);
    });

    testWidgets('renders arrow icon', (tester) async {
      await tester.pumpWidget(
        wrapWithGoRouter(
          const Scaffold(body: OnboardingButton()),
        ),
      );

      expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    });
  });
}
