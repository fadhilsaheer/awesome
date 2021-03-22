import 'package:flutter/material.dart';

import '../config/palette.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
