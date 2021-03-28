import 'package:app/data/data.dart';
import 'package:app/models/task_model.dart';
import 'package:app/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TaskScreen extends StatefulWidget {
  final Task task;

  TaskScreen({@required this.task});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Task _task;
  List<Widget> _appList = [];
  String newTask;

  @override
  void initState() {
    super.initState();
    _task = widget.task;
    fillAppList();
  }

  void fillAppList() {
    _appList.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _task.title,
            style: TextStyle(
              color: appWhite,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: appGreen,
                iconSize: 30.0,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete_outline),
                color: appRed,
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
    _appList.add(SizedBox(height: 20.0));
    _appList.add(
      Text(
        _task.description,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    _appList.add(SizedBox(height: 40.0));

    List<String> tasks = _task.tasks;

    for (String myTask in tasks) {
      _appList.add(TaskCard(task: myTask));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appGreen,
        child: Icon(Icons.add, color: appWhite, size: 30.0),
        onPressed: () {
          Alert(
            closeIcon: Icon(Icons.close, color: appWhite),
            context: context,
            title: "CREATE",
            content: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Task...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appGreen, width: 2.0),
                    ),
                  ),
                  style: TextStyle(
                    color: appWhite,
                  ),
                  onChanged: (value) => newTask = value,
                ),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
                  print(newTask);
                },
                color: appGreen,
                child: Text(
                  "CREATE",
                  style: TextStyle(color: appWhite),
                ),
              ),
            ],
            style: AlertStyle(
              backgroundColor: secondayrColor,
              alertBorder: Border(),
              titleStyle: TextStyle(color: appWhite),
            ),
          ).show();
        },
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
