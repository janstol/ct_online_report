import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/report/application/report_state.dart';
import 'package:ct_online_report/report/domain/entity/report.dart';
import 'package:flutter_test/flutter_test.dart';

//ignore_for_file: prefer_const_constructors
void main() {
  test('the equality of initial states', () {
    expect(ReportInitialState(), ReportInitialState());
  });

  test('the equality of loading states', () {
    expect(ReportLoadingState(), ReportLoadingState());
  });

  test('the equality of success states', () {
    final report =
        Report(page: 1, pages: 2, posts: const [], timestamp: DateTime.now());
    expect(ReportSuccessState(report), ReportSuccessState(report));

    final otherReport =
        Report(page: 1, pages: 3, posts: const [], timestamp: DateTime.now());
    expect(ReportSuccessState(report), isNot(ReportSuccessState(otherReport)));
  });

  test('the equality of error states', () {
    const failure = ReportFailure('ReportFailure');
    expect(ReportErrorState(failure), ReportErrorState(failure));

    const otherFailure = ApiFailure('ApiFailure');
    expect(ReportErrorState(failure), isNot(ReportErrorState(otherFailure)));
  });
}
