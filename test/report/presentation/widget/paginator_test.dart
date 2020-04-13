import 'package:ctonlinereport/core/keys.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:ctonlinereport/report/presentation/widget/paginator/paginator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mock_report_bloc.dart';

void main() {
  Widget paginator;

  setUpAll(() async {
    paginator = MaterialApp(
      home: Scaffold(
        body: BlocProvider<ReportBloc>.value(
          value: MockReportBloc(),
          child: const Paginator(),
        ),
      ),
    );
  });

  testWidgets('paginator has first, prev, next, last, page buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(paginator);

    expect(find.byKey(Keys.paginatorFirstPageButton), findsOneWidget);
    expect(find.byKey(Keys.paginatorPrevPageButton), findsOneWidget);
    expect(find.byKey(Keys.paginatorPageButton), findsOneWidget);
    expect(find.byKey(Keys.paginatorNextPageButton), findsOneWidget);
    expect(find.byKey(Keys.paginatorLastPageButton), findsOneWidget);
  });

  testWidgets('should show page picker', (WidgetTester tester) async {
    await tester.pumpWidget(paginator);

    expect(find.byKey(Keys.paginatorPageButton), findsOneWidget);

    await tester.tap(find.byKey(Keys.paginatorPageButton));
    await tester.pumpAndSettle();
    expect(find.byKey(Keys.pagePicker), findsOneWidget);
  });
}
