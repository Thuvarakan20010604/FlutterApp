import 'package:flutter/material.dart';
import '../../../services/session/settings_service.dart';

class SettingsController extends ChangeNotifier {
  final SettingsService _service;

  SettingsController(this._service) {
    themeMode = _service.getThemeMode();
    textScale = _service.getTextScale();
    fontFamily = _service.getFontFamily();
  }

  late ThemeMode themeMode;
  late double textScale;
  String? fontFamily;

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode = mode;
    notifyListeners();
    await _service.setThemeMode(mode);
  }

  Future<void> setTextScale(double scale) async {
    textScale = scale;
    notifyListeners();
    await _service.setTextScale(scale);
  }

  Future<void> setFontFamily(String? family) async {
    fontFamily = family;
    notifyListeners();
    await _service.setFontFamily(family);
  }
}
