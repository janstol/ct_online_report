import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ctonlinereport/core/application/theme_event.dart';
import 'package:ctonlinereport/core/application/theme_state.dart';
import 'package:ctonlinereport/core/domain/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeMode _initialTheme;
  final ThemeRepository _themeRepository;

  ThemeBloc(this._initialTheme, this._themeRepository);

  @override
  ThemeState get initialState => ThemeState(_initialTheme);

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
