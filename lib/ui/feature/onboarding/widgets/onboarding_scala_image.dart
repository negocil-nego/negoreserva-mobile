
import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class OnboardingScalaImage extends StatelessWidget {
  const OnboardingScalaImage({
    super.key,
    required this.item,
    required this.scaleAnimation,
    required this.size,
  });

  final OnboardingItem item;
  final Animation<double> scaleAnimation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Image.asset(
        item.image,
        fit: BoxFit.cover,
        gaplessPlayback: true,
      ),
    );
  }
}