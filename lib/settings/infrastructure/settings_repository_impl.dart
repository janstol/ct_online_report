import 'package:ctonlinereport/report/domain/repository/settings_repository.dart';
import 'package:ctonlinereport/settings/infrastructure/settings_datasource.dart';
import 'package:ctonlinereport/core/domain/result.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _dataSource;

  SettingsRepositoryImpl(this._dataSource);

  @override
  Future<Result<Exception, String>> getReportUrl() async {
    try {
      return Result.success(await _dataSource.getReportUrl());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Exception, void>> saveReportUrl(String reportUrl) async {
    try {
      await _dataSource.saveReportUrl(reportUrl);
      return Result.success(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Exception, String>> getReportId() async {
    try {
      return Result.success(await _dataSource.getReportId());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Exception, void>> saveReportId(String reportId) async {
    try {
      await _dataSource.saveReportId(reportId);
      return Result.success(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
