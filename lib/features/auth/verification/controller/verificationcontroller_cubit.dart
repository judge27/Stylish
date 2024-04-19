import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/validation.dart';

part 'verificationcontroller_state.dart';

class VerificationcontrollerCubit extends Cubit<VerificationcontrollerState> {
  VerificationcontrollerCubit() : super(VerificationcontrollerInitial());

  GlobalKey<FormState> phoneKey = GlobalKey();
  GlobalKey<FormState> verificationKey = GlobalKey();

  TextEditingController phoneController = TextEditingController();

  TextEditingController verificationController = TextEditingController();

  String smscode = "";
  String countrycode = '';
  String message = "";
  String verificationId = "";

  void confirmSubmitPhoneNumber(
      {required BuildContext context,
      required VerificationcontrollerCubit controller}) async {
    if (Validation().validatePhone(phoneController.text)) {
      FireBaseModel.phonenumber = countrycode + phoneController.text;
      await FireBaseModel()
          .verifyPhoneNumber(context: context, controller: controller);
      FireBaseModel().showToast(context, message: "Code Sent");
      Navigator.pushNamed(context, 'otp', arguments: controller);
    } else {
      if (phoneController.text.isEmpty) {
        FireBaseModel()
            .showToast(context, message: "Please Enter Phone Number");
      } else {
        FireBaseModel()
            .showToast(context, message: "Please Enter Valid Phone Number");
      }
    }
  }

  Future<void> confirmVerification(
      {required BuildContext context,
      required VerificationcontrollerCubit controller}) async {
    if (verificationKey.currentState!.validate()) {
      await FireBaseModel()
          .verifyCode(context: context, controller: controller);
    }
  }
}
