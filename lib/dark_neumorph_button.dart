import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class DarkNeumorphButton extends StatelessWidget {
  double radius;
  double height;
  double width;
  Color textColor;
  String buttonText;
  double fontSize;
  VoidCallback onPressed;
  DarkNeumorphButton({
    super.key,
    this.radius = 50,
    this.height = 80,
    this.width = 100,
    required this.buttonText,
    this.textColor = Colors.white,
    this.fontSize = 20,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // margin: EdgeInsets.symmetric(horizontal: 20),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              //bottom right shadow is darker
              const BoxShadow(
                color: Colors.black,
                offset: Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1,
              ),

              //bottom left shadow is lighter
              BoxShadow(
                color: Colors.grey.shade800,
                offset: const Offset(-5, -5),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
