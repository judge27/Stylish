import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylish/model/textinput_model.dart';
import 'package:stylish/view/onboard_page1.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, required this.item});

  final TextInputModel item;
  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: widget.item.fillBorderColor,
            borderRadius: BorderRadius.circular(widget.item.borderRadius),
            border: Border.all(color: widget.item.boderColor)),
        child: TextFormField(
          validator: (data) {
            if (data!.isEmpty) {
              return "Value Is Required!";
            }
          },
          onChanged: widget.item.onChange,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  widget.item.prefixIcon,
                  color: widget.item.prefixIconColor,
                  size: 30,
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: widget.item.contentPadding),
              hintText: widget.item.hint,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    if (!widget.item.obscureText!) {
                      widget.item.suffixIcon = CupertinoIcons.eye_slash_fill;
                      widget.item.obscureText = true;
                    } else {
                      widget.item.suffixIcon = Icons.remove_red_eye;
                      widget.item.obscureText = false;
                    }
                  });
                },
                child: Icon(
                  widget.item.suffixIcon,
                  color: widget.item.prefixIconColor,
                  size: 30,
                ),
              ),
              hintStyle: TextStyle(
                color: widget.item.hintColor,
                fontSize: widget.item.hintsize,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w800,
              )),
          obscureText: widget.item.obscureText!,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w800,
            color: widget.item.hintColor,
            fontSize: widget.item.hintsize,
          ),
          textInputAction: widget.item.inputAction,
        ),
      ),
    );
  }
}
