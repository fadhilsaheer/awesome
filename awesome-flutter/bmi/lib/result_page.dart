import 'package:flutter/material.dart';
import './consts.dart';

import './widgets/block.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.feedback, this.resultText});

  final String bmiResult;
  final String resultText;
  final String feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result", style: titleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: Block(
              widgetColor: primaryWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: textStyle),
                  Text(bmiResult, style: bmiTextStyle),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      feedback,
                      textAlign: TextAlign.center,
                      style: bodyTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: bottomButtonColor,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 80,
            child: GestureDetector(
              child:
                  Center(child: Text("RE-CALCULATE", style: largeButtonStyle)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
