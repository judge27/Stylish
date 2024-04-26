import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stylish/features/auth/phonenumber/controller/phonenumbercontroller_cubit.dart';
import 'package:stylish/features/auth/verification/controller/verificationcontroller_cubit.dart';

class FireBaseModel {
  static FireBaseModel _instance =FireBaseModel();
  _FireBaseModel(){}
 final FirebaseAuth _auth = FirebaseAuth.instance;

   late String name;

   late String email;

   late String password;

   late String phonenumber;

   late String verificationId = "";

    bool resendCode=false;

  static FireBaseModel getInstance(){
    return _instance;
  }

  // check the user login or nullable
  bool checkUserNullable() {
    final user = _auth.currentUser;
    if (user == null) {
      return true;
    } else {
      return false;
    }
  }

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
    final credential = await _auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  //  email and password  registration method
  Future<void> createUser() async {
    final credential = await _auth.createUserWithEmailAndPassword(
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
    UserCredential userCredential = await _auth.signInWithCredential(credential);
  }

  // google social signout method
  Future<void> handleGoogleSignout({required BuildContext context})async{
    await GoogleSignIn().signOut();
    _auth.signOut();
  }


  // send a password reset email to a user
  Future<void> resetPassword() async {
    await _auth.sendPasswordResetEmail(email: email);
  }



  // verify the phone number method
  Future<void> verifyPhoneNumber({
    required BuildContext context,
    required PhonenumbercontrollerCubit controller,
  }) async {
    try {
      FireBaseModel.getInstance().showToast(context, message: "Checking...");
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:  FireBaseModel.getInstance().phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          FireBaseModel.getInstance().verificationId = verificationId;
          FireBaseModel.getInstance().showToast(context,
              message: 'Please check your phone for the verification code.');
          Navigator.pushNamed(context, 'otp',arguments: controller);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      FireBaseModel.getInstance().showToast(context, message: "Wrong Excpection");
    }
  }

  // verifiy smsCode method
  Future<void> verifySmsCode({
    required BuildContext context,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: FireBaseModel.getInstance().verificationId, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, 'getstarted');
      FireBaseModel.getInstance().showToast(context, message: "Phone Verified");
    } catch (e) {
      FireBaseModel.getInstance().showToast(context, message: "Code is Wrong");
      print(e);
    }

  }
}
