import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:ct_online_report/settings/application/settings_state.dart';
import 'package:ct_online_report/settings/presentation/widget/report_id_tile.dart';
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
          child: ReportIdTile(),
        ),
      ),
    );
  });

  testWidgets('shoud show icon, text and current url',
      (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    expect(find.byIcon(MdiIcons.identifier), findsOneWidget);
    expect(find.text(strings.app.settings.reportId.title), findsOneWidget);
    expect(find.text(defaultReportId), findsOneWidget);
  });

  testWidgets('shoud open dialog', (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    await tester.tap(find.byType(ReportIdTile));
    await tester.pumpAndSettle();

    expect(find.text(strings.app.settings.reportId.enter), findsOneWidget);
    expect(find.text(defaultReportId), findsNWidgets(2));
    expect(
      find.byWidgetPredicate((Widget w) =>
          w is FlatButton &&
          (w.child as Text).data == strings.app.action.submit),
      findsOneWidget,
    );
  });
}
