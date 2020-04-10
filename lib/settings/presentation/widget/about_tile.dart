import 'package:ctonlinereport/core/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';

/// About tile widget, shown in settings.
/// Displays dialog (on tap) with basic info about application.
class AboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appVersion = '';

    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          appVersion = '${snapshot.data.version}';
        }

        return AboutListTile(
          icon: const Icon(MdiIcons.informationOutline),
          applicationName: strings.app.name,
          applicationVersion: appVersion,
          applicationLegalese: '© 2020 Jan Štol',
          child: Text(strings.app.about.title),
        );
      },
    );
  }
}
