import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/themes/theme_data.dart';

enum ThemeState { light, dark }

// تعريف Cubit لإدارة الثيم
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light);

  void toggleTheme() {
    emit(state == ThemeState.light ? ThemeState.dark : ThemeState.light);
  }

  /// التحقق مما إذا كان الوضع الحالي هو الوضع الليلي
  bool get isDarkMode => state == ThemeState.dark;

  /// إرجاع الثيم المناسب بناءً على الحالة
  ThemeData get currentTheme =>
      state == ThemeState.light ? AppThemes.light : AppThemes.dark;
}
