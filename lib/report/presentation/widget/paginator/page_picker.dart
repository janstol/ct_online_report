import 'package:ctonlinereport/core/keys.dart';
import 'package:ctonlinereport/core/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagePicker extends StatefulWidget {
  final int pageCount;
  final int initialPage;

  const PagePicker({
    Key key,
    @required this.pageCount,
    @required this.initialPage,
  }) : super(key: key);

  @override
  _PagePickerState createState() => _PagePickerState();
}

class _PagePickerState extends State<PagePicker> {
  int _selectedPage = 1;
  FixedExtentScrollController _scrollController;
  int a;

  @override
  void initState() {
    super.initState();
    _selectedPage = widget.initialPage;
    _scrollController =
        FixedExtentScrollController(initialItem: widget.initialPage - 1);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 150,
          child: CupertinoPicker(
            key: Keys.pagePickerSelect,
            backgroundColor: Theme.of(context).primaryColorDark,
            itemExtent: 24,
            magnification: 1.3,
            useMagnifier: true,
            looping: true,
            scrollController: _scrollController,
            onSelectedItemChanged: (int value) => _selectedPage = value + 1,
            children: List.generate(
                widget.pageCount,
                (i) => Text(
                      '${i + 1}',
                      style: const TextStyle(color: Colors.white),
                    )),
          ),
        ),
        OutlineButton(
          key: Keys.pagePickerSubmit,
          onPressed: () => Navigator.pop(context, _selectedPage),
          borderSide: const BorderSide(color: Colors.white),
          child: Text(
            strings.app.action.submit,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
