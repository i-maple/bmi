import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});
  int height;
  int weight;
  double _bmi;

  String calculateBMI() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMI() {
    if (_bmi >= 18.5) {
      return 'You\'re balanced weight';
    } else if (_bmi > 22) {
      return 'You\'re overweight';
    } else {
      return 'You\'re underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 18.5) {
      return 'Cool! Your weight is balanced. You need to keep up.';
    } else if (_bmi > 22) {
      return 'You need to maintain body by exercising a bit more.';
    } else {
      return 'You need to eat more. Your body is seriously underweight.';
    }
  }
}
