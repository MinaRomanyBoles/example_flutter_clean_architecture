import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // لمنع إنشاء كائن من هذا الكلاس

  // ==========================================
  // 🎨 1. ألوان الهوية الرئيسية
  // ==========================================
  // اللون النحاسي/الذهبي المستخدم في اللوجو، الأيقونات، النصوص، والحدود
  static const Color brand1 = Color(0xFFBE8E5C); // Primary
  
  // اللون الكحلي الداكن جداً (الخلفية الأساسية للتطبيق)
  static const Color brand2 = Color(0xFF071426); // Secondary
  
  // درجة أغمق قليلاً من النحاسي لاستخدامها عند الضغط (Pressed states)
  static const Color brand3 = Color(0xFFA6794B); // Tertiary
  
  // لون التنبيهات والأخطاء (مثل النقطة الحمراء على جرس الإشعارات)
  static const Color brand4 = Color(0xFFE3000F); // Accent / Error

  // ==========================================
  // 🌓 2. الألوان الحيادية والخلفيات (Light Mode - مقترحة)
  // ==========================================
  static const Color lightBackground = Color(0xFFF8F9FA); // خلفية بيضاء مريحة
  static const Color lightSurface = Color(0xFFFFFFFF);    // لون الكروت
  static const Color lightText = Color(0xFF071426);       // النصوص باللون الكحلي الداكن

  // ==========================================
  // 🌒 3. الألوان الحيادية والخلفيات (Dark Mode - مطابقة للصورة)
  // ==========================================
  static const Color darkBackground = Color(0xFF071426); // خلفية التطبيق الكحلية
  static const Color darkSurface = Color(0xFF0B1D36);    // درجة أفتح قليلاً جداً للكروت أو الحاويات
  
  // ملاحظة: في الصورة أغلب العناوين باللون النحاسي، بينما النصوص العادية (مثل داخل حقل الإدخال) تبدو رمادية فاتحة/بيضاء.
  // يمكنك استخدام هذا اللون الرمادي الفاتح كنص افتراضي، واستخدام brand1 للعناوين البارزة.
  static const Color darkText = Color(0xFFE8E8E8); 
}