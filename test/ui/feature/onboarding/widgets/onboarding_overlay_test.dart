import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('OnboardingOverlay', () {
    final pages = [
      OnboardingItem(
        title: 'Título 1',
        image: 'assets/images/onboarding/1.png',
        description: 'Descrição 1',
      ),
      OnboardingItem(
        title: 'Título 2',
        image: 'assets/images/onboarding/2.png',
        description: 'Descrição 2',
      ),
    ];

    testWidgets('renders first page title and description', (tester) async {
      final pageController = PageController();
      final currentPage = ValueNotifier<int>(0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OnboardingOverlay(
              pages: pages,
              currentPage: currentPage,
              size: const Size(400, 800),
              pageController: pageController,
            ),
          ),
        ),
      );

      expect(find.text('Título 1'), findsOneWidget);
      expect(find.text('Descrição 1'), findsOneWidget);
      expect(find.text('Título 2'), findsNothing);

      pageController.dispose();
      currentPage.dispose();
    });

    testWidgets('updates content when currentPage changes', (tester) async {
      final pageController = PageController();
      final currentPage = ValueNotifier<int>(0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OnboardingOverlay(
              pages: pages,
              currentPage: currentPage,
              size: const Size(400, 800),
              pageController: pageController,
            ),
          ),
        ),
      );

      expect(find.text('Título 1'), findsOneWidget);

      currentPage.value = 1;
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Título 2'), findsOneWidget);
      expect(find.text('Descrição 2'), findsOneWidget);

      pageController.dispose();
      currentPage.dispose();
    });

    testWidgets('renders OnboardingButton', (tester) async {
      final pageController = PageController();
      final currentPage = ValueNotifier<int>(0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OnboardingOverlay(
              pages: pages,
              currentPage: currentPage,
              size: const Size(400, 800),
              pageController: pageController,
            ),
          ),
        ),
      );

      expect(find.text('Começar'), findsOneWidget);

      pageController.dispose();
      currentPage.dispose();
    });
  });
}
