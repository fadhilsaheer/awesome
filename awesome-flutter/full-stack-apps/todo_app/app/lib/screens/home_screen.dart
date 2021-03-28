import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:flutter/widgets.dart';

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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Tasks",
                  style: TextStyle(
                    color: appWhite,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.0),
                TaskContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
