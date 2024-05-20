
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stylish/core/constants/constants.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/firebase/firebase.dart';
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

  // Register with  email and password  method
  void confirmRegistration(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        final UserModel userModel = UserModel(
          id: userCredential.user!.uid.toString(),
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          profilePicture: 'https://firebasestorage.googleapis.com/v0/b/stylish-temp.appspot.com/o/default_avatar.png?alt=media&token=fa3dbdd2-7e9e-4ac1-92c5-ec2b4fef60bb',
          phoneNumber: '',
          admin: false,
        );
        user=userModel;
        await FirebaseUsersData.getInstance.saveUserRecord(userModel);
        context.showToastMessage = "Accepted Registration.";
        Navigator.pushNamed(context, Routes.GETSTARTED);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          context.showToastMessage = "The password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          context.showToastMessage = "The account already exists for that email.";
        }
        throw(e.code);
      } catch (_) {
        context.showToastMessage = 'something went wrong ,please try again';
        rethrow;
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
