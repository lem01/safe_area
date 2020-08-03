import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HistoryTab extends StatefulWidget {
  HistoryTab({Key key}) : super(key: key);

  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        color: Colors.blue,
        width: constraints.maxWidth,
        height: constraints.maxHeight / 2,
      );
    });
  }
}
