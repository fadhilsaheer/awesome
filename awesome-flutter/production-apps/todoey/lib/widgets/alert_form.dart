import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';

class AlertForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appSecondayrColor,
      title: Text("New Todo"),
    );
  }
}
