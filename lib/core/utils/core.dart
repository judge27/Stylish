import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Core {
  // Auth button view with custom Title
  static Container coreButton(String buttonText) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: const Color(0xFFF83758),
          borderRadius: BorderRadius.circular(4)),
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  // TextField Decoration Object
  InputDecoration inputDecoration = InputDecoration(
    hintText: "Your Name",
    errorStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
    hintStyle: const TextStyle(
        color: Color(0xFF676767),
        fontSize: 17,
        fontWeight: FontWeight.w800,
        fontFamily: "Montserrat"),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFA8A8A9),
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFA8A8A9),
        )),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Color(0xFFA8A8A9),
        )),
    filled: true,
    fillColor: Color(0xFFF3F3F3),
    prefixIcon: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Icon(
        Icons.person,
        color: Color(0xFF626262),
        size: 30,
      ),
    ),
  );
}
