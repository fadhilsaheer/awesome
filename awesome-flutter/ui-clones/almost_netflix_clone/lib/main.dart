import 'package:almost_netflix_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix Clone UI',
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
