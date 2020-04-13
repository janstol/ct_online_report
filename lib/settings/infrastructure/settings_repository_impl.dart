import 'package:ctonlinereport/core/domain/failures.dart';
import 'package:ctonlinereport/core/domain/result.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/settings/domain/settings_repository.dart';
import 'package:ctonlinereport/settings/infrastructure/settings_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _dataSource;

  SettingsRepositoryImpl(this._dataSource);

  @override
  Future<Result<Failure, String>> getReportUrl() async {
    try {
      return Result.success(await _dataSource.getReportUrl());
    } on Exception catch (e) {
      return Result.error(
        SettingsFailure(
          strings.failure.settings.load(strings.app.settings.reportUrl.title),
          '$e',
        ),
      );
    }
  }

  @override
  Future<Result<Failure, void>> saveReportUrl(String reportUrl) async {
    try {
      await _dataSource.saveReportUrl(reportUrl);
      return Result.success(null);
    } on Exception catch (e) {
      return Result.error(
        SettingsFailure(
          strings.failure.settings.save(strings.app.settings.reportUrl.title),
          '$e',
        ),
      );
    }
  }

  @override
  Future<Result<Failure, String>> getReportId() async {
    try {
      return Result.success(await _dataSource.getReportId());
    } on Exception catch (e) {
      return Result.error(
        SettingsFailure(
          strings.failure.settings.load(strings.app.settings.reportId.title),
          '$e',
        ),
      );
    }
  }

  @override
  Future<Result<Failure, void>> saveReportId(String reportId) async {
    try {
      await _dataSource.saveReportId(reportId);
      return Result.success(null);
    } on Exception catch (e) {
      return Result.error(
        SettingsFailure(
          strings.failure.settings.save(strings.app.settings.reportId.title),
          '$e',
        ),
      );
    }
  }
}
