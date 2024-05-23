
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/core/constants/constants.dart';

import '../../features/dashboard/modules/addproduct/controller/cubit/newproductcontroller_cubit.dart';

class Core {
  static Core instance = Core._init();

  Core._init();

  // Auth button components with custom Title
  Container coreButton(
      {double? height, required String buttonText, BoxDecoration? decoration,required BuildContext context}) {
    return Container(
      height: height ?? 55,
      decoration: decoration ??= BoxDecoration(
          color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(4))
      ,
      alignment: Alignment.center,
      child: Text(
        buttonText,
        style:  TextStyle(
            color:Theme.of(context).hoverColor , fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  // Auth TextField Decoration Object
  InputDecoration authInputDecoration (BuildContext context) {
    return InputDecoration(
      hintText: "Your Name",
      errorStyle: TextStyle(
        color: Theme.of(context).primaryColor,
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
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
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
      fillColor: const Color(0xFFF3F3F3),
      prefixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Icon(
          Icons.person,
          color: Color(0xFF626262),
          size: 30,
        ),
      ),
    ); }

    // auth textField Style Object
    TextStyle authTextStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
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
      filled: true,
      fillColor: Color(0xFFF3F3F3),
    );

    // user textField Style Object
    TextStyle userTextStyle = const TextStyle(
        color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold);


}

