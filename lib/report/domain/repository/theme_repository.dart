import 'package:ctonlinereport/core/domain/result.dart';
import 'package:flutter/material.dart';

/// Contract (interface) for theme repository.
///
/// Implement this if you want to create a theme repository.
abstract class ThemeRepository {
  /// Gets saved [ThemeMode] from repository.
  ///
  /// Returns [Result.success] with [ThemeMode],
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, ThemeMode>> getThemeMode();

  /// Saves selected [themeMode] to repository.
  ///
  /// Returns [Result.success],
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, void>> saveThemeMode(ThemeMode themeMode);
}
