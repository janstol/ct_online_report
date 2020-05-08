import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/core/keys.dart';
import 'package:ct_online_report/core/presentation/widget/error_mesage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  Widget widget;
  Failure failure;

  setUp(() {
    failure = const ApiFailure('Failure');
    widget = MaterialApp(
      home: Scaffold(
        body: ErrorMessageWidget(failure: failure),
      ),
    );
  });

  testWidgets('should render error widget', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    expect(find.byKey(Keys.errorWidget), findsOneWidget);
    expect(find.byIcon(MdiIcons.alertOctagon), findsOneWidget);
    expect(find.text(failure.title), findsOneWidget);
  });
}
