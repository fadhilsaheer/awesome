import 'package:app/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class TaskScreen extends StatefulWidget {
  final Task task;

  TaskScreen({this.task});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Widget> _appList = [
    Text(
      'My Task',
      style: TextStyle(
        color: appWhite,
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    SizedBox(height: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appGreen,
        child: Icon(Icons.add, color: appWhite, size: 30.0),
        onPressed: () {},
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          itemCount: _appList.length,
          itemBuilder: (BuildContext context, int index) {
            return _appList[index];
          },
        ),
      ),
    );
  }
}
