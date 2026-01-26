import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../storage/hive_boxes.dart';

class SettingsService {
  static const _kThemeMode = 'themeMode';
  static const _kTextScale = 'textScale';
  static const _kFontFamily = 'fontFamily';

  Box get _box => Hive.box(HiveBoxes.settings);

  ThemeMode getThemeMode() {
    final v = _box.get(_kThemeMode, defaultValue: 'system') as String;
    switch (v) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final v = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      _ => 'system',
    };
    await _box.put(_kThemeMode, v);
  }

  double getTextScale() {
    final v = _box.get(_kTextScale, defaultValue: 1.0);
    if (v is num) return v.toDouble();
    return 1.0;
  }

  Future<void> setTextScale(double scale) async {
    await _box.put(_kTextScale, scale);
  }

  String? getFontFamily() {
    final v = _box.get(_kFontFamily);
    if (v is String && v.trim().isNotEmpty) return v;
    return null; // null = system font
  }

  Future<void> setFontFamily(String? family) async {
    if (family == null || family.trim().isEmpty) {
      await _box.delete(_kFontFamily);
    } else {
      await _box.put(_kFontFamily, family.trim());
    }
  }
}
