import 'package:flutter/material.dart';

class CustomBlueRoundedButton extends StatelessWidget {
  final onPressed;
  final child;

  CustomBlueRoundedButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: child,
      ),
      color: Colors.blue,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40))),
    );
  }
}
