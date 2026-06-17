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
  late final OnboardingScreenViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = OnboardingScreenViewModel(vsync: this);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final page in _viewModel.pages) {
      precacheImage(AssetImage(page.image), context);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _viewModel.pages.length,
            controller: _viewModel.pageController,
            onPageChanged: _viewModel.onPageChanged,
            itemBuilder: (context, index) {
              return OnboardingScalaImage(
                item: _viewModel.pages[index],
                scaleAnimation: _viewModel.scaleAnimation,
                size: size,
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OnboardingOverlay(
              pages: _viewModel.pages,
              currentPage: _viewModel.currentPage,
              size: size,
              pageController: _viewModel.pageController,
            ),
          ),
        ],
      ),
    );
  }
}
