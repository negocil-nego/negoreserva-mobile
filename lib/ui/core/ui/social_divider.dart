import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class SocialDivider extends StatelessWidget {
  final String label;

  const SocialDivider({super.key, this.label = 'You can Connect with'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.inputBorder, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.inputBorder, thickness: 1)),
      ],
    );
  }
}
