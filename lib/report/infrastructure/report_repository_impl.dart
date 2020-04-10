import 'package:ctonlinereport/report/infrastructure/reports_datasource.dart';
import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/report/domain/repository/report_repository.dart';
import 'package:ctonlinereport/core/domain/result.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportsDataSource _dataSource;

  ReportRepositoryImpl(this._dataSource);

  @override
  Future<Result<Exception, Report>> getReport(int page) async {
    try {
      return Result.success(await _dataSource.getReport(page));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
