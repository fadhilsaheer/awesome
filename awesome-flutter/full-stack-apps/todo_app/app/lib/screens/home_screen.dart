import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appGreen,
        child: Icon(Icons.add, color: appWhite, size: 30.0),
        onPressed: () {},
      ),
    );
  }
}
