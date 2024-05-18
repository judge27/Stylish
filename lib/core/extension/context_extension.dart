import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  set pushTo(String name) => Navigator.pushNamed(this, name);

  void get pop => Navigator.pop(this);

  set showToastMessage(String message) => Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(this).primaryColor,
        textColor: Colors.white,
        fontSize: 18.0,
  );
}
