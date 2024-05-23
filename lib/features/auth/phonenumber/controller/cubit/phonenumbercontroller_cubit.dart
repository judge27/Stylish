import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/core/utils/validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

part 'phonenumbercontroller_state.dart';

class PhonenumbercontrollerCubit extends Cubit<PhonenumbercontrollerState> {
  PhonenumbercontrollerCubit() : super(PhonenumbercontrollerInitial());

  // key object of the phoneNumber page form
  GlobalKey<FormState> phoneKey = GlobalKey();

  //  // controller object of phone textField
  TextEditingController phoneController = TextEditingController();



  // verify the phone number method
  void confirmSubmitPhoneNumber(
      {required BuildContext context,
      required PhonenumbercontrollerCubit phoneNumberController}) async {
    if (Validation.instance
        .validatePhone(context: context, value: phoneController.text))
    {
      try {
        phoneNumber= phoneController.text;
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
            Navigator.pushNamed(context, Routes.VERIFICATION,
                arguments: phoneNumberController);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        context.showToastMessage = "Wrong Excpection";
      }
    }
  }
}
