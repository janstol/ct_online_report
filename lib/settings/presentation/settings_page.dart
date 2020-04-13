import 'package:ctonlinereport/core/res.dart';
import 'package:ctonlinereport/settings/presentation/widget/about_tile.dart';
import 'package:ctonlinereport/settings/presentation/widget/report_id_tile.dart';
import 'package:ctonlinereport/settings/presentation/widget/report_url_tile.dart';
import 'package:ctonlinereport/settings/presentation/widget/theme_select_tile.dart';
import 'package:flutter/material.dart';

/// Page with app settings
class SettingsPage extends StatelessWidget {
  /// Route name for [SettingsPage]
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.app.settings.title),
      ),
      body: ListView(
        children: <Widget>[
          ThemeSelectTile(),
          const Divider(height: 0.0),
          ReportUrlTile(),
          const Divider(height: 0.0),
          ReportIdTile(),
          const Divider(height: 0.0),
          AboutTile(),
          const Divider(height: 0.0),
        ],
      ),
    );
  }
}
