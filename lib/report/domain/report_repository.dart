import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/report/domain/entity/report.dart';
import 'package:ct_online_report/core/domain/result.dart';

/// Contract (interface) for reports repository.
///
/// Implement this if you want to create a reports repository.
abstract class ReportRepository {
  /// Gets [Report] from repository.
  ///
  /// Returns [Result.success] with [Report],
  /// or [Result.error] with [Failure] if there was an error.
  Future<Result<Failure, Report>> getReport(int page);
}
