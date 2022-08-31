import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class IconDetails extends StatelessWidget {
  final IconData iconImage;
  final String iconText;

  IconDetails(this.iconImage, this.iconText);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Icon(
            iconImage,
            size: 80.0,
          ),
          SizedBox(
              height: 15.0
          ),
          Text(
              iconText,
              style: kLabelTextStyle
          )
        ]
    );
  }
}