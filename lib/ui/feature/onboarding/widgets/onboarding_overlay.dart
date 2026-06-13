
import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class OnboardingOverlay extends StatelessWidget {
  const OnboardingOverlay({
    super.key,
    required this.pages,
    required this.currentPage,
    required this.size,
    required this.pageController,
  });

  final List<OnboardingItem> pages;
  final ValueNotifier<int> currentPage;
  final Size size;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (context, index, _) {
        final item = pages[index];
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.2),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: Text(
                  item.title,
                  key: ValueKey('title_$index'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Text(
                  item.description,
                  key: ValueKey('desc_$index'),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: OnboardingButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}