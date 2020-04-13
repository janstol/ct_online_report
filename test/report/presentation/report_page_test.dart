import 'package:ctonlinereport/core/domain/failures.dart';
import 'package:ctonlinereport/core/keys.dart';
import 'package:ctonlinereport/core/presentation/widget/error_mesage_widget.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:ctonlinereport/report/application/report_state.dart';
import 'package:ctonlinereport/report/presentation/report_page.dart';
import 'package:ctonlinereport/report/presentation/widget/report_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture.dart';
import '../../mocks/mock_report_bloc.dart';

void main() {
  ReportBloc reportBloc;
  Widget reportPage;

  setUpAll(() async {
    reportBloc = MockReportBloc();
    reportPage = BlocProvider.value(
      value: reportBloc,
      child: MaterialApp(
        title: strings.app.name,
        home: Scaffold(
          body: ReportPage(),
        ),
      ),
    );
  });

  testWidgets('shoud render LoadingIndicator when report is loading',
      (WidgetTester tester) async {
    when(reportBloc.state).thenAnswer((_) => ReportLoadingState());
    await tester.pumpWidget(reportPage);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text(strings.app.name), findsOneWidget);
    expect(find.byKey(Keys.settingsButton), findsOneWidget);
    expect(find.byKey(Keys.paginator), findsOneWidget);
  });

  testWidgets('shoud render list of posts when report is loaded',
      (WidgetTester tester) async {
    final report = generateReport(3);
    when(reportBloc.state).thenAnswer((_) => ReportSuccessState(report));
    await tester.pumpWidget(reportPage);

    expect(find.text(strings.app.name), findsOneWidget);
    expect(find.byKey(Keys.settingsButton), findsOneWidget);
    expect(find.byKey(Keys.paginator), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ReportPostItem), findsNWidgets(report.posts.length));
  });

  testWidgets('shoud render error message when there is some error',
      (WidgetTester tester) async {
    final failure = ApiFailure(strings.failure.general);
    when(reportBloc.state).thenAnswer((_) => ReportErrorState(failure));
    await tester.pumpWidget(reportPage);

    expect(find.text(strings.app.name), findsOneWidget);
    expect(find.byKey(Keys.settingsButton), findsOneWidget);
    expect(find.byKey(Keys.paginator), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ReportPostItem), findsNothing);

    expect(findErrorWidget(failure), findsOneWidget);
  });
}

Finder findErrorWidget(Failure failure) => find.byWidgetPredicate((w) =>
    w is ErrorMessageWidget &&
    w.key == Keys.errorWidget &&
    w.failure == failure);
