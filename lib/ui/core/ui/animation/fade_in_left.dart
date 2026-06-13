import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeInLeft extends StatelessWidget {
  final Widget child;
  const FadeInLeft({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .fadeIn(duration: 400.ms)
        .slideX(duration: 400.ms, begin: -0.2, end: 0.0);
  }
}