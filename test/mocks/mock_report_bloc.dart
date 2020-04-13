import 'package:bloc_test/bloc_test.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:ctonlinereport/report/application/report_event.dart';
import 'package:ctonlinereport/report/application/report_state.dart';

class MockReportBloc extends MockBloc<ReportEvent, ReportState>
    implements ReportBloc {}
