import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/helpers/drawer_navigation.dart';
import 'package:todoapp_with_sqflite/screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
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
    );
  }
}
