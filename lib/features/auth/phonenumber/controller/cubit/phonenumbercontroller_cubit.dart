import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/utils/validation.dart';

part 'phonenumbercontroller_state.dart';

class PhonenumbercontrollerCubit extends Cubit<PhonenumbercontrollerState> {
  PhonenumbercontrollerCubit() : super(PhonenumbercontrollerInitial());

  // key object of the phoneNumber page form
  GlobalKey<FormState> phoneKey = GlobalKey();

  //  // controller object of phone textField
  TextEditingController phoneController = TextEditingController();

  // country code variable
  String countrycode = '';

  // submit phone number Method
  void confirmSubmitPhoneNumber(
      {required BuildContext context,
      required PhonenumbercontrollerCubit phoneNumberController}) async {
    if (Validation.instance.validatePhone(phoneController.text)) {
      FireBaseModel.instance.phonenumber = countrycode + phoneController.text;

      await FireBaseModel.instance.verifyPhoneNumber(
          context: context, controller: phoneNumberController);

    } else {
      if (phoneController.text.isEmpty) {
        context.showToastMessage = "Please Enter Phone Number";
      } else {
        context.showToastMessage = "Please Enter Valid Phone Number";
      }
    }
  }
}
