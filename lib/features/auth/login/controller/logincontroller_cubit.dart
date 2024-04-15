import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'logincontroller_state.dart';

class LogincontrollerCubit extends Cubit<LogincontrollerState> {
  LogincontrollerCubit() : super(LogincontrollerInitial());
  TextEditingController emailController =TextEditingController();

  TextEditingController passwordController =TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey();
  late String email;
  late String name;
  late String password;

  void confirmLogin({required BuildContext context}){
    if(formKey.currentState!.validate()){
      email=emailController.text;
      password=passwordController.text;
       // Navigator.pushNamed(context, 'getstarted',);
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

