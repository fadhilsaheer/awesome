import 'package:flutter/material.dart';
import 'package:todo_app/contanst.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30.0),
        backgroundColor: accentColor,
        onPressed: () {},
      ),
    );
  }
}
