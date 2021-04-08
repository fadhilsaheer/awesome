import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/models/todo.dart';
import 'package:todoapp_with_sqflite/services/todo_service.dart';

class TodoScreenByCategory extends StatefulWidget {
  final String category;

  TodoScreenByCategory({this.category});

  @override
  _TodoScreenByCategoryState createState() => _TodoScreenByCategoryState();
}

class _TodoScreenByCategoryState extends State<TodoScreenByCategory> {
  List<Todo> _todoList = List<Todo>();
  TodoService _todoService = TodoService();

  @override
  void initState() {
    super.initState();
    getTodoByCategory();
  }

  getTodoByCategory() async {
    var todos = await _todoService.readTodosByCategory(widget.category);
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];

        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (BuildContext context, int index) {
          Todo _todoItem = _todoList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_todoItem.title),
                  ],
                ),
                subtitle: Text(_todoItem.description),
                trailing: Text(_todoItem.todoDate),
              ),
            ),
          );
        },
      ),
    );
  }
}
