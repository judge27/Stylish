import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stylish/core/utils/navigation.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';

class FireBaseModel {
  static late String name;
  static late String email;
  static late String password;
  static late String phonenumber;

  //  snackBar with Custom Message
  void showToast(BuildContext context, {required String message}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xFFF83758),
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }

  // Login function with email and password
  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  //  email and password  registration method
  Future<void> createUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  // google social registration method
  Future<void> handleGoogleSignIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // send a password reset email to a user
  Future<void> resetPassword() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
// check the user login or nullable
  bool checkUserNullable() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return true;
    } else {
      return false;
    }
  }
// verify the phone number method
  Future<void> verifyPhoneNumber(
      {required BuildContext context,
      required VerificationcontrollerCubit controller}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phonenumber,
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        controller.verifiy = verificationId;
        Navigator.pushNamed(context, 'otp');
      },
    );
  }
}
