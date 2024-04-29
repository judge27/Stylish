import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/utils/extensions.dart';
import 'package:stylish/core/utils/firebase.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/database_users_data.dart';

part 'registrationcontroller_state.dart';

class RegistrationcontrollerCubit extends Cubit<RegistrationcontrollerState> {
  RegistrationcontrollerCubit() : super(RegistrationcontrollerInitial());

  // key object of the registrationPage form
  GlobalKey<FormState> formKey = GlobalKey();

  // controller object of name textField
  TextEditingController nameController = TextEditingController();

  // controller object of email textField
  TextEditingController emailController = TextEditingController();

  // controller object of password textField
  TextEditingController passwordController = TextEditingController();

  // password showen & hiden variable
  bool obscurePassword = true;

  // Show & Hide Password Method
  void togglePassword(){
    obscurePassword = !obscurePassword;
    emit(RegistrationcontrollerSecured());
  }

  // Register User Method
  void confirmRegistration(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      FireBaseModel.instance.email = emailController.text;
      FireBaseModel.instance.password = passwordController.text;
      FireBaseModel.instance.name=nameController.text;
      try {
        await (await DatabaseUsersData.getInstance).insert(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text);
         await FireBaseModel.instance.createUser(context: context);
        log("*********${nameController.text}****************");
        log("*********${emailController.text}****************");
        log("*********${passwordController.text}****************");
        log("*********inserted  sucessfully****************");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          context.showToastMessage = "The password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          context.showToastMessage =
              "The account already exists for that email.";
        }
      } catch (e) {
        print(e);
      }
    }
  }
  // Register With Google Account Method
  Future<void> handleGoogleSignin({required BuildContext context}) async {
    await FireBaseModel.instance.handleGoogleSignIn(context: context);
  }
  // Logout From Google Account Method
  Future<void> handleGoogleSignout({required BuildContext context}) async {
    await FireBaseModel.instance.handleGoogleSignout(context: context);
  }



}
