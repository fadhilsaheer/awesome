import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        color: primaryColor,
        child: ListView(
          children: [
            Text(
              "Create Task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter title',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondayrColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appGreen, width: 2.0),
                ),
              ),
              style: TextStyle(
                color: appWhite,
              ),
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter description',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: secondayrColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appGreen, width: 2.0),
                ),
              ),
              style: TextStyle(
                color: appWhite,
              ),
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {},
              child: Text(
                "Create",
                style: TextStyle(
                  color: appWhite,
                  fontSize: 15.0,
                ),
              ),
              color: appGreen,
              elevation: 0.0,
            ),
            SizedBox(height: 2.0),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: appWhite,
                  fontSize: 15.0,
                ),
              ),
              color: appRed,
              elevation: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
