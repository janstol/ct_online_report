import 'package:bloc_test/bloc_test.dart';
import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:ct_online_report/settings/application/settings_event.dart';
import 'package:ct_online_report/settings/application/settings_state.dart';
import 'package:ct_online_report/settings/domain/settings_repository.dart';
import 'package:ct_online_report/settings/infrastructure/settings_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_settings_data_source.dart';

void main() {
  SettingsBloc settingsBloc;
  SettingsRepository settingsRepository;

  setUp(() {
    final settingsDataSource = FakeSettingsDataSource();
    settingsRepository = SettingsRepositoryImpl(settingsDataSource);
    settingsBloc = SettingsBloc(settingsRepository);
  });

  test('correct initial state', () {
    expect(
      SettingsBloc(settingsRepository).initialState,
      const SettingsState(defaultReportUrl, defaultReportId),
    );
  });

  blocTest<SettingsBloc, SettingsEvent, SettingsState>(
    'should load settings',
    build: () async =>
        settingsBloc..add(const ReportIdSettingsChangedEvent('1')),
    act: (bloc) async => bloc.add(LoadSettingsEvent()),
    expect: <SettingsState>[const SettingsState(defaultReportUrl, '1')],
  );

  blocTest<SettingsBloc, SettingsEvent, SettingsState>(
    'should save settings and emit new values',
    build: () async => settingsBloc,
    act: (bloc) async {
      bloc
        ..add(const ReportIdSettingsChangedEvent('ID'))
        ..add(const ReportUrlSettingsChangedEvent('URL'));
    },
    expect: <SettingsState>[
      const SettingsState(defaultReportUrl, 'ID'),
      const SettingsState('URL', 'ID'),
    ],
  );
}
