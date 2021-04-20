import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';

class TodoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      margin: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        color: appSecondayrColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        "todo item",
        style: TextStyle(
          color: appWhite,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
