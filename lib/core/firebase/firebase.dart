import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/navigation/routes.dart';
import 'package:stylish/features/auth/phonenumber/controller/cubit/phonenumbercontroller_cubit.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';

import 'firebase_options.dart';

class FireBaseModel {
  static FireBaseModel _instance = FireBaseModel._init();
  FireBaseModel._init();


  static FireBaseModel get instance {
    _instance ??= FireBaseModel._init();
    return _instance;
  }


  final _auth = FirebaseAuth.instance;




  String name = "";

  String email = "";

  String password = "";

  String phonenumber = "";

  String? verificationId = "";
  String constImage="";
  Uint8List? image;

  bool resendCode = false;


  User? get autUser => _auth.currentUser;

  // check the user login or nullable
  bool checkUserNullable() {

    if (autUser == null) {
      return true;
    } else {
      return false;
    }
  }

  // Login function with email and password
  Future<UserCredential> loginWithEmailAndPassword({required BuildContext context,
    required String email,
    required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      context.showToastMessage = '${e.code}';
      throw(e.code);
    } catch (_) {
      context.showToastMessage = 'something went wrong ,please try again';
      throw(_);
    }

    context.showToastMessage = "Let's Start Our Journey.";
    Navigator.pushNamedAndRemoveUntil(context, Routes.GETSTARTED, (_) => true);
  }

  //  email and password  registration method
  Future<UserCredential> registerWithEmailAndPassword(
      {required BuildContext context,required String email ,required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        context.showToastMessage = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        context.showToastMessage = "The account already exists for that email.";
      }
      throw(e.code);
    } catch (_) {
      context.showToastMessage = 'something went wrong ,please try again';
      throw(_);
    }
  }

  // google social registration method
  Future<void> handleGoogleSignIn({required BuildContext context}) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    context.showToastMessage = "Google Signed In";
    context.pushTo = Routes.GETSTARTED;
  }

  // google social signout method
  Future<void> handleGoogleSignout({required BuildContext context}) async {
    await GoogleSignIn().signOut();
    _auth.signOut();
    context.showToastMessage = "Google Signed Out";
    // context.pop;
  }

  // send a password reset email to a user
  Future<void> resetPassword() async {
    await _auth.sendPasswordResetEmail(email: _instance!.email);
  }

  // verify the phone number method
  Future<void> verifyPhoneNumber({
    required BuildContext context,
    required PhonenumbercontrollerCubit controller,
  }) async {
    try {
      context.showToastMessage = " Checking ...";
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _instance.phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) async {
          _instance.verificationId = verificationId;
          _instance.resendCode
              ? context.showToastMessage = 'Code Resent.'
              : context.showToastMessage =
                  'Please check your phone for the verification code.';
          Navigator.pushNamed(context, Routes.VERIFICATION,
              arguments: controller);
          Map<String, dynamic> model = {
          'Name': name,
          'Email': email,
          'Password': password,
          'ProfilePicture': '',
          'PhoneNumber':_instance.phonenumber,
          };
          await FirebaseUsersData.getInstance.updateSingleField(model);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      context.showToastMessage = "Wrong Excpection";
    }
  }

  // verifiy smsCode method
  Future<void> verifySmsCode({
    required BuildContext context,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _instance.verificationId!, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.GETSTARTED, (_) => false);
      context.showToastMessage = "Phone Verified";
    } catch (e) {
      context.showToastMessage = "Code is Wrong";
      print(e);
    }
  }

  pickImage({required ImageSource source}) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      image = await _file.readAsBytes();
      return image;
    }
  }
}
