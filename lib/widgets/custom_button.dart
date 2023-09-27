import 'package:flutter/material.dart';
import 'package:pinme/utils/extensions.dart';

class CustomButton extends StatelessWidget {
  double? height;
  EdgeInsetsGeometry? margin;
  Color? buttonColor;
  Color? textColor;
  dynamic text;
  GestureTapCallback? onTap;
  CustomButton({
    super.key,
    this.margin,
    this.height,
    this.buttonColor,
    this.textColor,
    this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1.5.h
        ),
        margin: margin,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(1.5.w),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 1.8.t,
              fontWeight: FontWeight.w900,

            ),
          ),
        ),
      ),
    );
  }
}
