import 'package:bloc_test/bloc_test.dart';
import 'package:ct_online_report/core/application/theme_bloc.dart';
import 'package:ct_online_report/core/application/theme_event.dart';
import 'package:ct_online_report/core/application/theme_state.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}
