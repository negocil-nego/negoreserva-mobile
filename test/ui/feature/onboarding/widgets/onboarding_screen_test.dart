import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../helpers/widget_test_helper.dart';

void main() {
  group('OnboardingScreen', () {
    testWidgets('renders without errors', (tester) async {
      await tester.pumpWidget(wrapWithGoRouter(const OnboardingScreen()));
      await tester.pump();

      expect(find.byType(OnboardingScreen), findsOneWidget);
    });
  });
}
