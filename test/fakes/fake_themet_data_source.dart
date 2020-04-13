import 'package:ctonlinereport/core/infrastructure/theme_datasource.dart';
import 'package:flutter/src/material/app.dart';
import 'package:mockito/mockito.dart';

class FakeThemeDataSource extends Fake implements ThemeDataSource {
  ThemeMode _themeMode;

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    return Future.value();
  }

  @override
  Future<ThemeMode> getThemeMode() {
    return Future.value(_themeMode);
  }
}
