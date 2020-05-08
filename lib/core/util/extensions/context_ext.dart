import 'package:ct_online_report/core/presentation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [BuildContext] extensions.
extension ContextExt on BuildContext {
  SystemUiOverlayStyle getSystemUiOverlayStyle(ThemeMode themeMode) {
    final platformBrightness = MediaQuery.platformBrightnessOf(this);

    if (themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            platformBrightness == Brightness.dark)) {
      return SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.dark.primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    }

    return SystemUiOverlayStyle(
      systemNavigationBarColor: AppTheme.light.primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }
}
