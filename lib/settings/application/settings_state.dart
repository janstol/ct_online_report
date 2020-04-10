import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final String reportUrl;
  final String reportId;

  const SettingsState(this.reportUrl, this.reportId);

  SettingsState copyWith({String reportUrl, String reportId}) => SettingsState(
        reportUrl ?? this.reportUrl,
        reportId ?? this.reportId,
      );

  @override
  List<Object> get props => [reportUrl, reportId];
}
