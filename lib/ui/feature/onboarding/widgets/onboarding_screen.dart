import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  List<OnboardingItem> _pages = [];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 20),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(
    begin: 1.0,
    end: 1.5,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void initState() {
    super.initState();
    if (mounted) _pages = OnboardingRepo.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _pages.length,
        controller: PageController(viewportFraction: 1.0),
        onPageChanged: (index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          final OnboardingItem item = _pages[index];
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.asset(item.image, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withValues(alpha: 0.9),
                        Colors.black.withValues(alpha: 0.8),
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      FadeInDown(
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      FadeInDown(
                        delay: Duration(milliseconds: 800),
                        duration: Duration(milliseconds: 800),
                        child: Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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
                              width: MediaQuery.of(context).size.width * 0.7,
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
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade300,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.green.shade100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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
