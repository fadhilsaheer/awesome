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
                  child: Text("Get Started"),
                  color: appPrimaryAccent,
                )
              ],
            ),
          ),
        ));
  }
}
