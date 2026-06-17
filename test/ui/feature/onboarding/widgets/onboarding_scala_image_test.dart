import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';

void main() {
  group('OnboardingScalaImage', () {
    testWidgets('renders image with ScaleTransition', (tester) async {
      final controller = AnimationController(
        vsync: _TestTickerProvider(),
        duration: const Duration(seconds: 1),
      );
      final animation = Tween<double>(begin: 1.0, end: 1.2).animate(controller);
      final item = OnboardingItem(
        title: 'Test Title',
        image: 'assets/images/onboarding/1.png',
        description: 'Test Description',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OnboardingScalaImage(
              item: item,
              scaleAnimation: animation,
              size: const Size(400, 800),
            ),
          ),
        ),
      );

      final image = find.byType(Image);
      expect(image, findsOneWidget);
      expect((image.evaluate().single.widget as Image).image is AssetImage,
          true);

      controller.dispose();
    });
  });
}

class _TestTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => _TestTicker(onTick);
}

class _TestTicker extends Ticker {
  _TestTicker(super.onTick);

  @override
  void dispose() {}
}
