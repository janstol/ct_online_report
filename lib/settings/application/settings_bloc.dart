import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ctonlinereport/core/constants.dart';
import 'package:ctonlinereport/settings/domain/settings_repository.dart';
import 'package:ctonlinereport/settings/application/settings_event.dart';
import 'package:ctonlinereport/settings/application/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsBloc(this._settingsRepository);

  @override
  SettingsState get initialState =>
      const SettingsState(defaultReportUrl, defaultReportId);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is LoadSettingsEvent) {
      final url = await _settingsRepository.getReportUrl();
      final id = await _settingsRepository.getReportId();
      yield SettingsState(url.value, id.value);
    }

    if (event is ReportUrlSettingsChangedEvent) {
      await _settingsRepository.saveReportUrl(event.reportUrl);
      yield state.copyWith(reportUrl: event.reportUrl);
    }
    if (event is ReportIdSettingsChangedEvent) {
      await _settingsRepository.saveReportId(event.reportId);
      yield state.copyWith(reportId: event.reportId);
    }
  }
}
