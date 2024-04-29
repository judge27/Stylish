import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Core {
  static Core instance = Core._init();

  Core._init();

  // Auth button view with custom Title
  Container coreButton({double? height, required String buttonText,BoxDecoration? decoration}) {
    return Container(
      height: height ?? 55,
      decoration: decoration??=boxDecoration,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  // Button Decoration Object
  BoxDecoration boxDecoration = BoxDecoration(
      color: const Color(0xFFF83758), borderRadius: BorderRadius.circular(4));

  // Auth TextField Decoration Object
  InputDecoration authInputDecoration = InputDecoration(
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

  // auth textField Style Object
  TextStyle authTextStyle = const TextStyle(
    color: Color(0xFF676767),
    fontSize: 16,
  );

  // User TextField Decoration Object
  InputDecoration userInputDecoration = const InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 8),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: "Full Name",
    labelStyle: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    hintStyle: TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    errorStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
    ),
  );

  // user textField Style Object
  TextStyle userTextStyle = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700);
}
