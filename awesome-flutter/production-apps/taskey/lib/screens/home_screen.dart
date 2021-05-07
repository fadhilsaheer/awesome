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
                Text(
                  "Taskey",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontFamily: 'font',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Take notes, reminders, saet targets,\ncollect resources, and secure privacy",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontFamily: 'nunito',
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 25.0,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20.0, fontFamily: 'nunito'),
                  ),
                  color: appPrimaryAccent,
                  textColor: Colors.white,
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
