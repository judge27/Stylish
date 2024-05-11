import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

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
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId!, smsCode: smsCode);
        await auth.signInWithCredential(credential);
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.GETSTARTED, (_) => false);
        context.showToastMessage = "Phone Verified";
      } catch (e) {
        context.showToastMessage = "Code is Wrong";
        print(e);
      }
    } else {

          context.showToastMessage = AppLocalizations.of(context)!.verficationrequired;
    }
  }
  // resend smsCode method
  Future<void> onResendCode(
      {required BuildContext context,
      required PhonenumbercontrollerCubit phoneNumberController}) async {
    if (resendCode) {
      await auth.verifyPhoneNumber(
        phoneNumber:phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          verificationId = verificationId;
          resendCode
              ? context.showToastMessage = AppLocalizations.of(context)!.coderesent
              : context.showToastMessage =
          'Please check your phone for the verification code.';
          Navigator.pushNamed(context, Routes.VERIFICATION,
              arguments: phoneNumberController);
          Map<String, dynamic> model = {
            'PhoneNumber':phoneNumber,
          };
          await FirebaseUsersData.getInstance.updateSingleField(model);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
     context.showToastMessage =  AppLocalizations.of(context)!.cannotresendcode;
    }
  }
}
