import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldModel {
  TextEditingController? controller;
  String? Function(String? input)? validator;
  Function(String? data)? onChange;
  InputDecoration? inputDecoration;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  bool obscureText;
  TextStyle? textStyle;
  bool? readOnly;
  List<TextInputFormatter>? inputFormaters;
  Future<void> Function(String? value)? onSubmit;
  void Function()? onComplete;

  TextFieldModel({
    this.inputFormaters,
    this.obscureText = false,
    this.textInputAction,
    this.keyboardType,
    this.inputDecoration,
    this.controller,
    this.onChange,
    this.textStyle,
    this.validator,
    this.onSubmit,
    this.readOnly=false,
    this.onComplete
  });
}
