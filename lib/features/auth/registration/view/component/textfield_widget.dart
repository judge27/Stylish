import 'package:flutter/material.dart';
import 'package:stylish/features/auth/registration/model/textfield_model.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key,required this.item});
  TextFieldModel item;
  @override
  // String? hintText;

  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: item.onChange,
      controller: item.controller,
      validator:item.validator,
      decoration: item.inputDecoration,
      keyboardType: item.keyboardType,
      textInputAction: item.textInputAction,
      style: textStyle,
      obscureText: item.obscureText,
      inputFormatters: item.inputFormaters,
    );
  }

  static TextStyle textStyle = const TextStyle(
    color: Color(0xFF676767),
    fontSize: 16,
  );


}
