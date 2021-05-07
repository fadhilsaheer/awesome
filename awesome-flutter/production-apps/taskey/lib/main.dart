import 'package:flutter/material.dart';
import 'package:taskey/screens/home_screen.dart';

void main() {
  runApp(Taskey());
}

class Taskey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
