import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/core/utils/validation.dart';

part 'verificationcontroller_state.dart';

class VerificationcontrollerCubit extends Cubit<VerificationcontrollerState> {
  VerificationcontrollerCubit() : super(VerificationcontrollerInitial());

  GlobalKey<FormState> formKey=GlobalKey();

  TextEditingController phoneController=TextEditingController();
  String temp='';
  String verifiy="";


  void confirmSubmitPhoneNumber({required BuildContext context,required VerificationcontrollerCubit controller}){
    if (formKey.currentState!.validate()){
      String phone=phoneController.text;
      phoneController.text=temp+phone;
      FireBaseModel.phonenumber=phoneController.text;
      FireBaseModel().verifyPhoneNumber(context:context,controller:controller);
      Navigator.pushNamed(context, 'otp');

    }
  }
  Future<void> confirmVerification({required BuildContext context,var code})async{
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        timeout: const Duration(seconds: 120),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
        },
          codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode =code;

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
        verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      );
      Navigator.pushNamed(context, 'login');
    }
    on FirebaseAuthException catch(e){
      print(e);
    }

  }



}
