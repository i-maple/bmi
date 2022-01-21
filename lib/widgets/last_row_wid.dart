import 'package:flutter/material.dart';
import 'rounded_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants/const.dart';

class LastRowWid extends StatelessWidget {
  LastRowWid(
      {this.numValue, this.onPressedMinus, this.onPressedPlus, this.titleText});

  final int numValue;
  final String titleText;
  final Function onPressedPlus;
  final Function onPressedMinus;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: kTextStyle,
        ),
        Text(
          numValue.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedIconButton(
              child: Icon(FontAwesomeIcons.minus),
              onPressed: onPressedMinus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundedIconButton(
              child: Icon(FontAwesomeIcons.plus),
              onPressed: onPressedPlus,
            ),
          ],
        )
      ],
    );
  }
}
