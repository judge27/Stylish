import 'package:flutter/material.dart';
import 'package:stylish/model/textinput_model.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key, required this.item}) : super(key: key);

  final TextInputModel item;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  bool showError =false;
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: widget.item.fillBorderColor,
              borderRadius: BorderRadius.circular(widget.item.borderRadius),
              border: Border.all(
                color: widget.item.boderColor,
              )),
          child: TextFormField(
            validator: (data) {
              setState(() {
                if (data!.isEmpty) {

                   showError = true;

                } else {

                   showError = false;

                }
              });


            },
            onChanged: widget.item.onChange,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.item.contentPadding),
                child: Icon(
                  widget.item.prefixIcon,
                  color: widget.item.prefixIconColor,
                  size: 30,
                ),
              ),
              border: InputBorder.none,
              hintText: widget.item.hint,
              hintStyle: TextStyle(
                color: widget.item.hintColor,
                fontSize: widget.item.hintsize,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w800,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.item.obscureText = !widget.item.obscureText!;
                  });
                },
                child: Icon(
                  widget.item.obscureText! ? Icons.visibility : Icons.visibility_off,
                  color: widget.item.prefixIconColor,
                  size: 30,
                ),
              ),
            ),
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
        if (showError)
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Text(
              "Value Is Required!",
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
