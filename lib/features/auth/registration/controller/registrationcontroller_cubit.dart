
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'registrationcontroller_state.dart';

class RegistrationcontrollerCubit extends Cubit<RegistrationcontrollerState> {
  RegistrationcontrollerCubit() : super(RegistrationcontrollerInitial());

  TextEditingController nameController =TextEditingController();

  TextEditingController emailController =TextEditingController();

  TextEditingController passwordController =TextEditingController();

  GlobalKey<FormState> formKey =GlobalKey();
  late String email;
  late String name;
  late String password;

  void confirmRegistration(BuildContext context){
    if(formKey.currentState!.validate()){
        email=emailController.text;
        password=passwordController.text;
        name=nameController.text;
        Navigator.pushNamed(context, 'login',arguments: nameController.text);
    }
    else {
      print("invaild inputs");
    }
  }
}
