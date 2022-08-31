import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_details.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  Color maleCardColor = kCardBackground;
  Color femaleCardColor = kCardBackground;
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleCardSelected = false;
  bool femaleCardSelected = false;
  Gender selectedGender = null;
  int height = 24;

  String convertToFeet(int inches) {
    int numOfFeet = (inches / 12).floor();
    int totalFeet = numOfFeet * 12;
    int remainderInches = inches - totalFeet;

    return "$numOfFeet' $remainderInches\"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender == Gender.male
                          ? selectedGender = null
                          : selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kSelectedCardColor
                      : kCardBackground,
                  cardChild: IconDetails(FontAwesomeIcons.mars, "MALE"),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender == Gender.female
                            ? selectedGender = null
                            : selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kSelectedCardColor
                        : kCardBackground,
                    cardChild: IconDetails(FontAwesomeIcons.venus, "FEMALE")),
              ),
            ])),
            Expanded(
              child: ReusableCard(
                  color: kCardBackground,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height", style: kLabelTextStyle),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              convertToFeet(height),
                              style: kNumberTextStyle,
                            ),
                          ]),
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15),
                          activeTrackColor: Colors.purple,
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 25)),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: kMinHeight,
                            max: kMaxHeight,
                          ))
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                          color: kCardBackground,
                          cardChild:
                              IconDetails(FontAwesomeIcons.android, "DELETE"))),
                  Expanded(
                      child: ReusableCard(
                          color: kCardBackground,
                          cardChild:
                              IconDetails(FontAwesomeIcons.poop, "poop"))),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
