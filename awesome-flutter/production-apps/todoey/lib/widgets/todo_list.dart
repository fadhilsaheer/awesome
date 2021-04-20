import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todoey/utils/todo_modal.dart';
import 'package:todoey/widgets/todo_container.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> _list = [
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
    Todo(title: "Create an app", isResolved: false),
  ];

  List<Widget> _widgetList = List<Widget>();

  @override
  void initState() {
    super.initState();

    for (int index = 0; index != _list.length; index++) {
      Todo todo = _list[index];
      _widgetList.add(TodoContainer(
        title: todo.title,
        isResolved: todo.isResolved,
      ));
    }
  }

  void resolveTask(index) {
    setState(() {
      _list[index].isResolved = !_list[index].isResolved;
    });
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
