import 'package:flutter/material.dart';
import 'AppColors.dart';

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
      bodyLarge: TextStyle(
        fontSize: 15,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
    ),
  );
}