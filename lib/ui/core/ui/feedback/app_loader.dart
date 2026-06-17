import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class AppLoader extends StatelessWidget {
  final double height;

  const AppLoader({
    super.key,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
