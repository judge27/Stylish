import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';

part 'verificationcontroller_state.dart';

class VerificationcontrollerCubit extends Cubit<VerificationcontrollerState> {
  VerificationcontrollerCubit() : super(VerificationcontrollerInitial());

  // key object of the verification page form
  GlobalKey<FormState> verificationKey = GlobalKey();

  // controller object of verification textField
  TextEditingController verificationController = TextEditingController();

  // smsCode variable
  String smsCode = "";


  // verify smsCode Method
  Future<void> confirmVerification({required BuildContext context}) async {
    if (verificationKey.currentState!.validate()) {
      await FireBaseModel.instance
          .verifySmsCode(context: context, smsCode: smsCode);

    } else {

          context.showToastMessage = "Please Enter Full Sms Code";
    }
  }
  // resend smsCode method
  Future<void> onResendCode(
      {required BuildContext context,
      required PhonenumbercontrollerCubit phoneNumberController}) async {
    if (FireBaseModel.instance.resendCode) {
      await FireBaseModel.instance.verifyPhoneNumber(
        context: context,
        controller: phoneNumberController,
      );
      context.showToastMessage = "Code Resent";
    } else {
     context.showToastMessage = "Can't Resend Code Now";
    }
  }
}
