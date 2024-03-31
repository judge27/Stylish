import 'package:flutter/material.dart';

class CustomButtonModel {
  Function()? onTap;
  double? width;
  double? height;
  Color? boderColor;
  Color? fillColor;
  Color? titleColor;
  String? title;
  double? boderRadius;
  double? fontSize;
  CustomButtonModel({
    this.fillColor,
    this.titleColor,
    this.title,
    this.boderColor,
    this.onTap,
    this.boderRadius,
    this.fontSize,
    this.height,
    this.width
  });
}