import 'package:ctonlinereport/core/domain/result.dart';
import 'package:ctonlinereport/core/infrastructure/theme_datasource.dart';
import 'package:ctonlinereport/report/domain/repository/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource _dataSource;

  ThemeRepositoryImpl(this._dataSource);

  @override
  Future<Result<Exception, ThemeMode>> getThemeMode() async {
    try {
      return Result.success(await _dataSource.getThemeMode());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Exception, void>> saveThemeMode(ThemeMode themeMode) async {
    try {
      return Result.success(await _dataSource.saveThemeMode(themeMode));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
