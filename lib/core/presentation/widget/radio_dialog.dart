import 'package:flutter/material.dart';

/// Generic dialog with radio buttons for value selection.
class RadioDialog<V> extends StatelessWidget {
  /// Title for dialog.
  final Widget title;

  /// Initial (selected) value.
  final V selectedValue;

  /// List of all values.
  final List<V> values;

  /// Allows to customize title for each item.
  final Widget Function(V value) itemTitle;

  const RadioDialog({
    Key key,
    @required this.title,
    @required this.selectedValue,
    @required this.values,
    @required this.itemTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: title,
      children: <Widget>[
        for (var value in values)
          RadioListTile<V>(
            value: value,
            groupValue: selectedValue,
            title: itemTitle(value),
            onChanged: (value) {
              Navigator.pop(context, value);
            },
          )
      ],
    );
  }
}
