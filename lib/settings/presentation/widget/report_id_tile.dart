import 'package:ct_online_report/core/presentation/widget/input_dialog.dart';
import 'package:ct_online_report/core/res.dart';
import 'package:ct_online_report/settings/application/settings_bloc.dart';
import 'package:ct_online_report/settings/application/settings_event.dart';
import 'package:ct_online_report/settings/application/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

/// List tile for editing report URL
class ReportIdTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = Provider.of<SettingsBloc>(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previousState, state) =>
          previousState.reportId != state.reportId,
      builder: (BuildContext context, SettingsState state) {
        return ListTile(
          leading: const Icon(MdiIcons.identifier),
          title: Text(strings.app.settings.reportId.title),
          subtitle: Text(state.reportId),
          onTap: () => _onTileTap(context, settingsBloc, state.reportId),
        );
      },
    );
  }

  Future<void> _onTileTap(
    BuildContext context,
    SettingsBloc settingsBloc,
    String currentId,
  ) async {
    final newId = await showDialog<String>(
      context: context,
      builder: (context) {
        return InputDialog<String>(
          title: Text(strings.app.settings.reportId.enter),
          initialValue: currentId,
        );
      },
    );

    if (newId?.isNotEmpty ?? false) {
      settingsBloc.add(ReportIdSettingsChangedEvent(newId));
    }
  }
}
