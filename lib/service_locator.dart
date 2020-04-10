import 'package:ctonlinereport/core/application/theme_bloc.dart';
import 'package:ctonlinereport/core/infrastructure/theme_datasource_impl.dart';
import 'package:ctonlinereport/core/infrastructure/theme_repository_impl.dart';
import 'package:ctonlinereport/report/domain/repository/settings_repository.dart';
import 'package:ctonlinereport/report/domain/repository/theme_repository.dart';
import 'package:ctonlinereport/settings/application/settings_bloc.dart';

import 'package:ctonlinereport/settings/infrastructure/settings_datasource_impl.dart';
import 'package:ctonlinereport/core/infrastructure/api.dart';
import 'package:ctonlinereport/report/infrastructure/remote_report_datasource.dart';
import 'package:ctonlinereport/report/infrastructure/report_repository_impl.dart';
import 'package:ctonlinereport/settings/infrastructure/settings_repository_impl.dart';
import 'package:ctonlinereport/report/domain/repository/report_repository.dart';
import 'package:ctonlinereport/report/application/report_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

/// The [GetIt] service locator instance.
final GetIt serviceLocator = GetIt.instance;

/// Sets up and creates all dependencies.
Future<void> setupServiceLocator() async {
  /// Settings
  serviceLocator.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(SettingsDataSourceImpl()),
  );

  serviceLocator.registerSingleton<SettingsBloc>(
    SettingsBloc(serviceLocator.get<SettingsRepository>()),
  );

  /// Theme
  serviceLocator.registerSingleton<ThemeRepository>(
    ThemeRepositoryImpl(ThemeDataSourceImpl()),
  );

  final _themeMode = await serviceLocator.get<ThemeRepository>().getThemeMode();

  serviceLocator.registerSingleton<ThemeBloc>(
    ThemeBloc(_themeMode.value, serviceLocator.get<ThemeRepository>()),
  );

  /// Reports
  serviceLocator.registerSingleton<ReportApi>(
    ReportApi(
      client: Client(),
      settingsBloc: serviceLocator.get<SettingsBloc>(),
    ),
  );

  serviceLocator.registerSingleton<ReportRepository>(
    ReportRepositoryImpl(
      RemoteReportDataSource(serviceLocator.get<ReportApi>()),
    ),
  );

  serviceLocator.registerSingleton<ReportBloc>(
    ReportBloc(serviceLocator.get<ReportRepository>()),
  );
}
