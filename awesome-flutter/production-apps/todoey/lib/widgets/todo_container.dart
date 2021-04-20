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
  String _title;
  bool _isResolved;

  @override
  void initState() {
    super.initState();
    _isResolved = widget.isResolved;
    _title = widget.title;
  }

  void resolveTask() {
    setState(() {
      _isResolved = !_isResolved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: resolveTask,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        margin: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: _isResolved ? appGreen : appSecondayrColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          _title,
          style: TextStyle(
            color: appWhite,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
