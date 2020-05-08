import 'package:ct_online_report/core/application/theme_bloc.dart';
import 'package:ct_online_report/core/application/theme_event.dart';
import 'package:ct_online_report/core/application/theme_state.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/core/util/extensions/theme_mode_ext.dart';
import 'package:ct_online_report/core/presentation/widget/radio_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// List tile for selecting app theme ([ThemeMode]).
///
/// Shows [_ThemeSelectDialog] when tapped, where theme can be selected.
class ThemeSelectTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      condition: (previousState, state) =>
          previousState.themeMode != state.themeMode,
      builder: (BuildContext context, ThemeState state) {
        return ListTile(
          leading: Icon(MdiIcons.themeLightDark),
          title: Text(strings.app.settings.theme.title),
          subtitle: Text(state.themeMode.modeToString()),
          onTap: () => _onThemeTileTap(context, state.themeMode),
        );
      },
    );
  }

  Future<void> _onThemeTileTap(
    BuildContext context,
    ThemeMode preselectedThemeMode,
  ) async {
    final selectedThemeMode = await showDialog<ThemeMode>(
      context: context,
      builder: (context) {
        return RadioDialog<ThemeMode>(
          title: Text(strings.app.settings.theme.choose),
          selectedValue: preselectedThemeMode,
          values: ThemeMode.values,
          itemTitle: (item) => Text(item.modeToString()),
        );
      },
    );

    if (selectedThemeMode != null) {
      BlocProvider.of<ThemeBloc>(context)
          .add(ThemeChangedEvent(selectedThemeMode));
    }
  }
}
