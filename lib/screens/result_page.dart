import 'package:bmi_calculator/widgets/reusable_container.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/const.dart';

class MySecondpage extends StatelessWidget {
  MySecondpage({this.getResult, this.getInterPretation, this.getBmi});

  final String getResult;
  final String getInterPretation;
  final String getBmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableContainer(
              colour: kCardColorUnchecked,
              cardChild: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        getResult,
                        style: TextStyle(fontSize: 20.0, color: Colors.green),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '20.4',
                        style: kNumberTextStyle,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      'DATA ',
                      style: TextStyle(fontSize: 20.0),
                    ))
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
