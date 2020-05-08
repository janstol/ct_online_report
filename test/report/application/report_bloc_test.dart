import 'package:bloc_test/bloc_test.dart';
import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/report/application/report_bloc.dart';
import 'package:ct_online_report/report/application/report_event.dart';
import 'package:ct_online_report/report/application/report_state.dart';
import 'package:ct_online_report/report/infrastructure/report_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_remote_report_data_source.dart';
import '../../fixtures/fixture.dart';

void main() {
  final reportSuccessState = ReportSuccessState(generateReport(3));
  final reportErrorState = ReportErrorState(
    ReportFailure(strings.failure.report.load, Exception('Fail').toString()),
  );

  ReportBloc reportBloc;

  setUp(() {
    final reportDataSource = FakeRemoteReportDataSource();
    final reportRepository = ReportRepositoryImpl(reportDataSource);
    reportBloc = ReportBloc(reportRepository);
  });

  test('initial state should be ReportInitialState', () {
    expect(reportBloc.initialState, ReportInitialState());
  });

  blocTest<ReportBloc, ReportEvent, ReportState>(
    'should return success state after loading state',
    build: () async => reportBloc,
    act: (bloc) async => bloc.add(const ReportFetchEvent(1)),
    expect: <ReportState>[ReportLoadingState(), reportSuccessState],
  );

  blocTest<ReportBloc, ReportEvent, ReportState>(
    'should return success state without loading state (refresh)',
    build: () async => reportBloc,
    act: (bloc) async => bloc.add(const ReportFetchEvent(1, refresh: true)),
    expect: <ReportState>[reportSuccessState],
  );

  blocTest<ReportBloc, ReportEvent, ReportState>(
    'should return error state ',
    build: () async => reportBloc,
    act: (bloc) async => bloc.add(const ReportFetchEvent(0)),
    expect: <ReportState>[ReportLoadingState(), reportErrorState],
  );
}
