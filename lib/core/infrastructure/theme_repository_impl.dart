import 'package:ctonlinereport/core/domain/failures.dart';
import 'package:ctonlinereport/core/domain/result.dart';
import 'package:ctonlinereport/core/infrastructure/theme_datasource.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/core/domain/theme_repository.dart';
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
