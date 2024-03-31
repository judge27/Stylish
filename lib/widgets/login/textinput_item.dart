import 'package:flutter/material.dart';
import 'package:stylish/model/textinput_model.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.item,
  });

  final TextInputModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: item.fillBorderColor,
            borderRadius: BorderRadius.circular(item.borderRadius),
            border: Border.all(color: item.boderColor)),
        child: TextField(
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: item.contentPadding),
                child: Icon(
                  item.prefixIcon,
                  color: item.prefixIconColor,
                  size: 30,
                ),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              hintText: item.hint,
              hintStyle: TextStyle(
                  color: item.hintColor,
                  fontSize: item.hintsize,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Montserrat")),
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w800,
            color: item.hintColor,
            fontSize: item.hintsize,
          ),
          keyboardType: item.inputType,
          textInputAction: item.inputAction,
        ),
      ),
    );
  }
}
