import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';
import 'package:todoey/utils/database/database_helper.dart';
import 'package:todoey/utils/todo_modal.dart';

class TodoContainer extends StatefulWidget {
  final String title;
  final bool isResolved;
  final int id;

  TodoContainer({this.isResolved, this.title, this.id});

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  String _title;
  bool _isResolved;

  DatabaseHelper databaseHelper;

  @override
  void initState() {
    super.initState();
    _isResolved = widget.isResolved;
    _title = widget.title;
    databaseHelper = DatabaseHelper();
  }

  void resolveTask() async {
    setState(() => _isResolved = !_isResolved);
    Todo updateData = Todo(title: _title, done: _isResolved);
    updateData.id = widget.id;

    await databaseHelper.updateData(widget.id, updateData.convertToDb());
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(Random().toString()),
      onDismissed: (_) async {
        await databaseHelper.deleteData(widget.id);
      },
      child: GestureDetector(
        onTap: resolveTask,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          margin: EdgeInsets.only(top: 15.0),
          decoration: BoxDecoration(
            color: _isResolved ? appGreen : appSecondayrColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            _title,
            style: TextStyle(
              color: appWhite,
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
