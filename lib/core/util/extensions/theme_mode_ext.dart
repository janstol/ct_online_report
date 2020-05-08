import 'package:ct_online_report/core/res.dart';
import 'package:flutter/material.dart';

/// [ThemeMode] extensions.
extension ThemeModeExt on ThemeMode {
  /// Returns translated name of theme based on [themeMode].
  String modeToString() {
    switch (this) {
      case ThemeMode.light:
        return strings.app.settings.theme.light;
      case ThemeMode.dark:
        return strings.app.settings.theme.dark;
      default:
        return strings.app.settings.theme.system;
    }
  }
}
