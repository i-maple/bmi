import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/const.dart';

class ColumnReusable extends StatelessWidget {
  ColumnReusable({@required this.iconG, @required this.genderG});

  final iconG;
  final genderG;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconG,
          size: 80,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderG,
          style: kTextStyle,
        )
      ],
    );
  }
}
