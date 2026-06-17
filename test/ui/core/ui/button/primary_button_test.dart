import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('PrimaryButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: PrimaryButton(label: 'Entrar', onPressed: () {})),
      );

      expect(find.text('Entrar'), findsOneWidget);
    });

    testWidgets('shows CircularProgressIndicator when loading', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: PrimaryButton(label: 'Entrar', isLoading: true)),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Entrar'), findsNothing);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: PrimaryButton(label: 'Entrar', onPressed: () => pressed = true),
        ),
      );

      await tester.tap(find.text('Entrar'));
      expect(pressed, true);
    });

    testWidgets('is disabled when loading', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: PrimaryButton(
            label: 'Entrar',
            isLoading: true,
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      expect(pressed, false);
    });

    testWidgets('is disabled when onPressed is null', (tester) async {
      final button = PrimaryButton(label: 'Entrar');
      await tester.pumpWidget(MaterialApp(home: button));

      final elevated = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevated.onPressed, isNull);
    });
  });
}
