import 'package:flutter/material.dart';
import 'package:todoey/utils/constanst.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
