import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/core/domain/result.dart';

/// Contract (interface) for reports repository.
///
/// Implement this if you want to create a reports repository.
abstract class ReportRepository {
  /// Gets [Report] from repository.
  ///
  /// Returns [Result.success] with [Report],
  /// or [Result.error] with [Exception] if there was an error.
  Future<Result<Exception, Report>> getReport(int page);
}
