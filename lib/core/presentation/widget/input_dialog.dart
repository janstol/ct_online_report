import 'package:ct_online_report/core/res.dart';
import 'package:flutter/material.dart';

/// Generic dialog with radio buttons for value selection.
class InputDialog<V> extends StatelessWidget {
  /// Title for dialog.
  final Widget title;

  /// Initial value.
  final V initialValue;

  /// Default value displayed as helper text.
  final V defaultValue;

  final TextEditingController _textFieldController;

  InputDialog({
    Key key,
    @required this.title,
    @required this.initialValue,
    this.defaultValue,
  })  : _textFieldController = TextEditingController(text: '$initialValue'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(
          helperText: defaultValue != null
              ? strings.app.helper.defaultString('$defaultValue')
              : '',
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context, _textFieldController.text),
          color: Theme.of(context).accentColor,
          child: Text(strings.app.action.submit),
        ),
      ],
    );
  }
}
