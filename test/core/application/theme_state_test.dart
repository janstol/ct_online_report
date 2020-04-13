import 'package:ctonlinereport/core/application/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of theme states', () {
    expect(ThemeState(ThemeMode.system), ThemeState(ThemeMode.system));
    expect(ThemeState(ThemeMode.system), isNot(ThemeState(ThemeMode.light)));
    expect(ThemeState(ThemeMode.light), isNot(ThemeState(ThemeMode.dark)));
  });
}
