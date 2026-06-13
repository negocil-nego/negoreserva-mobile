import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  List<OnboardingItem> _pages = [];

  late final PageController _pageController;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 20),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(
    begin: 1.0,
    end: 1.5,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void initState() {
    super.initState();
    _pages = OnboardingRepo.getData();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _pages.length,
        controller: _pageController,
        onPageChanged: (index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          final OnboardingItem item = _pages[index];
          return Stack(
            children: [
              Positioned.fill(
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset(item.image, fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.9),
                        Colors.black.withValues(alpha: 0.2),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInDown(
                        delay: const Duration(milliseconds: 800),
                        duration: const Duration(milliseconds: 800),
                        child: Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInLeft(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: EdgeInsets.only(
                              right: 5,
                              left: 30,
                              top: 5,
                              bottom: 5,
                            ),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                children: [
                                  Text(
                                    "Começar",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green.shade50,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade300,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.arrow_right,
                                      color: Colors.green.shade100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
