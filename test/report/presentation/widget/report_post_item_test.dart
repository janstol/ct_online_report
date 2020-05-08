import 'package:ct_online_report/report/presentation/widget/report_post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture.dart';

void main() {
  Widget item;

  setUpAll(() async {
    item = MaterialApp(
      home: Scaffold(
        body: ReportPostItem(post: reportPost),
      ),
    );
  });

  testWidgets('should contain information about post',
      (WidgetTester tester) async {
    await tester.pumpWidget(item);

    expect(find.byType(ReportPostItem), findsOneWidget);
    expect(find.text(reportPost.time), findsOneWidget);
    expect(
      find.byWidgetPredicate((Widget w) => w is CircleAvatar),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate((Widget w) =>
          w is RichText && w.text.toPlainText() == reportPost.textContent),
      findsOneWidget,
    );
  });
}
