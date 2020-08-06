import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ct_online_report/core/application/theme_event.dart';
import 'package:ct_online_report/core/application/theme_state.dart';
import 'package:ct_online_report/core/domain/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeBloc(ThemeMode initialTheme, this._themeRepository)
      : super(ThemeState(initialTheme));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeLoadEvent) {
      final themeMode = await _themeRepository.getThemeMode();
      yield ThemeState(themeMode.value);
    }

    if (event is ThemeChangedEvent) {
      await _themeRepository.saveThemeMode(event.themeMode);
      yield ThemeState(event.themeMode);
    }
  }
}
