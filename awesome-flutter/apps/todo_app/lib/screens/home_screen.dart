import 'package:flutter/material.dart';
import 'package:todo_app/contanst.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/todo_helper.dart';
import 'package:todo_app/widgets/todo_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _newTodoController = TextEditingController();
  var _todo = Todo();

  TodoHelper _todoHelper = TodoHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30.0),
        backgroundColor: accentColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: secondayrColor,
                title: Text(
                  "Create Todo",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                content: TextField(
                  controller: _newTodoController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Whats todo ??',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: accentColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: accentColor, width: 2),
                    ),
                  ),
                ),
                actions: [
                  FlatButton(
                    child: Text("Cancel"),
                    textColor: Colors.redAccent,
                    onPressed: () {
                      _newTodoController.text = '';
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("Create"),
                    textColor: accentColor,
                    onPressed: () async {
                      if (!_newTodoController.text.isEmpty) {
                        _todo.title = _newTodoController.text;
                        _todo.isResolved = false;
                        await _todoHelper.insertData(_todo.todoMap());
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        children: [
          Text(
            "Todos",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 50.0),
          TodoContainer(),
          TodoContainer(),
          TodoContainer(),
          TodoContainer(),
          TodoContainer(),
          TodoContainer(),
          TodoContainer(),
        ],
      ),
    );
  }
}
