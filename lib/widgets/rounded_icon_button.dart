import 'package:flutter/material.dart';
class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.child, this.onPressed});
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: child,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: CircleBorder(side: BorderSide(style: BorderStyle.solid)),
      fillColor: Colors.blueGrey,
      onPressed: onPressed,
    );
  }
}
