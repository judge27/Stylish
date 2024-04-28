import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/firebase.dart';

part 'forgotpasswordcontroller_state.dart';

class ForgotpasswordcontrollerCubit
    extends Cubit<ForgotpasswordcontrollerState> {
  ForgotpasswordcontrollerCubit() : super(ForgotpasswordcontrollerInitial());

  // key object of the forgotPassword page form
  GlobalKey<FormState> formKey = GlobalKey();


  // controller object of email textField
  TextEditingController emailController = TextEditingController();

  // forgot password of the user method
  Future<void> confirmForgotPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        FireBaseModel.instance.email = emailController.text;
        await FireBaseModel.instance.resetPassword();
        context.showToastMessage = "Success";
      } on FirebaseAuthException catch (e) {
        context.showToastMessage = e.toString();
      }
    }
  }
}
