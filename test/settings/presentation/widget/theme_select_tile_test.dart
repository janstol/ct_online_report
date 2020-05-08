import 'package:ct_online_report/core/application/theme_bloc.dart';
import 'package:ct_online_report/core/application/theme_state.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/core/util/extensions/theme_mode_ext.dart';
import 'package:ct_online_report/settings/presentation/widget/theme_select_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/mock_theme_bloc.dart';

void main() {
  Widget tile;

  setUpAll(() async {
    final bloc = MockThemeBloc();
    when(bloc.state).thenReturn(const ThemeState(ThemeMode.system));

    tile = MaterialApp(
      home: Scaffold(
        body: BlocProvider<ThemeBloc>.value(
          value: bloc,
          child: ThemeSelectTile(),
        ),
      ),
    );
  });

  testWidgets('shoud show icon, text and currently selected theme',
      (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    expect(find.byIcon(MdiIcons.themeLightDark), findsOneWidget);
    expect(find.text(strings.app.settings.theme.title), findsOneWidget);
    expect(find.text(ThemeMode.system.modeToString()), findsOneWidget);
  });

  testWidgets('shoud open dialog', (WidgetTester tester) async {
    await tester.pumpWidget(tile);

    await tester.tap(find.byType(ThemeSelectTile));
    await tester.pumpAndSettle();

    expect(find.text(strings.app.settings.theme.choose), findsOneWidget);
    expect(find.text(ThemeMode.system.modeToString()), findsNWidgets(2));
    expect(find.text(ThemeMode.light.modeToString()), findsOneWidget);
    expect(find.text(ThemeMode.dark.modeToString()), findsOneWidget);
  });
}
