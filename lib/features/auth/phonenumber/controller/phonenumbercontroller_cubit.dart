import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/validation.dart';

part 'phonenumbercontroller_state.dart';

class PhonenumbercontrollerCubit extends Cubit<PhonenumbercontrollerState> {
  PhonenumbercontrollerCubit() : super(PhonenumbercontrollerInitial());

  GlobalKey<FormState> phoneKey = GlobalKey();


  TextEditingController phoneController = TextEditingController();

  String countrycode = '';


  void confirmSubmitPhoneNumber(
      { required BuildContext context,
        required PhonenumbercontrollerCubit phoneNumberController }) async {
    if (Validation().validatePhone(phoneController.text)) {
      FireBaseModel.getInstance().phonenumber = countrycode
          + phoneController.text;
      await FireBaseModel.getInstance().verifyPhoneNumber(context: context,
          controller: phoneNumberController);

    } else {

      if (phoneController.text.isEmpty) {
        FireBaseModel.getInstance().showToast(context,
            message: "Please Enter Phone Number");
      }
      else {

        FireBaseModel.getInstance().showToast(context,
            message: "Please Enter Valid Phone Number");
      }
    }
  }


}
