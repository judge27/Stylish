import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';

part 'logincontroller_state.dart';

class LogincontrollerCubit extends Cubit<LogincontrollerState> {
  LogincontrollerCubit() : super(LogincontrollerInitial());
  TextEditingController emailController =TextEditingController();

  TextEditingController passwordController =TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey();

  void confirmLogin({required BuildContext context}) async{
    if(formKey.currentState!.validate()){
      FireBaseModel.email=emailController.text;
      FireBaseModel.password=passwordController.text;
      try {
        await FireBaseModel().loginUser();
        FireBaseModel().showToast(
            context,
            message: "Success.");
        Navigator.pushNamed(
            context, 'forgotpassword');
      } on FirebaseAuthException catch (e) {
        FireBaseModel().showToast(
            context,
            message:
            'Email or Password is not Correct!');

      } catch (e) {
        print(e);
      }
     }
    else {
      print("invaild inputs");
    }
  }
  void navTOForgotPassword({required BuildContext context}) {
     Navigator.pushNamed(context, 'forgotpassword',);
  }
  void navTORegistration({required BuildContext context}) {
    Navigator.pushNamed(context, 'registration');
  }
   }

