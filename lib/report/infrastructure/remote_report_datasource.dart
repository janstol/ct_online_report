import 'package:ctonlinereport/core/infrastructure/api.dart';
import 'package:ctonlinereport/report/infrastructure/reports_datasource.dart';
import 'package:ctonlinereport/report/domain/entity/report.dart';

/// Implementation of [ReportDataSource].
class RemoteReportDataSource implements ReportDataSource {
  final ReportApi api;

  const RemoteReportDataSource(this.api);

  @override
  Future<Report> getReport(int page) async {
    return api.fetchReport(page);
  }
}
