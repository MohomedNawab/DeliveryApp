import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool? outlineBtn;

  CustomBtn({ this.text,  this.onPressed, this.outlineBtn });

  @override
  Widget build(BuildContext context) {

    bool _outlineBtn = outlineBtn ?? false;


    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.black,
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
              borderRadius: BorderRadius.circular(12.0)
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Stack(
          children: [
            Center(
              child: Text ( text ?? "Text",
              style: TextStyle(
                fontSize: 16.0,
                color: _outlineBtn ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
              )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
