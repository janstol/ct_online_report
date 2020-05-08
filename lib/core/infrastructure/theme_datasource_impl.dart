import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/core/infrastructure/theme_datasource.dart';
import 'package:ct_online_report/settings/infrastructure/settings_datasource.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// Implementation of [SettingsDataSource] based on Hive data storage.
class ThemeDataSourceImpl implements ThemeDataSource {
  final _settingsBox = Hive.box<dynamic>(settingsBoxName);

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeId = await _settingsBox.get(
      hiveThemeModeKey,
      defaultValue: ThemeMode.system.index,
    ) as int;

    return ThemeMode.values[themeId];
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    return _settingsBox.put(hiveThemeModeKey, themeMode.index);
  }
}
