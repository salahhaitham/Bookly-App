import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButton1 extends StatelessWidget {
  TextButton1({
    super.key,
    required this.backgroundcolor,
    required this.textcolor,
    required this.buttonBorderRadious,
    required this.textbutton,
    required this.onpress
  });

  final Color backgroundcolor;
  final Color textcolor;
  final BorderRadius buttonBorderRadious;
  final String textbutton;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: Text(textbutton , style: TextStyle(color: textcolor,fontSize: 18,fontWeight: FontWeight.w900)),
      style: TextButton.styleFrom(
        backgroundColor: backgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: buttonBorderRadious
          ),

        ),

    );
  }
}
