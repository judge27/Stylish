import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/features/auth/phonenumber/controller/phonenumbercontroller_cubit.dart';

part 'verificationcontroller_state.dart';

class VerificationcontrollerCubit extends Cubit<VerificationcontrollerState> {
  VerificationcontrollerCubit() : super(VerificationcontrollerInitial());

  GlobalKey<FormState> verificationKey = GlobalKey();

  TextEditingController verificationController = TextEditingController();
  String smsCode = "";

  StreamController<ErrorAnimationType> errorController = StreamController();

  Future<void> confirmVerification({required BuildContext context}) async {
    if (verificationKey.currentState!.validate()) {
      await FireBaseModel.getInstance()
          .verifySmsCode(context: context, smsCode: smsCode);
    } else {
      FireBaseModel.getInstance()
          .showToast(context, message: "Please Enter Full Sms Code");
    }
  }

  Future<void> onResendCode(
      {required BuildContext context,
      required PhonenumbercontrollerCubit phoneNumberController}) async {
    if (FireBaseModel.getInstance().resendCode) {
      await FireBaseModel.getInstance().verifyPhoneNumber(
        context: context,
        controller: phoneNumberController,
      );
      FireBaseModel.getInstance().showToast(context, message: "Code Resent");
    } else {
      FireBaseModel.getInstance()
          .showToast(context, message: "Can't Resend Code Now");
    }
  }
}
