import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';
import 'package:todoey/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appGreen,
        child: Icon(Icons.add, size: 30.0),
        onPressed: () {},
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
            TodoList(),
          ],
        ),
      ),
    );
  }
}
