import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class LoadSettingsEvent extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class ReportUrlSettingsChangedEvent extends SettingsEvent {
  final String reportUrl;

  const ReportUrlSettingsChangedEvent(this.reportUrl);

  @override
  List<Object> get props => [reportUrl];
}

class ReportIdSettingsChangedEvent extends SettingsEvent {
  final String reportId;

  const ReportIdSettingsChangedEvent(this.reportId);

  @override
  List<Object> get props => [reportId];
}
