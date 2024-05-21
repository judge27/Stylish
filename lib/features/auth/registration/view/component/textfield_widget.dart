import 'package:flutter/material.dart';
import 'package:stylish/core/models/textfield_model.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.model});
 final TextFieldModel model;
  @override

  Widget build(BuildContext context) {

    return TextFormField(
      onEditingComplete: model.onComplete,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: model.onChange,
      readOnly: model.readOnly??false,
      controller: model.controller,
      validator: model.validator,
      onFieldSubmitted: model.onSubmit,
      decoration: model.inputDecoration,
      keyboardType: model.keyboardType,
      textInputAction: model.textInputAction,
      style: model.textStyle,
      obscureText: model.obscureText,
      inputFormatters: model.inputFormaters,
    );
  }




}
