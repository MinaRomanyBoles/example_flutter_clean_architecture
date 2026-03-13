import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  // الحالة الافتراضية يمكن أن تكون System أو Light حسب رغبتك
  ThemeCubit() : super(ThemeMode.system);

  // دالة للتبديل بين الوضع المضيء والمظلم
  void toggleTheme() {
    if (state == ThemeMode.light || state == ThemeMode.system) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  // دالة لتحديد ثيم معين مباشرة (مفيدة إذا كان لديك صفحة إعدادات)
  void changeTheme(ThemeMode themeMode) {
    emit(themeMode);
  }
}