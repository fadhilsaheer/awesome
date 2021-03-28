import 'package:app/models/task_model.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:app/data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _appList = [
    Text(
      "My Tasks",
      style: TextStyle(
        color: appWhite,
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    SizedBox(height: 20.0),
  ];

  @override
  void initState() {
    super.initState();

    for (Task _task in taskList) {
      _appList.add(TaskContainer());
    }
  }

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
