import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';

class TodoContainer extends StatefulWidget {
  final String title;
  final bool isResolved;

  TodoContainer({this.isResolved, this.title});

  @override
  _TodoContainerState createState() => _TodoContainerState();
}

class _TodoContainerState extends State<TodoContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        color: widget.isResolved ? appGreen : appSecondayrColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        widget.title,
        style: TextStyle(
          color: appWhite,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
