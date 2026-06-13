import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/_import.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final List<OnboardingItem> _pages = OnboardingRepo.getData();

  late final PageController _pageController;
  Timer? _timer;

  late final ValueNotifier<int> _currentPage = ValueNotifier(0);

  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _scaleAnimation = Tween<double>(
    begin: 1.0,
    end: 1.2,
  ).animate(CurvedAnimation(
    parent: _scaleController,
    curve: Curves.linear,
  ));

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scheduleAutoPlay();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light
      )
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final page in _pages) {
      precacheImage(AssetImage(page.image), context);
    }
  }

  void _scheduleAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      if (!_pageController.hasClients) return;
      final next = (_currentPage.value + 1) % _pages.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    _currentPage.value = index;
    _scaleController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _scaleController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _pages.length,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return OnboardingScalaImage(
                item: _pages[index],
                scaleAnimation: _scaleAnimation,
                size: size,
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OnboardingOverlay(
              pages: _pages,
              currentPage: _currentPage,
              size: size,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}