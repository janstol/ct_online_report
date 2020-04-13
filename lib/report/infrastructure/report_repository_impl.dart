import 'package:ctonlinereport/core/domain/api_exception.dart';
import 'package:ctonlinereport/core/domain/failures.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/report/infrastructure/reports_datasource.dart';
import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/report/domain/report_repository.dart';
import 'package:ctonlinereport/core/domain/result.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportDataSource _dataSource;

  ReportRepositoryImpl(this._dataSource);

  @override
  Future<Result<Failure, Report>> getReport(int page) async {
    try {
      return Result.success(await _dataSource.getReport(page));
    } on ApiException catch (e) {
      return Result.error(ApiFailure(e.message));
    } on Exception catch (e) {
      return Result.error(ReportFailure(strings.failure.report.load, '$e'));
    }
  }
}
