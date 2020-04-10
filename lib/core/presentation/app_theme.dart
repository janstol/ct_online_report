import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
/// Class defining app themes.
class AppTheme {
  /// Application light theme.
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppThemeColors.blue,
    primaryColorBrightness: Brightness.dark,
    accentColor: AppThemeColors.red[550],
    accentColorBrightness: Brightness.dark,
    disabledColor: Colors.white24,
    iconTheme: const IconThemeData(color: Colors.white),
  );

  /// Application dark theme.
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    accentColor: AppThemeColors.red,
    toggleableActiveColor: AppThemeColors.red,
    accentColorBrightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}

// ignore: avoid_classes_with_only_static_members
/// Colors for app theme.
class AppThemeColors {
  /// Primary blue color
  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFCCD5DF),
      100: Color(0xFF8097B0),
      200: Color(0xFF4D6D90),
      300: Color(0xFF335981),
      400: Color(0xFF1A4471),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF002A57),
      700: Color(0xFF00264E),
      800: Color(0xFF002144),
      900: Color(0xFF001831),
    },
  );
  static const int _bluePrimaryValue = 0xFF002F61;

  /// Accent green color.
  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFFDEBED),
      100: Color(0xFFF9C3C8),
      200: Color(0xFFF59BA3),
      300: Color(0xFFF38690),
      400: Color(0xFFF1727E),
      450: Color(0xFFED4A59),
      500: Color(_redPrimaryValue),
      550: Color(0xFFD4313F),
      600: Color(0xFFBC2B38),
      700: Color(0xFFA52631),
      800: Color(0xFF8D202A),
      900: Color(0xFF5E161C),
    },
  );
  static const int _redPrimaryValue = 0xFFEB3646;

  static Color alertColor(String name, Brightness brightness) {
    if (!_alertColors[brightness].containsKey(name)) {
      return const CardTheme().color;
    }
    return _alertColors[brightness][name];
  }

  static final _alertColors = <Brightness, Map<String, Color>>{
    Brightness.light: <String, Color>{
      'alertOne': alertOneColor,
      'alertTwo': alertTwoColor,
      'alertThree': alertThreeColor,
    },
    Brightness.dark: <String, Color>{
      'alertOne': alertOneColorDark,
      'alertTwo': alertTwoColorDark,
      'alertThree': alertThreeColorDark,
    },
  };

  static const Color alertOneColor = Color(0xFFFFDDDD);
  static const Color alertOneColorDark = Color(0xFF990000);
  static const Color alertTwoColor = Color(0xFFDDFFDD);
  static const Color alertTwoColorDark = Color(0xFF009900);
  static const Color alertThreeColor = Color(0xFFDDDDFF);
  static const Color alertThreeColorDark = Color(0xFF000070);
}
