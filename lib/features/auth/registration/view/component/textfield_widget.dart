import 'package:flutter/material.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.model});
 final TextFieldModel model;
  @override

  Widget build(BuildContext context) {

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: model.onChange,
      controller: model.controller,
      validator: model.validator,
      decoration: model.inputDecoration,
      keyboardType: model.keyboardType,
      textInputAction: model.textInputAction,
      style: model.textStyle,
      obscureText: model.obscureText,
      inputFormatters: model.inputFormaters,
    );
  }




}
