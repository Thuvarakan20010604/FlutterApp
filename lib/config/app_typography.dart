import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static TextTheme textTheme(Brightness b) {
    final base = b == Brightness.dark ? Typography.whiteMountainView : Typography.blackMountainView;
    final t = base.copyWith();

    return t.copyWith(
      headlineSmall: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, height: 1.1),
      titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      bodyLarge: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, height: 1.3),
      bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.3),
      labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
      labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    );
  }
}
