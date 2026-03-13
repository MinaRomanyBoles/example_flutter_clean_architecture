import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  // ==========================================
  // 🔤 1. عائلة الخط (قم بتغييرها لكل مشروع)
  // ==========================================
  static const String fontFamily = 'Cairo'; // مثال: قم بتغييره إلى اسم خط المشروع

  // ==========================================
  // 🖋️ 2. الأوزان الأساسية
  // ==========================================
  static const TextStyle normal = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle italic = TextStyle(
    fontFamily: fontFamily,
    fontStyle: FontStyle.italic,
  );

  // ==========================================
  // 📜 3. بناء TextTheme بناءً على لون النص
  // ==========================================
  static TextTheme getTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: bold.copyWith(fontSize: 57, color: textColor),
      displayMedium: bold.copyWith(fontSize: 45, color: textColor),
      displaySmall: bold.copyWith(fontSize: 36, color: textColor),
      
      headlineLarge: bold.copyWith(fontSize: 32, color: textColor),
      headlineMedium: normal.copyWith(fontSize: 28, color: textColor),
      headlineSmall: normal.copyWith(fontSize: 24, color: textColor),
      
      titleLarge: bold.copyWith(fontSize: 22, color: textColor),
      titleMedium: bold.copyWith(fontSize: 16, color: textColor),
      titleSmall: normal.copyWith(fontSize: 14, color: textColor),
      
      bodyLarge: normal.copyWith(fontSize: 16, color: textColor),
      bodyMedium: normal.copyWith(fontSize: 14, color: textColor),
      bodySmall: italic.copyWith(fontSize: 12, color: textColor), // مثال لاستخدام Italic
      
      labelLarge: bold.copyWith(fontSize: 14, color: textColor),
      labelMedium: normal.copyWith(fontSize: 12, color: textColor),
      labelSmall: normal.copyWith(fontSize: 11, color: textColor),
    );
  }
}