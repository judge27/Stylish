import 'package:flutter/material.dart';

class TextInputModel {
  final IconData prefixIcon;
  final String hint;
  final TextInputAction inputAction;
  final Color fillBorderColor;
  final TextInputType inputType;
  final Color hintColor;
  final double hintsize;
  final Color prefixIconColor;
  final Color boderColor;
  final double borderRadius;
  final double contentPadding;
  IconData? suffixIcon;
  bool? obscureText;
  void Function(String)? onChange;

  TextInputModel({
    this.suffixIcon,
    this.obscureText,
    required this.hintsize,
    required this.hintColor,
    required this.prefixIconColor,
    required this.boderColor,
    required this.borderRadius,
    required this.contentPadding,
    required this.inputType,
    required this.fillBorderColor,
    required this.hint,
    required this.inputAction,
    required this.prefixIcon,
    this.onChange,
  });
}
