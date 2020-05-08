import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/report/domain/entity/report.dart';
import 'package:equatable/equatable.dart';

/// Base class that represents Report state.
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

  const ReportSuccessState(this.report);

  @override
  List<Object> get props => [report];
}

class ReportErrorState extends ReportState {
  final Failure failure;

  const ReportErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
