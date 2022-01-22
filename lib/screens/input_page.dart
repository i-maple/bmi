import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/reusable_column.dart';
import 'package:bmi_calculator/widgets/reusable_container.dart';
import 'package:bmi_calculator/constants/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/last_row_wid.dart';
import 'package:bmi_calculator/calc_brain.dart';

enum GenderName { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderName genderName;
  int sliderHeight = 180;
  int weight = 60;
  int age = 24;
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
                  child: ReusableContainer(
                    onPress: () {
                      genderName = GenderName.male;
                    },
                    colour: genderName == GenderName.male
                        ? kCardColorChecked
                        : kCardColorUnchecked,
                    cardChild: ColumnReusable(
                      iconG: FontAwesomeIcons.mars,
                      genderG: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      genderName = GenderName.female;
                    },
                    colour: genderName == GenderName.female
                        ? kCardColorChecked
                        : kCardColorUnchecked,
                    cardChild: ColumnReusable(
                      iconG: FontAwesomeIcons.venus,
                      genderG: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: kCardColorUnchecked,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(sliderHeight.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      min: 120,
                      max: 220,
                      value: sliderHeight.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          sliderHeight = newValue.round();
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
                  child: ReusableContainer(
                    colour: kCardColorUnchecked,
                    cardChild: LastRowWid(
                      onPressedPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onPressedMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      titleText: 'WEIGHT',
                      numValue: weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                      colour: kCardColorUnchecked,
                      cardChild: LastRowWid(
                        numValue: age,
                        onPressedMinus: () {
                          setState(() {
                            age--;
                          });
                        },
                        onPressedPlus: () {
                          setState(() {
                            age++;
                          });
                        },
                        titleText: "AGE",
                      )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              String bmi = BmiCalculator(height: sliderHeight, weight: weight)
                  .calculateBMI();
              String weightState =
                  BmiCalculator(height: sliderHeight, weight: weight).getBMI();
              String interpretation =
                  BmiCalculator(height: sliderHeight, weight: weight)
                      .getInterpretation();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MySecondpage(
                            getResult: weightState,
                            getBmi: bmi,
                            getInterPretation: interpretation,
                          )));
            },
            child: Container(
              height: kBottomContainerHeight,
              color: kBottomContainerColor,
              width: double.infinity,
              child: Center(
                  child: Text(
                'Calculate',
                style: TextStyle(fontSize: 30.0),
              )),
            ),
          )
        ],
      ),
    );
  }
}
