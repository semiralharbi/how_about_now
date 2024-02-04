import 'package:flutter/material.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:injectable/injectable.dart';

@singleton
class ThemeManager {
  final _themeData = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary500,
      foregroundColor: AppColors.primary50,
      elevation: 4,
      scrolledUnderElevation: 6,
      shadowColor: AppColors.primary1000,
    ),
    textTheme: _lightThemeText,
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(AppColors.primary1000),
        elevation: MaterialStateProperty.all(4),
        foregroundColor: MaterialStateProperty.all(AppColors.primary50),
        overlayColor: MaterialStateProperty.all(AppColors.primary800),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(
        side: BorderSide(
          width: 6,
          color: AppColors.primary300,
        ),
      ),
    ),
    fontFamily: _fontFamily,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary500,
      onPrimary: AppColors.primary50,
      secondary: AppColors.triadic800,
      onSecondary: AppColors.triadic800,
      error: AppColors.error,
      onError: AppColors.primary50,
      background: AppColors.primary50,
      onBackground: AppColors.primary1000,
      surface: AppColors.primary500,
      onSurface: AppColors.primary1000,
      shadow: AppColors.primary1000,
    ),
  );

  static const Color _darkTextColor = AppColors.primary1000;

  static const String _fontFamily = 'Poppins';

  static const TextTheme _lightThemeText = TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      color: _darkTextColor,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      color: _darkTextColor,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      fontSize: 18,
      color: _darkTextColor,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: _darkTextColor,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: _darkTextColor,
    ),
  );

  ThemeData getTheme() => _themeData;
}
