import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  Block({@required this.widgetColor, this.cardChild, this.onPress});

  final Color widgetColor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widgetColor,
        ),
      ),
    );
  }
}
