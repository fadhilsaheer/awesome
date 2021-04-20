import 'package:flutter/material.dart';
import 'package:todoey/widgets/todo_container.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
          TodoContainer(title: "Create an app", isResolved: false),
        ],
      ),
    );
  }
}
