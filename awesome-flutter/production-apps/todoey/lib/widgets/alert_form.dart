import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';
import 'package:todoey/utils/database/database_helper.dart';
import 'package:todoey/utils/todo_modal.dart';

class AlertForm extends StatefulWidget {
  @override
  _AlertFormState createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  DatabaseHelper databaseHelper;

  String todoTitle;

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
  }

  void createTodo() async {
    Todo todo = Todo(title: todoTitle, done: false);
    await databaseHelper.insertData(todo.convertToDb());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appSecondayrColor,
      title: Text(
        "New Todo",
        style: TextStyle(color: appWhite),
      ),
      content: TextField(
        style: TextStyle(color: appWhite),
        cursorColor: appGreen,
        onChanged: (String value) => todoTitle = value,
        decoration: InputDecoration(
          labelText: "I wanna do ...",
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appGreen, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appGreen, width: 1.0),
          ),
        ),
      ),
      actions: [
        FlatButton(
          child: Text("cancel"),
          textColor: Colors.redAccent,
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text("create"),
          textColor: appGreen,
          onPressed: () {
            if (todoTitle != null) {
              createTodo();
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }
}
