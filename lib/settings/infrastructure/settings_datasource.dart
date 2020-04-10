/// Contract (interface) for settings data source.
///
/// Implement this if you want to create a settings data source.
abstract class SettingsDataSource {
  /// Returns report url.
  Future<String> getReportUrl();

  /// Saves report url.
  Future<void> saveReportUrl(String format);

  /// Returns report id.
  Future<String> getReportId();

  /// Saves report id.
  Future<void> saveReportId(String format);
}
