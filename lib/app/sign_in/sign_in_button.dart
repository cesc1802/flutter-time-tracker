import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/widgets/customm_raised_button.dart';

class SignInButton extends CustomRaiseButton {
  SignInButton(
      {String text, Color color, Color textColor,VoidCallback onPressed})
      : super(
            child:
                Text(text, style: TextStyle(color: textColor, fontSize: 15.0)),
            color: color,
            onPressed: onPressed);
}
