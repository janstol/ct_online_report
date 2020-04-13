import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String title;
  final String details;

  const Failure(this.title, [this.details = '']);

  @override
  List<Object> get props => [title, details];
}

class ThemeFailure extends Failure {
  const ThemeFailure(String title, [String details = ''])
      : super(title, details);
}

class SettingsFailure extends Failure {
  const SettingsFailure(String title, [String details = ''])
      : super(title, details);
}

class ReportFailure extends Failure {
  const ReportFailure(String title, [String details = ''])
      : super(title, details);
}

class ApiFailure extends Failure {
  final int statusCode;

  const ApiFailure(String value, [this.statusCode, String details = ''])
      : super(value, details);

  @override
  List<Object> get props => super.props..add(statusCode);
}
