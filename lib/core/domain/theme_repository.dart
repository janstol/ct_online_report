import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/core/domain/result.dart';
import 'package:flutter/material.dart';

/// Contract (interface) for theme repository.
///
/// Implement this if you want to create a theme repository.
abstract class ThemeRepository {
  /// Gets saved [ThemeMode] from repository.
  ///
  /// Returns [Result.success] with [ThemeMode],
  /// or [Result.error] with [Failure] if there was an error.
  Future<Result<Failure, ThemeMode>> getThemeMode();

  /// Saves selected [themeMode] to repository.
  ///
  /// Returns [Result.success],
  /// or [Result.error] with [Failure] if there was an error.
  Future<Result<Failure, void>> saveThemeMode(ThemeMode themeMode);
}
