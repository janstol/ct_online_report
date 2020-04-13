import 'package:ctonlinereport/core/presentation/widget/radio_dialog.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/core/util/extensions/theme_mode_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widget;

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
                    return RadioDialog<ThemeMode>(
                      title: Text(strings.app.settings.theme.choose),
                      selectedValue: ThemeMode.system,
                      values: ThemeMode.values,
                      itemTitle: (item) => Text(item.modeToString()),
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

  testWidgets('should render radio dialog', (WidgetTester tester) async {
    await tester.pumpWidget(widget);

    await tester.tap(find.text('OPEN'));
    await tester.pumpAndSettle();

    expect(find.text(strings.app.settings.theme.choose), findsOneWidget);
    for (final value in ThemeMode.values) {
      expect(find.text(value.modeToString()), findsOneWidget);
    }
  });
}
