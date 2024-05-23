import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'changephonenumber_state.dart';

class ChangephonenumberCubit extends Cubit<ChangephonenumberState> {
  static ChangephonenumberCubit instance=ChangephonenumberCubit();
  ChangephonenumberCubit() : super(ChangephonenumberInitial()){
    if(user.phoneNumber!="") {
      countryCode = user.phoneNumber.substring(0, 2);
      phoneNumber = user.phoneNumber.substring(3, user.phoneNumber.length);
    }
    phoneController.text=phoneNumber;
  }
  // key object of the phoneNumber page form
  GlobalKey<FormState> verificationKey = GlobalKey();

  //  // controller object of phone textField
  TextEditingController phoneController = TextEditingController();


  // controller object of verification textField
  TextEditingController verificationController = TextEditingController();

  // smsCode variable
  String smsCode = "";

  // verify the phone number method
  void onSendOTP(
      {required BuildContext context,
        required ChangephonenumberCubit phoneNumberController}) async {
    if (Validation.instance
        .validatePhone(context: context, value: phoneController.text))
    {
      try {
        context.showToastMessage = " ... Checking ...";
        phoneNumber=phoneController.text;
        await auth.verifyPhoneNumber(
          phoneNumber: countryCode+phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationIdd, int? resendToken) async {
            verificationId = verificationIdd;
            resendCode
                ? context.showToastMessage = 'Code Resent.'
                : context.showToastMessage =
            'Please check your phone for the verification code.';
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        context.showToastMessage = "Wrong Excpection";
      }
    }
  }
  // verify smsCode Method
  Future<void> onSaveChanges({required BuildContext context}) async {
    if (verificationKey.currentState!.validate()) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(credential);
        Map<String, dynamic> model = {
          'phoneNumber':countryCode+phoneNumber
        };
        await FirebaseUsersData.getInstance.updateSingleField(model);
        user=await getUser;
        context.pop;
        context.showToastMessage = "Phone Changed";
      } catch (e) {
        context.showToastMessage = "Code is Wrong";
        print(e);
      }
    } else {
      context.showToastMessage = AppLocalizations.of(context)!.verficationrequired;
    }
  }

}
