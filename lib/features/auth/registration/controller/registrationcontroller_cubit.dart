

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/firebase.dart';

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

  void confirmRegistration(BuildContext context) async{
    if(formKey.currentState!.validate()){
        FireBaseModel.email=emailController.text;
        FireBaseModel.password=passwordController.text;
        name=nameController.text;
        try {
          await FireBaseModel().createUser();
          FireBaseModel().showToast(context,
              message: "Success.");
          Navigator.pushNamed(
              context, 'login',arguments: '');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            FireBaseModel().showToast(context,
                message:
                "The password provided is too weak.");
          } else if (e.code ==
              'email-already-in-use') {
           FireBaseModel().showToast(context,
                message:
                "The account already exists for that email.");
          }
        } catch (e) {
          print(e);
        }
       }
    else {
      print("invaild inputs");
    }
  }
}
