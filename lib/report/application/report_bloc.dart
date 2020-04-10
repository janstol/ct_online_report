import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ctonlinereport/report/application/report_event.dart';
import 'package:ctonlinereport/report/application/report_state.dart';
import 'package:ctonlinereport/report/domain/repository/report_repository.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository _reportRepository;

  ReportBloc(this._reportRepository);

  @override
  ReportState get initialState => ReportInitialState();

  @override
  Stream<ReportState> mapEventToState(ReportEvent event) async* {
    if (event is ReportFetchEvent) {
      if (!event.refresh) yield ReportLoadingState();

      final report = await _reportRepository.getReport(event.page);

      if (report.hasError) {
        yield ReportErrorState(report.error);
      } else {
        yield ReportSuccessState(report.value);
      }
    }
  }
}
