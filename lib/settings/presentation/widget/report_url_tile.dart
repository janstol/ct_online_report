import 'package:ctonlinereport/core/presentation/widget/input_dialog.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/settings/application/settings_bloc.dart';
import 'package:ctonlinereport/settings/application/settings_event.dart';
import 'package:ctonlinereport/settings/application/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

/// List tile for editing report URL
class ReportUrlTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = Provider.of<SettingsBloc>(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      condition: (previousState, state) =>
          previousState.reportUrl != state.reportUrl,
      builder: (BuildContext context, SettingsState state) {
        return ListTile(
          leading: Icon(MdiIcons.link),
          title: Text(strings.app.settings.reportUrl.title),
          subtitle: Text(state.reportUrl),
          onTap: () => _onTileTap(context, settingsBloc, state.reportUrl),
        );
      },
    );
  }

  Future<void> _onTileTap(
    BuildContext context,
    SettingsBloc settingsBloc,
    String currentUrl,
  ) async {
    final newUrl = await showDialog<String>(
      context: context,
      builder: (context) {
        return InputDialog<String>(
          title: Text(strings.app.settings.reportUrl.enter),
          initialValue: currentUrl,
        );
      },
    );

    if (newUrl?.isNotEmpty ?? false) {
      settingsBloc.add(ReportUrlSettingsChangedEvent(newUrl));
    }
  }
}
