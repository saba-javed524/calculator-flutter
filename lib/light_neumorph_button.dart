import 'package:flutter/material.dart';

class LightNeumorphButton extends StatelessWidget {
  VoidCallback onPressed;
  LightNeumorphButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Text(
              '=',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // margin: EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.teal[900],
            borderRadius: BorderRadius.circular(10),
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
                offset: Offset(-5, -5),
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
