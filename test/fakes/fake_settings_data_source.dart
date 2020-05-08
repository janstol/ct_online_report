import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/settings/infrastructure/settings_datasource.dart';
import 'package:mockito/mockito.dart';

class FakeSettingsDataSource extends Fake implements SettingsDataSource {
  String _reportUrl = defaultReportUrl;
  String _reportId = defaultReportId;

  @override
  Future<String> getReportUrl() => Future.value(_reportUrl);

  @override
  Future<String> getReportId() => Future.value(_reportId);

  @override
  Future<void> saveReportUrl(String reportUrl) {
    _reportUrl = reportUrl;
    return Future.value();
  }

  @override
  Future<void> saveReportId(String reportId) {
    _reportId = reportId;
    return Future.value();
  }
}
