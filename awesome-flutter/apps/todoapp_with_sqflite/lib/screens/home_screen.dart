import 'package:flutter/material.dart';
import 'package:todoapp_with_sqflite/helpers/drawer_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
      ),
      drawer: DrawerNavigation(),
    );
  }
}
