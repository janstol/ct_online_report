import 'package:ctonlinereport/core/constants.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/settings/application/settings_bloc.dart';
import 'package:ctonlinereport/settings/application/settings_state.dart';
import 'package:ctonlinereport/settings/presentation/widget/report_url_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mock_settings_bloc.dart';

void main() {
  Widget tile;

  setUpAll(() async {
    final bloc = MockSettingsBloc();
    when(bloc.state).thenReturn(
      const SettingsState(defaultReportUrl, defaultReportId),
    );

    tile = MaterialApp(
      home: Scaffold(
        body: BlocProvider<SettingsBloc>.value(
          value: bloc,
          child: ReportUrlTile(),
        ),
      ),
    );
  });

  testWidgets('shoud show icon, text and current url',
      (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    expect(find.byIcon(MdiIcons.link), findsOneWidget);
    expect(find.text(strings.app.settings.reportUrl.title), findsOneWidget);
    expect(find.text(defaultReportUrl), findsOneWidget);
  });

  testWidgets('shoud open dialog', (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    await tester.tap(find.byType(ReportUrlTile));
    await tester.pumpAndSettle();

    expect(find.text(strings.app.settings.reportUrl.enter), findsOneWidget);
    expect(find.text(defaultReportUrl), findsNWidgets(2));
    expect(
      find.byWidgetPredicate((Widget w) =>
          w is FlatButton &&
          (w.child as Text).data == strings.app.action.submit),
      findsOneWidget,
    );
  });
}
