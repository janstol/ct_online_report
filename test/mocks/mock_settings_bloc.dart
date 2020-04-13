import 'package:bloc_test/bloc_test.dart';
import 'package:ctonlinereport/settings/application/settings_bloc.dart';
import 'package:ctonlinereport/settings/application/settings_event.dart';
import 'package:ctonlinereport/settings/application/settings_state.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}
