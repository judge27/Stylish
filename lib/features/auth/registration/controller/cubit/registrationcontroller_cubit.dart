import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/database_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/repo/firebase_users_data.dart';
import 'package:stylish/features/dashboard/modules/users/model/user_model.dart';

import '../../../../../core/navigation/routes.dart';

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
  void togglePassword() {
    obscurePassword = !obscurePassword;
    emit(RegistrationcontrollerSecured());
  }

  // Register User Method
  void confirmRegistration(BuildContext context) async {

    if (formKey.currentState!.validate()) {
      try {
      final userCredential=await FireBaseModel.instance
            .registerWithEmailAndPassword(context: context,
            email: emailController.text.trim(),
            password: passwordController.text.trim()
        );
      print("************************** Hello World1 **************************");

      final UserModel userModel=UserModel(
          id: userCredential.user!.uid.toString(),
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          profilePicture: 'assets/images/jordan3.png',
          phoneNumber: '',
      );
      print("************************** Hello World2 **************************");

      await FirebaseUsersData.getInstance.saveUserRecord(userModel);
      print("************************** Hello World5 **************************");

      context.showToastMessage = "Accepted Registration.";
        Navigator.pushNamed(context, Routes.GETSTARTED);
      }
      catch(_){

      }
    }


    // await (await DatabaseUsersData.getInstance).insert(
    //     name: nameController.text,
    //     email: emailController.text,
    //     password: passwordController.text);
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
