import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class OnboardingScreenViewModel {
  final List<OnboardingItem> pages = OnboardingRepo.getData();
  final PageController pageController;
  final ValueNotifier<int> currentPage = ValueNotifier(0);
  final AnimationController scaleController;
  late final Animation<double> scaleAnimation;
  Timer? _timer;

  OnboardingScreenViewModel({required TickerProvider vsync})
      : pageController = PageController(),
        scaleController = AnimationController(
          duration: const Duration(seconds: 20),
          vsync: vsync,
        ) {
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: scaleController, curve: Curves.linear),
    );
    scaleController.repeat(reverse: true);
    _scheduleAutoPlay();
  }

  void _scheduleAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!pageController.hasClients) return;
      final next = (currentPage.value + 1) % pages.length;
      pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPageChanged(int index) {
    currentPage.value = index;
    scaleController.forward(from: 0.0);
  }

  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    scaleController.dispose();
    currentPage.dispose();
  }
}
