import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/settings/application/settings_event.dart';
import 'package:ct_online_report/settings/application/settings_state.dart';
import 'package:ct_online_report/settings/domain/settings_repository.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsBloc(this._settingsRepository)
      : super(const SettingsState(defaultReportUrl, defaultReportId));

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
