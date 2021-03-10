import 'package:flutter/material.dart';

class CustomRaiseButton extends StatelessWidget {
  CustomRaiseButton(
      {this.child, this.color, this.borderRadius: 2.0, this.height: 40.0, this.onPressed});

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      ),
    );
  }
}
