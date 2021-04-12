import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/contanst.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoContainer extends StatefulWidget {
  final Todo todo;
  final Function getAllTodos;

  TodoContainer({this.todo, this.getAllTodos});

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(rng.nextInt(1299834).toString()),
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondayrColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.todo.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: accentColor),
                  child: Checkbox(
                    value: widget.todo.isResolved,
                    activeColor: accentColor,
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
