import 'package:flutter/material.dart';
import 'package:stylish/model/textinput_model.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required this.item,
  });

  final TextInputModel item;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  bool showError=false;
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
                errorMaxLines:1,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.item.contentPadding),
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
                    fontWeight: FontWeight.w800,
                    fontFamily: "Montserrat")),
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w800,
              color: widget.item.hintColor,
              fontSize: widget.item.hintsize,
            ),
            keyboardType: widget.item.inputType,
            textInputAction: widget.item.inputAction,
          ),
        ),
        const SizedBox(
            height: 2), // Adjust the spacing between container and error text
        if (showError)
          const Text(
            "Value Is Required!", // Customize error message here
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
