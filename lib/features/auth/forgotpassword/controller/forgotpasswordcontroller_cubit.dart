import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forgotpasswordcontroller_state.dart';

class ForgotpasswordcontrollerCubit extends Cubit<ForgotpasswordcontrollerState> {
  ForgotpasswordcontrollerCubit() : super(ForgotpasswordcontrollerInitial());
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void confirmForgotPassword(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'login', arguments: '');
    }
    else {
      print("invaild inputs");
    }
  }
}
