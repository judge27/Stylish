import 'package:flutter/material.dart';

class AuthModel {
  static String? email;
  static String? password;
  static String? password2;


 static void showSnackBar(BuildContext context, {required String message}) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}