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
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: secondayrColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "My awesome todo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: accentColor),
                child: Checkbox(
                  value: true,
                  activeColor: accentColor,
                  onChanged: (val) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
