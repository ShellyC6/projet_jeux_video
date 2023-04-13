import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgColor,
    textTheme:  const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontFamily: "Google Sans",
        color: AppColors.textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontFamily: "Google Sans",
        color: AppColors.textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontFamily: "Google Sans",
        color: AppColors.textColor,
      ),
      // TextFields and buttons
      bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
    ),
  );
}