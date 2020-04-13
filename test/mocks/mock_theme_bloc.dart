import 'package:bloc_test/bloc_test.dart';
import 'package:ctonlinereport/core/application/theme_bloc.dart';
import 'package:ctonlinereport/core/application/theme_event.dart';
import 'package:ctonlinereport/core/application/theme_state.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}
