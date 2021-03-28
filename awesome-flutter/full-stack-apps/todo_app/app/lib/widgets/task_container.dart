import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class TaskContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("gesture detector");
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(top: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondayrColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name",
              style: TextStyle(
                color: appWhite,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15.0),
            Opacity(
              opacity: 0.5,
              child: Text(
                "Dolore et excepteur. Qui irure eiusmod duis commodo aliquip. Non et consequat reprehenderit esse.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              "12 Tasks",
              style: TextStyle(
                color: appGreen,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
