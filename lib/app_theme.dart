import 'package:flutter/material.dart';
import 'AppColors.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.bgColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30.53,
        fontFamily: "Proxima Nova",
        color: AppColors.textColor,
      ),
    ),
  );
}