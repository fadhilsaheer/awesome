import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final List<Widget> widgetList;

  TodoList({this.widgetList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: widgetList,
      ),
    );
  }
}
