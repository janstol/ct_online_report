import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/settings/presentation/widget/about_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  Widget tile;

  setUpAll(() async {
    tile = MaterialApp(
      home: Scaffold(
        body: AboutTile(),
      ),
    );
  });

  testWidgets('shoud have icon and text', (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    expect(find.text(strings.app.about.title), findsOneWidget);
    expect(find.byIcon(MdiIcons.informationOutline), findsOneWidget);
  });

  testWidgets('shoud open dialog', (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    await tester.tap(find.byType(AboutTile));
    await tester.pumpAndSettle();

    expect(find.text(strings.app.name), findsOneWidget);
  });
}
