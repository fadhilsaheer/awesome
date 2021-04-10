import 'package:flutter/material.dart';
import 'package:todo_app/contanst.dart';
import 'package:todo_app/widgets/todo_container.dart';

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
