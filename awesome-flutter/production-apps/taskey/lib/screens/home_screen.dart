import 'package:flutter/material.dart';
import 'package:taskey/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: ListView(
        children: [
          Text(
            "Taskey",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: 'font',
            ),
          ),
        ],
      ),
    );
  }
}
