import 'package:ctonlinereport/core/constants.dart';
import 'package:ctonlinereport/core/presentation/app_theme.dart';
import 'package:ctonlinereport/report/domain/entity/report_post.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReportPostItem extends StatelessWidget {
  final ReportPost post;

  const ReportPostItem({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _cardColor(context, post),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(post.time, style: Theme.of(context).textTheme.title),
                const SizedBox(height: 5),
                _postIcon(context, post),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: post.content,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Color _cardColor(BuildContext context, ReportPost post) {
    final brightness = Theme.of(context).brightness;
    final alert = post.classes.firstWhere(alerts.contains, orElse: () => null);

    return AppThemeColors.alertColor(alert, brightness);
  }

  static Widget _postIcon(BuildContext context, ReportPost post) {
    final cls = post.classes.firstWhere(
      (c) => iconClasses.contains(c),
      orElse: () => null,
    );

    switch (cls) {
      case 'cesko':
      case 'ceskogrey':
        return const CircleAvatar(
          child: Text(
            'ČR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      case 'slovensko':
        return const CircleAvatar(
          child: Text(
            'SK',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      case 'praha':
        return const CircleAvatar(
          child: Text(
            'PHA',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      case 'citace':
      case 'citacegrey':
        return const CircleAvatar(
          child: Icon(Icons.format_quote, color: Colors.yellow),
        );
      case 'ikona-ct':
        return const CircleAvatar(
          child: Text(
            'ČT',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        );
      case 'vykricnik-vlevo':
      case 'exclamationMark':
        return const CircleAvatar(
          child: Icon(
            MdiIcons.exclamationThick,
            color: AppThemeColors.red,
          ),
        );
    }

    return const CircleAvatar(backgroundColor: Colors.transparent);
  }
}
