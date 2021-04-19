import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: appGreen,
        child: Icon(Icons.add, size: 30.0),
        onPressed: () {},
      ),
      body: SingleChildScrollView(),
    );
  }
}
