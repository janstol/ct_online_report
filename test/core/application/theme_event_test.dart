import 'package:ct_online_report/core/application/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of change events', () {
    final changeEvent = ThemeChangedEvent(ThemeMode.system);
    expect(changeEvent, ThemeChangedEvent(ThemeMode.system));
    expect(changeEvent, isNot(ThemeChangedEvent(ThemeMode.dark)));
    expect(
      ThemeChangedEvent(ThemeMode.dark),
      isNot(ThemeChangedEvent(ThemeMode.light)),
    );
  });

  test('the equality of load events', () {
    expect(ThemeLoadEvent(), ThemeLoadEvent());
  });
}
