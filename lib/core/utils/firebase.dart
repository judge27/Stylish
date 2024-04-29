import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/features/auth/phonenumber/controller/phonenumbercontroller_cubit.dart';

class FireBaseModel {
  static FireBaseModel _instance= FireBaseModel._init();
  FireBaseModel._init();
  final FirebaseAuth _auth = FirebaseAuth.instance;

   String name="";

   String email="";

   String password="";

   String phonenumber="";

   String? verificationId = "";

   Uint8List? image ;

  bool resendCode = false;


 static FireBaseModel get instance {
  _instance??=FireBaseModel._init();
  return _instance;
 }

  // check the user login or nullable
  bool checkUserNullable() {
    final user= _auth.currentUser;
    if (user == null) {
      return true;
    } else {
      return false;
    }
  }



  // Login function with email and password
  Future<void> loginUser({required BuildContext context}) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: _instance.email,
      password: _instance.password,
    );
    context.showToastMessage = "Let's Start Our Journey.";
    Navigator.pushNamedAndRemoveUntil(context,  'getstarted',(_) => true );

  }

  //  email and password  registration method
  Future<void> createUser({required BuildContext context}) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _instance.email,
      password: _instance.password,
    );
    context.showToastMessage = "Email & Password are Registered.";
    context.pushTo='getstarted';
  }

  // google social registration method
  Future<void> handleGoogleSignIn({required BuildContext context}) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    context.showToastMessage= "Google Signed In";
    context.pushTo='getstarted';
  }

  // google social signout method
  Future<void> handleGoogleSignout({required BuildContext context}) async {
    await GoogleSignIn().signOut();
    _auth.signOut();
    context.showToastMessage = "Google Signed Out";
    context.pop;
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
      context.showToastMessage =" Checking ...";
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:_instance.phonenumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          _instance.verificationId = verificationId;
          _instance.resendCode?context.showToastMessage = 'Code Resent.':context.showToastMessage = 'Please check your phone for the verification code.';
          Navigator.pushNamed(context, 'otp', arguments: controller);
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
          verificationId: _instance.verificationId!,
          smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(context,  'getstarted',(_) => false );
      context.showToastMessage ="Phone Verified";

    } catch (e) {
      context.showToastMessage = "Code is Wrong";
      print(e);
    }
  }


  pickImage({required ImageSource source})async{
    final ImagePicker _imagePicker=ImagePicker();
    XFile? _file= await _imagePicker.pickImage(source: source);
    if(_file !=null){
      image=await _file.readAsBytes();
      return image;
    }
 }
}
