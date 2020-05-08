import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/settings/infrastructure/settings_datasource.dart';
import 'package:hive/hive.dart';

/// Implementation of [SettingsDataSource] based on Hive data storage.
class SettingsDataSourceImpl implements SettingsDataSource {
  final _settingsBox = Hive.box<dynamic>(settingsBoxName);

  @override
  Future<String> getReportUrl() async {
    return await _settingsBox.get(
      hiveReportUrlKey,
      defaultValue: defaultReportUrl,
    ) as String;
  }

  @override
  Future<void> saveReportUrl(String url) async {
    return _settingsBox.put(hiveReportUrlKey, url);
  }

  @override
  Future<String> getReportId() async {
    return await _settingsBox.get(
      hiveReportIdKey,
      defaultValue: defaultReportId,
    ) as String;
  }

  @override
  Future<void> saveReportId(String id) async {
    return _settingsBox.put(hiveReportIdKey, id);
  }
}
