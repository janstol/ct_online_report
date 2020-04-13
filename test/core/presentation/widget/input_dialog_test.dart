import 'package:ctonlinereport/core/presentation/widget/input_dialog.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widget;
  const title = 'Title';
  const initialValue = 'value1';
  const defaultValue = 'default value';

  setUp(() {
    widget = MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return FlatButton(
              onPressed: () async {
                showDialog<String>(
                  context: context,
                  builder: (context) {
                    return InputDialog<String>(
                      title: const Text(title),
                      initialValue: initialValue,
                      defaultValue: defaultValue,
                    );
                  },
                );
              },
              child: const Text('OPEN'),
            );
          },
        ),
      ),
    );
  });

  testWidgets('should render input dialog', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    await tester.tap(find.text('OPEN'));
    await tester.pumpAndSettle();

    expect(find.text(title), findsOneWidget);
    expect(find.text(initialValue), findsOneWidget);
    expect(
      find.text(strings.app.helper.defaultString(defaultValue)),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate((Widget w) =>
          w is FlatButton &&
          (w.child as Text).data == strings.app.action.submit),
      findsOneWidget,
    );
  });
}
