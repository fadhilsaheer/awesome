import 'package:flutter/material.dart';
import '../consts.dart';

class TopIcon extends StatelessWidget {
  TopIcon({@required this.text, @required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        SizedBox(height: 15),
        Text(text, style: labelStyle)
      ],
    );
  }
}
