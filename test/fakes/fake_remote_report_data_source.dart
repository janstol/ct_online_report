import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:ctonlinereport/report/infrastructure/reports_datasource.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixture.dart';

class FakeRemoteReportDataSource extends Fake implements ReportDataSource {
  @override
  Future<Report> getReport(int page) {
    if (page == 1) {
      return Future.value(generateReport(3));
    }

    throw Exception('Fail');
  }
}
