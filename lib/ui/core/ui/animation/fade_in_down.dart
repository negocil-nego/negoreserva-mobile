import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeInDown extends StatelessWidget {
  final Duration duration;
  final Duration? delay;
  final Widget child;

  const FadeInDown({
    super.key,
    required this.duration,
    required this.child,
    this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fadeIn(duration: duration)
        .slideY(duration: duration, begin: -0.2, end: 0.0);
  }
}