import 'package:bloc_test/bloc_test.dart';
import 'package:ct_online_report/core/application/theme_bloc.dart';
import 'package:ct_online_report/core/application/theme_event.dart';
import 'package:ct_online_report/core/application/theme_state.dart';
import 'package:ct_online_report/core/infrastructure/theme_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_themet_data_source.dart';

void main() {
  ThemeBloc themeBloc;

  setUp(() {
    final themeDataSource = FakeThemeDataSource();
    final themeRepository = ThemeRepositoryImpl(themeDataSource);
    themeBloc = ThemeBloc(ThemeMode.system, themeRepository);
  });

  test('initial state should be system theme mode', () {
    expect(themeBloc.initialState, const ThemeState(ThemeMode.system));
  });

  blocTest<ThemeBloc, ThemeEvent, ThemeState>(
    'should change theme and return success state with new theme',
    build: () async => themeBloc,
    act: (bloc) async => bloc
      ..add(const ThemeChangedEvent(ThemeMode.dark))
      ..add(const ThemeChangedEvent(ThemeMode.light))
      ..add(const ThemeChangedEvent(ThemeMode.system)),
    expect: <ThemeState>[
      const ThemeState(ThemeMode.dark),
      const ThemeState(ThemeMode.light),
      const ThemeState(ThemeMode.system),
    ],
  );
}
