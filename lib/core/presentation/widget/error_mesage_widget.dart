import 'package:ct_online_report/core/domain/failures.dart';
import 'package:ct_online_report/core/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/// Widget with error message.
class ErrorMessageWidget extends StatelessWidget {
  final Failure failure;

  const ErrorMessageWidget({@required this.failure})
      : super(key: Keys.errorWidget);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            MdiIcons.alertOctagon,
            size: 40,
            color: Theme.of(context).errorColor,
          ),
          Container(
            height: 5,
          ),
          Text(
            failure.title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
