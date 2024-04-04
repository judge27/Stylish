import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthModel {
  static String? email;
  static String? password;
  static String? password2;

  static void showSnackBar(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: AuthModel.email!,
      password: AuthModel.password!,
    );
  }

  static Future<void> createUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: AuthModel.email!,
      password: AuthModel.password!,
    );
  }
  static Future<void> handleGoogleSignIn() async {
    GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken:googleAuth?.idToken
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

  }
}
