import 'package:flutter/material.dart';
import 'package:todoey/utils/database/database_helper.dart';
import 'package:todoey/utils/todo_modal.dart';
import 'package:todoey/widgets/todo_container.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DatabaseHelper databaseHelper;

  List<Todo> _list = [
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
    Todo(title: "Create an app", done: false),
  ];

  List<Widget> _widgetList = List<Widget>();

  @override
  void initState() {
    super.initState();

    databaseHelper = DatabaseHelper();
    for (int index = 0; index != _list.length; index++) {
      Todo todo = _list[index];
      _widgetList.add(TodoContainer(
        title: todo.title,
        isResolved: todo.done,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: _widgetList,
      ),
    );
  }
}