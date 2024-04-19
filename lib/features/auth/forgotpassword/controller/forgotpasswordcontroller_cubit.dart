import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';

part 'forgotpasswordcontroller_state.dart';

class ForgotpasswordcontrollerCubit
    extends Cubit<ForgotpasswordcontrollerState> {
  ForgotpasswordcontrollerCubit() : super(ForgotpasswordcontrollerInitial());

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  Future<void> confirmForgotPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        FireBaseModel.email = emailController.text;
        await FireBaseModel().resetPassword();
        FireBaseModel().showToast(context, message: "Success");
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    } else {
      print("invaild inputs");
    }
  }
}
