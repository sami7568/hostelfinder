import 'package:flutter/material.dart';

class CustomBlueOutlinedButton extends StatelessWidget {
  final onPressed;
  final child;

  CustomBlueOutlinedButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      onPressed: onPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10), child: child),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    );
  }
}
