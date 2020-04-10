import 'package:ctonlinereport/core/application/theme_bloc.dart';
import 'package:ctonlinereport/core/application/theme_state.dart';
import 'package:ctonlinereport/core/presentation/app_theme.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/core/util/extensions/context_ext.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:ctonlinereport/report/presentation/report_page.dart';
import 'package:ctonlinereport/service_locator.dart';
import 'package:ctonlinereport/settings/application/settings_bloc.dart';
import 'package:ctonlinereport/settings/presentation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    final _themeBloc = serviceLocator.get<ThemeBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>.value(
          value: serviceLocator.get<SettingsBloc>(),
        ),
        BlocProvider<ThemeBloc>.value(value: _themeBloc),
        BlocProvider<ReportBloc>.value(value: serviceLocator.get<ReportBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        bloc: _themeBloc,
        condition: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: strings.app.name,
            themeMode: state.themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            initialRoute: ReportPage.routeName,
            onGenerateRoute: _generateRoute,
            builder: (context, child) {
              return AnnotatedRegion(
                value: context.getSystemUiOverlayStyle(state.themeMode),
                child: child,
              );
            },
          );
        },
      ),
    );
  }

  Route _generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SettingsPage.routeName:
        return MaterialPageRoute<SettingsPage>(
          builder: (context) => SettingsPage(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute<ReportPage>(
          builder: (context) => ReportPage(),
          settings: routeSettings,
        );
    }
  }
}
