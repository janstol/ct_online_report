import 'package:bloc_test/bloc_test.dart';
import 'package:ct_online_report/report/application/report_bloc.dart';
import 'package:ct_online_report/report/application/report_state.dart';

class MockReportBloc extends MockBloc<ReportState> implements ReportBloc {}
