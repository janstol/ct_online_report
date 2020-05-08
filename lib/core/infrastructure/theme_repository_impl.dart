import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/core/domain/result.dart';
import 'package:ct_online_report/core/infrastructure/theme_datasource.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/core/domain/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource _dataSource;

  ThemeRepositoryImpl(this._dataSource);

  @override
  Future<Result<Failure, ThemeMode>> getThemeMode() async {
    try {
      return Result.success(await _dataSource.getThemeMode());
    } on Exception catch (e) {
      return Result.error(ThemeFailure(strings.failure.theme.load, '$e'));
    }
  }

  @override
  Future<Result<Failure, void>> saveThemeMode(ThemeMode themeMode) async {
    try {
      return Result.success(await _dataSource.saveThemeMode(themeMode));
    } on Exception catch (e) {
      return Result.error(ThemeFailure(strings.failure.theme.save, '$e'));
    }
  }
}
