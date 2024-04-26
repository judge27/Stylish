import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';

part 'logincontroller_state.dart';

class LogincontrollerCubit extends Cubit<LogincontrollerState> {
  LogincontrollerCubit() : super(LogincontrollerInitial());

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void confirmLogin({required BuildContext context}) async {
    if (formKey.currentState!.validate()) {
      FireBaseModel.getInstance().email = emailController.text;
      FireBaseModel.getInstance().password = passwordController.text;
      try {
        await FireBaseModel.getInstance().loginUser();
        FireBaseModel.getInstance()
            .showToast(context, message: "Let's Start Our Journey.");
        Navigator.pushNamed(context, 'getstarted');
      } on FirebaseAuthException catch (e) {
        FireBaseModel.getInstance()
            .showToast(context, message: 'Email or Password is not Correct!');
      } catch (e) {
        print(e);
      }
    } else {
      print("invaild inputs");
    }
  }

  void navTOForgotPassword({required BuildContext context}) {
    Navigator.pushNamed(context, 'forgotpassword',);
  }

  void navTORegistration({required BuildContext context}) {
    Navigator.pushNamed(context, 'registration');
  }

  Future<void> handleGoogleSignin({required BuildContext context}) async {
    await FireBaseModel.getInstance().handleGoogleSignIn();
    FireBaseModel.getInstance().showToast(context, message: "Success");
    Navigator.pushNamed(context,"getstarted");
  }

  Future<void> handleGoogleSignout({required BuildContext context}) async {
    FireBaseModel.getInstance().handleGoogleSignout(context: context);
    FireBaseModel().showToast(context, message: "Success");
  }
}
