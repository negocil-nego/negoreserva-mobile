import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF2D6B6B);
  static const primaryDark = Color(0xFF1E4F4F);
  static const primaryLight = Color(0xFF4A8F8F);
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF5F8F8);
  static const inputBorder = Color(0xFFD0E4E4);
  static const hint = Color(0xFF9BBDBD);
  static const text = Color(0xFF1A2E2E);
  static const textSecondary = Color(0xFF6B8F8F);
  static const link = Color(0xFF2D6B6B);
  static const error = Color(0xFFE53935);
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      surface: AppColors.background,
    ),
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'SF Pro Display',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textSecondary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.textSecondary,
      ),
    ),
  );
}
