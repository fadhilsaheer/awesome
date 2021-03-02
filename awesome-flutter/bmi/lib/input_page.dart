import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './result_page.dart';

import 'brain.dart';

// widgets
import './widgets/block.dart';
import './widgets/topIcon.dart';
import './widgets/roundIconBtn.dart';

// constants
import 'consts.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = primaryWidgetColor;
  Color femaleCardColor = secondaryWidgetColor;

  int height = 180;
  int weight = 30;
  int age = 20;

  void udateColor() {
    setState(() {
      Color temp = maleCardColor;
      maleCardColor = femaleCardColor;
      femaleCardColor = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Block(
                    onPress: udateColor,
                    widgetColor: maleCardColor,
                    cardChild: TopIcon(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: Block(
                    onPress: udateColor,
                    widgetColor: femaleCardColor,
                    cardChild: TopIcon(
                      icon: FontAwesomeIcons.venus,
                      text: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Block(
              widgetColor: primaryWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberStyle),
                      Text("cm", style: labelStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFEB1555),
                      overlayColor: Color(0x15EB1555),
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 50.0,
                      max: 360.0,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Block(
                    widgetColor: primaryWidgetColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: labelStyle),
                        Text(weight.toString(), style: numberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight != 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Block(
                    widgetColor: primaryWidgetColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: labelStyle),
                        Text(age.toString(), style: numberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age != 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomButtonColor,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            height: 80,
            child: GestureDetector(
              child: Center(child: Text("CALCULATE", style: largeButtonStyle)),
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResults(),
                      feedback: calc.getFeedback(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
