import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';

class FireBaseModel {
  static FireBaseModel _instance = FireBaseModel._init();
  FireBaseModel._init();


  static FireBaseModel get instance {
    _instance ??= FireBaseModel._init();
    return _instance;
  }

  User? get autUser => auth.currentUser;

  // check the user login or nullable
  bool checkUserNullable() {

    if (autUser == null) {
      return true;
    } else {
      return false;
    }
  }

// // Login function with email and password
//   Future<UserCredential> loginWithEmailAndPassword({required BuildContext context,
//     required String email,
//     required String password}) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       context.showToastMessage = e.code;
//       throw(e.code);
//     } catch (_) {
//       context.showToastMessage = 'something went wrong ,please try again';
//       rethrow;
//     }
//
//     context.showToastMessage = "Let's Start Our Journey.";
//     Navigator.pushNamedAndRemoveUntil(context, Routes.GETSTARTED, (_) => true);
//   }
//
//   //  email and password  registration method
//   Future<UserCredential> registerWithEmailAndPassword(
//       {required BuildContext context,required String email ,required String password}) async {
//     try {
//       return await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         context.showToastMessage = "The password provided is too weak.";
//       } else if (e.code == 'email-already-in-use') {
//         context.showToastMessage = "The account already exists for that email.";
//       }
//       throw(e.code);
//     } catch (_) {
//       context.showToastMessage = 'something went wrong ,please try again';
//       rethrow;
//     }
//   }


  // google social registration method
  Future<void> handleGoogleSignIn({required BuildContext context}) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await auth.signInWithCredential(credential);
    context.showToastMessage = "Google Signed In";
    context.pushTo = Routes.GETSTARTED;
  }

  // google social signout method
  Future<void> handleGoogleSignout({required BuildContext context}) async {
    if(!checkUserNullable()) {
      await GoogleSignIn().signOut();
      auth.signOut();
      context.showToastMessage = "Google Signed Out";
    }
  }

  //
  // // verify the phone number method
  // Future<void> verifyPhoneNumber({
  //   required BuildContext context,
  //   required PhonenumbercontrollerCubit controller,
  // }) async {
  //   try {
  //     context.showToastMessage = " Checking ...";
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: _instance.phonenumber,
  //       verificationCompleted: (PhoneAuthCredential credential) {},
  //       verificationFailed: (FirebaseAuthException e) {},
  //       codeSent: (String verificationId, int? resendToken) async {
  //         _instance.verificationId = verificationId;
  //         _instance.resendCode
  //             ? context.showToastMessage = 'Code Resent.'
  //             : context.showToastMessage =
  //                 'Please check your phone for the verification code.';
  //         Navigator.pushNamed(context, Routes.VERIFICATION,
  //             arguments: controller);
  //         Map<String, dynamic> model = {
  //         'Name': name,
  //         'Email': email,
  //         'Password': password,
  //         'ProfilePicture': '',
  //         'PhoneNumber':_instance.phonenumber,
  //         };
  //         await FirebaseUsersData.getInstance.updateSingleField(model);
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } catch (e) {
  //     context.showToastMessage = "Wrong Excpection";
  //   }
  // }

  // // verifiy smsCode method
  // Future<void> verifySmsCode({
  //   required BuildContext context,
  //   required String smsCode,
  // }) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: _instance.verificationId!, smsCode: smsCode);
  //     await _auth.signInWithCredential(credential);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, Routes.GETSTARTED, (_) => false);
  //     context.showToastMessage = "Phone Verified";
  //   } catch (e) {
  //     context.showToastMessage = "Code is Wrong";
  //     print(e);
  //   }
  // }

}
