import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';
import 'package:todoey/utils/database/database_helper.dart';
import 'package:todoey/utils/todo_modal.dart';
import 'package:todoey/widgets/alert_form.dart';
import 'package:todoey/widgets/todo_container.dart';
import 'package:todoey/widgets/todo_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper databaseHelper;
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    databaseHelper = DatabaseHelper();
    getAllTodos();
  }

  void getAllTodos() async {
    setState(() => widgetList = []);
    List todos = await databaseHelper.readData();

    for (int index = 0; index != todos.length; index++) {
      final dbTodo = Map.of(todos.reversed.toList()[index]);
      Todo todo = Todo(
        done: dbTodo['done'] == 1,
        title: dbTodo['title'],
      );
      todo.id = dbTodo['id'];

      setState(() {
        widgetList.add(TodoContainer(
          title: todo.title,
          isResolved: todo.done,
          id: todo.id,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appGreen,
        child: Icon(Icons.add, size: 30.0),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertForm(updateScreen: getAllTodos);
            },
          );
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Todos",
              style: TextStyle(
                color: appWhite,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            TodoList(widgetList: widgetList),
          ],
        ),
      ),
    );
  }
}
