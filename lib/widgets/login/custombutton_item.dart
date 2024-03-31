import 'package:flutter/material.dart';
import 'package:stylish/model/custombutton_model.dart';

class CustomButtonItem extends StatelessWidget {
  final CustomButtonModel item;
  const CustomButtonItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GestureDetector(
      onTap: item.onTap,
      child: Container(
        height: item.height,
        decoration: BoxDecoration(
          color: item.fillColor,
          border: Border.all(color: item.boderColor!),
          borderRadius: BorderRadius.circular(item.boderRadius!),
        ),
        child: Center(
          child: Text(
            item.title!,
            style: TextStyle(
                color: item.titleColor,
                fontSize: item.fontSize,
                fontWeight: FontWeight.w900,
                fontFamily: "Montserrat"),
          ),
        ),
      ),
    ));
  }
}
