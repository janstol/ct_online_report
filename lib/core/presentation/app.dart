import 'package:ct_online_report/core/application/theme_bloc.dart';
import 'package:ct_online_report/core/application/theme_state.dart';
import 'package:ct_online_report/core/presentation/app_theme.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/core/util/extensions/context_ext.dart';
import 'package:ct_online_report/report/application/report_bloc.dart';
import 'package:ct_online_report/report/presentation/report_page.dart';
import 'package:ct_online_report/service_locator.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:ct_online_report/settings/presentation/settings_page.dart';
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
        cubit: _themeBloc,
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: strings.app.name,
            themeMode: state.themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            localizationsDelegates: const [
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
