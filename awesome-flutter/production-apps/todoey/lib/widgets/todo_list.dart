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

  List<Todo> _list = [];

  List<Widget> _widgetList = List<Widget>();

  @override
  void initState() {
    super.initState();

    databaseHelper = DatabaseHelper();
    getAllTodos();
  }

  void getAllTodos() async {
    var todos = await databaseHelper.readData();
    for (int index = 0; index != todos.length; index++) {
      final dbTodo = Map.of(todos[index]);
      Todo todo = Todo(
        done: dbTodo['done'] == 1,
        title: dbTodo['title'],
      );
      todo.id = dbTodo['id'];

      setState(() {
        _widgetList.add(TodoContainer(
          title: todo.title,
          isResolved: todo.done,
          id: todo.id,
        ));
      });
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
