import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  // ==========================================
  // ☀️ Light Theme
  // ==========================================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.brand1,
        secondary: AppColors.brand2,
        tertiary: AppColors.brand3,
        error: AppColors.brand4,
        surface: AppColors.lightSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.lightText,
      ),

      textTheme: AppTypography.getTextTheme(AppColors.lightText),

      // يمكنك هنا تخصيص الـ Widgets العامة للمشروع
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.brand1,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brand1,
          foregroundColor: Colors.white,
          textStyle: AppTypography.bold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // 🌙 Dark Theme
  // ==========================================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      scaffoldBackgroundColor: AppColors.darkBackground,
      
      colorScheme: const ColorScheme.dark(
        primary: AppColors.brand1,
        secondary: AppColors.brand2,
        tertiary: AppColors.brand3,
        error: AppColors.brand4,
        surface: AppColors.darkSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.darkText,
      ),

      textTheme: AppTypography.getTextTheme(AppColors.darkText),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        centerTitle: true,
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brand1, // أو يمكنك استخدام لون أفتح للـ Dark Mode
          foregroundColor: Colors.white,
          textStyle: AppTypography.bold,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}