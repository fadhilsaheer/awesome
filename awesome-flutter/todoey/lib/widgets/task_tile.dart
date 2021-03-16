import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Learn flutter"),
      trailing: Checkbox(
        value: false,
      ),
    );
  }
}
