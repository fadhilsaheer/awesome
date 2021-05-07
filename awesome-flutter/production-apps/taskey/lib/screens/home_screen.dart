import 'package:flutter/material.dart';
import 'package:taskey/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appPrimaryColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.0),
                Text(
                  "Taskey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontFamily: 'font',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Take notes, reminders, set targets,\ncollect resources, and secure privacy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 40.0),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 25.0,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  color: appPrimaryAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
