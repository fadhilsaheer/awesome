import 'package:flutter/material.dart';
import 'package:app/constants.dart';

class TaskCard extends StatelessWidget {
  final String task;

  TaskCard({this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: secondayrColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task,
            style: TextStyle(
              color: appWhite,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  "EDIT",
                  style: TextStyle(
                    color: appGreen,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "DELETE",
                  style: TextStyle(
                    color: appRed,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
