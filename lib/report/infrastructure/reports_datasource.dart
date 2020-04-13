import 'package:ctonlinereport/report/domain/entity/report.dart';

/// Contract (interface) for reports data source.
///
/// Implement this if you want to create a reports data source.
abstract class ReportDataSource {
  /// Gets [Report] from data source.
  Future<Report> getReport(int page);
}
