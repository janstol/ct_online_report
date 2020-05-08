import 'package:ct_online_report/core/infrastructure/api.dart';
import 'package:ct_online_report/report/infrastructure/reports_datasource.dart';
import 'package:ct_online_report/report/domain/entity/report.dart';

/// Implementation of [ReportDataSource].
class RemoteReportDataSource implements ReportDataSource {
  final ReportApi api;

  const RemoteReportDataSource(this.api);

  @override
  Future<Report> getReport(int page) async {
    return api.fetchReport(page);
  }
}
