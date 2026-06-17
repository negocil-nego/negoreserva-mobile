import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('SocialDivider', () {
    testWidgets('renders default label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: SocialDivider())),
      );

      expect(find.text('You can Connect with'), findsOneWidget);
    });

    testWidgets('renders custom label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: SocialDivider(label: 'Ou'))),
      );

      expect(find.text('Ou'), findsOneWidget);
    });
  });
}
