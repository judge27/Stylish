
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';

class FireBaseModel {
  static late String name;
  static late String email;
  static late String password;
  static late String phonenumber;
  static late String code;
  static late int token;
  FirebaseAuth auth = FirebaseAuth.instance;

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
    final credential = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  //  email and password  registration method
  Future<void> createUser() async {
    final credential = await auth.createUserWithEmailAndPassword(
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
    UserCredential userCredential = await auth.signInWithCredential(credential);
  }

  // send a password reset email to a user
  Future<void> resetPassword() async {
    await auth.sendPasswordResetEmail(email: email);
  }

// check the user login or nullable
  bool checkUserNullable() {
    final user = auth.currentUser;
    if (user == null) {
      return true;
    } else {
      return false;
    }
  }

  // verify the phone number method
  Future<void> verifyPhoneNumber({
    required BuildContext context,
    required VerificationcontrollerCubit controller,
  }) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      controller.message = phoneAuthCredential.smsCode ?? "";
      controller.verificationController.text = controller.message;
      await auth.signInWithCredential(phoneAuthCredential);
      showToast(context,
          message:
              'Phone number automatically verified and user signed in: $phoneAuthCredential');
    };

    ///This is the code snippet which [detects the code from sms automatically]

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      controller.message =
          'Phone number verification failed. Code: ${authException.code}. '
          'Message: ${authException.message}';
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      showToast(context,
          message: 'Please check your phone for the verification code.');
      controller.verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      controller.verificationId = verificationId;
    };

    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          timeout: const Duration(seconds: 120),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showToast(context, message: 'Time out to Verify Phone Number: $e');
    }
  }

  // verifiy smsCode method
  Future<void> verifyCode({
    required BuildContext context,
    required VerificationcontrollerCubit controller,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: controller.verificationId,
        smsCode: controller.verificationController.text,
      );
      final User user = (await auth.signInWithCredential(credential)).user!;
      showToast(context, message: 'Successfully signed in UID: ${user.uid}');
    } catch (e) {
      print(e);
      showToast(context, message: 'Failed to sign in');
    }
  }
}
