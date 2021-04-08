import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/helpers/drawer_navigation.dart';
import 'package:todoapp_with_sqflite/models/todo.dart';
import 'package:todoapp_with_sqflite/screens/todo_screen.dart';
import 'package:todoapp_with_sqflite/services/todo_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoService _todoService;

  List<Todo> _todoList = List<Todo>();

  @override
  void initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = List<Todo>();

    var todos = await _todoService.readTodos();

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
        title: Text("TodoList"),
      ),
      drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoScreen()),
          );
        },
        child: Icon(Icons.add),
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
                subtitle: Text(_todoItem.category),
                trailing: Text(_todoItem.todoDate),
              ),
            ),
          );
        },
      ),
    );
  }
}
