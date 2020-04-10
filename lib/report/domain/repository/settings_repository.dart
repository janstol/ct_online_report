import 'package:ctonlinereport/core/domain/result.dart';

/// Contract (interface) for settings repository.
///
/// Implement this if you want to create a settings repository.
abstract class SettingsRepository {
  /// Gets report url from repository.
  ///
  /// Returns [Result.success] with pattern,
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, String>> getReportUrl();

  /// Saves report url into repository.
  ///
  /// Returns [Result.success],
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, void>> saveReportUrl(String format);

  /// Gets report id from repository.
  ///
  /// Returns [Result.success] with pattern,
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, String>> getReportId();

  /// Saves report id into repository.
  ///
  /// Returns [Result.success],
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, void>> saveReportId(String format);
}
