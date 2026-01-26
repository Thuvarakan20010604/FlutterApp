import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

ThemeData buildLightTheme({String? fontFamily}) {
  final base = ThemeData.light(useMaterial3: true);
  final text = AppTypography.textTheme(Brightness.light).apply(fontFamily: fontFamily);
  final primaryText = base.primaryTextTheme.apply(fontFamily: fontFamily);

  return base.copyWith(
    textTheme: text,
    primaryTextTheme: primaryText,
    scaffoldBackgroundColor: AppColors.bg,
    cardColor: AppColors.surface,
    dividerColor: AppColors.border,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.brand,
      surface: AppColors.surface,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.bg,
      foregroundColor: AppColors.text,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.brand, width: 1.2),
      ),
    ),
  );
}

ThemeData buildDarkTheme({String? fontFamily}) {
  final base = ThemeData.dark(useMaterial3: true);
  final text = AppTypography.textTheme(Brightness.dark).apply(fontFamily: fontFamily);
  final primaryText = base.primaryTextTheme.apply(fontFamily: fontFamily);

  return base.copyWith(
    textTheme: text,
    primaryTextTheme: primaryText,
    scaffoldBackgroundColor: AppColors.bgDark,
    cardColor: AppColors.surfaceDark,
    dividerColor: AppColors.borderDark,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.brandSoft,
      surface: AppColors.surfaceDark,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.bgDark,
      foregroundColor: AppColors.textDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.brandSoft, width: 1.2),
      ),
    ),
  );
}
