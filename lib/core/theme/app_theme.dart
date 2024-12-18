import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryWhiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      ),
      textTheme: TextTheme(
        bodyLarge: boldStyle(),
        bodyMedium: regularStyle(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: AppColors.secondaryWhiteColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintStyle: boldStyle(
          color: AppColors.secondaryGreyColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
