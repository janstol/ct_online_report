import 'package:ctonlinereport/report/domain/entity/report.dart';
import 'package:equatable/equatable.dart';

abstract class ReportState extends Equatable {
  const ReportState();
}

class ReportInitialState extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoadingState extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportSuccessState extends ReportState {
  final Report report;
  final DateTime dateTime;

  ReportSuccessState(this.report) : dateTime = DateTime.now();

  @override
  List<Object> get props => [report, dateTime];
}

class ReportErrorState extends ReportState {
  final Exception exception;

  const ReportErrorState(this.exception);

  @override
  List<Object> get props => [exception];
}
