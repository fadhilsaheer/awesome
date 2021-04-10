import 'package:flutter/material.dart';
import 'package:todo_app/contanst.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoContainer extends StatefulWidget {
  // final Todo todo;

  // TodoContainer({this.todo});

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFF17A589),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.blueGrey[900],
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
