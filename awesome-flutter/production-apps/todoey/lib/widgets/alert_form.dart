import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';
import 'package:todoey/utils/database/database_helper.dart';
import 'package:todoey/utils/todo_modal.dart';

class AlertForm extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();
  String todoTitle;

  void createTodo() {
    Todo todo = Todo(title: todoTitle, done: false);
    databaseHelper.insertData(todo.convertToDb());
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
