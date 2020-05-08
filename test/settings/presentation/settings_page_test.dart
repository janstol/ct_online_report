import 'package:ct_online_report/core/application/theme_bloc.dart';
import 'package:ct_online_report/core/application/theme_state.dart';
import 'package:ct_online_report/core/constants.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:ct_online_report/settings/application/settings_state.dart';
import 'package:ct_online_report/settings/presentation/settings_page.dart';
import 'package:ct_online_report/settings/presentation/widget/about_tile.dart';
import 'package:ct_online_report/settings/presentation/widget/report_id_tile.dart';
import 'package:ct_online_report/settings/presentation/widget/report_url_tile.dart';
import 'package:ct_online_report/settings/presentation/widget/theme_select_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mock_settings_bloc.dart';
import '../../mocks/mock_theme_bloc.dart';

void main() {
  SettingsBloc settingsBloc;
  ThemeBloc themeBloc;
  Widget settingsPage;

  setUpAll(() async {
    settingsBloc = MockSettingsBloc();
    themeBloc = MockThemeBloc();
    settingsPage = MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>.value(value: settingsBloc),
        BlocProvider<ThemeBloc>.value(value: themeBloc),
      ],
      child: MaterialApp(
        title: strings.app.name,
        home: Scaffold(
          body: SettingsPage(),
        ),
      ),
    );
  });

  testWidgets('shoud render all list tiles', (WidgetTester tester) async {
    when(settingsBloc.state).thenReturn(
      SettingsState(defaultReportUrl, defaultReportId),
    );
    when(themeBloc.state).thenReturn(const ThemeState(ThemeMode.system));
    await tester.pumpWidget(settingsPage);

    expect(find.text(strings.app.settings.title), findsOneWidget);
    expect(find.byType(ThemeSelectTile), findsOneWidget);
    expect(find.byType(ReportUrlTile), findsOneWidget);
    expect(find.byType(ReportIdTile), findsOneWidget);
    expect(find.byType(AboutTile), findsOneWidget);
  });
}
