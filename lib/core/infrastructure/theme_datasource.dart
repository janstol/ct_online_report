import 'package:flutter/material.dart';

/// Contract (interface) for theme data source.
///
/// Implement this if you want to create a theme data source.
abstract class ThemeDataSource {
  /// Gets [ThemeMode] from data source.
  Future<ThemeMode> getThemeMode();

  /// Saves [ThemeMode] to data source.
  Future<void> saveThemeMode(ThemeMode themeMode);
}
